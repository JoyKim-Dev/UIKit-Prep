//
//  BMIViewController.swift
//  sesacExercise_BMICalculator
//
//  Created by Joy Kim on 5/21/24.
//

import UIKit

class BMIViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var nicknameLabel: UILabel!
    
    @IBOutlet var firstQuestionLabel: UILabel!
    @IBOutlet var secondQuestionLabel: UILabel!
    
    
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    
    
    @IBOutlet var randomBMIBtn: UIButton!
    @IBOutlet var calcuateBMIBtn: UIButton!
    @IBOutlet var resetBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        nicknameTextField.delegate = self
        
        nicknameTextField.text = UserDefaults.standard.string(forKey: "storedNickname")
        heightTextField.text = UserDefaults.standard.string(forKey: "storedHeight")
        weightTextField.text = UserDefaults.standard.string(forKey: "storedWeight")
        
        
        setUI()
    }
    
    func setUI() {
        // 타이틀레이블, 서브레이블, 키 & 몸무게 텍스트필드, 랜덤버튼, 계산버튼 UI 구현 함수 실행
        designTitleLabelUI()
        designSubtitleLabelUI()
        designBmiInfoTextfield(heightTextField, placeholder: "입력 단위는 cm입니다", keyboardType: .numberPad )
        designBmiInfoTextfield(weightTextField, placeholder: "입력 단위는 kg입니다", keyboardType: .numberPad)
        designBmiInfoTextfield(nicknameTextField, placeholder: "문자만 입력하세요.", keyboardType: .default)
        designRandomBmiBtnUI()
        designbasicBtnBMIBtnUI(calcuateBMIBtn, title: "결과확인")
        designbasicBtnBMIBtnUI(resetBtn, title: "새로 검사해보기")
        firstQuestionLabel.text = "키가 어떻게 되시나요?"
        secondQuestionLabel.text = "몸무게는 어떻게 되시나요?"
        nicknameLabel.text = "닉네임이 어떻게 되시나요?"
        
    }
    
    func designTitleLabelUI() {
        titleLabel.text = "BMI Calculator"
        titleLabel.font = .systemFont(ofSize: 30, weight: .black)
    }
    func designSubtitleLabelUI() {
        subTitleLabel.text = "당신의 BMI 지수를 \n 알려드릴게요."
        subTitleLabel.numberOfLines = 2
        subTitleLabel.font = .systemFont(ofSize: 20)
    }
    func designBmiInfoTextfield(_ l: UITextField, placeholder p : String, keyboardType k:UIKeyboardType) {
        
        l.font = .systemFont(ofSize: 20)
        l.layer.cornerRadius = 10
        l.clipsToBounds = true
        l.backgroundColor = .cyan // *backgroundColor 지정 안되는 오류 발생
        l.keyboardType = k
        l.returnKeyType = .done
        l.textAlignment = .center
        l.borderStyle = .line
        l.layer.borderWidth = 2
        l.layer.borderColor = UIColor.darkGray.cgColor
        l.clearButtonMode = .whileEditing
        l.attributedPlaceholder = NSAttributedString(string: p, attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        weightTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
        nicknameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        weightTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
        nicknameTextField.resignFirstResponder()
    }
    
    func designRandomBmiBtnUI() {
        randomBMIBtn.setTitleColor(.red, for: .normal)
        
    }
    func designbasicBtnBMIBtnUI(_ b:UIButton, title t:String) {
        b.backgroundColor = .purple
        b.setTitle(t, for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 15
        b.clipsToBounds = true
        b.layer.borderColor = .none
    }
    
    func alertSetUp(alertTitle t: String, alertMessage m: String) {
        
        let alert = UIAlertController(title: t, message: m, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "닫기", style: .cancel)
        alert.addAction(cancel)
        present(alert, animated: false)

        
    }
    
    @IBAction func tapGestureKeyboardDown(_ sender: UITapGestureRecognizer) {
    
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        
    }
    @IBAction func calcuateBMIBtnTapped(_ sender: UIButton) {
        /* 로직: BMI 계산값(weight / height^2)을 alert 창에 띄워줌.
         - 키, 몸무게 텍스트필드에 입력된 값으로 활용
         조건 0. 입력된 값의 빈칸을 지워주는 변수로 활용
         
         조건 1. 입력된 값이 있는지 확인(옵셔널 바인딩) -> 없을 경우 버튼 타이틀: "값을 입력하세요"
         조건 2. 입력된 값이 숫자인지 확인 -> 숫자로 변환이 안될 경우 버튼 타이틀: "숫자를 입력하세요"
         조건 3. 입력된 값의 숫자 범위 확인 (30보다 크고 200보다 작게) -> 범위 벗어날 경우 버튼 타이틀: "지나치게 작거나 큰 숫자를 입력하셨습니다."
         */
        
//        let height:String? = heightTextField.text
//        let weight:String? = weightTextField.text
        
        guard let height = heightTextField.text,
              let weight = weightTextField.text,
              height != "",
              weight != "",
              height.count < 4,
              weight.count < 4 else {
            
            alertSetUp(alertTitle: "치명적오류", alertMessage: "입력값을 다시 확인하세요.")
            return
              }
        
        guard let height = Double(height.trimmingCharacters(in: .whitespaces)),
              let weight = Double(weight.trimmingCharacters(in: .whitespaces)) else {
            
            alertSetUp(alertTitle: "에러발생!", alertMessage: "숫자를 입력해주세요.")
            return
        }
        
        let bmi = Int(round(weight / (height * height) * 10000))
        alertSetUp(alertTitle: "BMI결과가 나왔습니다!", alertMessage: "BMI: \(bmi)")
        
        guard let nickname = nicknameTextField.text else {
            print("닉네임은 nil")
            return
        }
        
       
        
        
        UserDefaults.standard.set(height, forKey: "storedHeight")
        UserDefaults.standard.set(weight, forKey: "storedWeight")
        UserDefaults.standard.set(nickname, forKey: "storedNickname")
        print("저장완료")
        
//        if height != "" && weight != "" {
//            if let height = Double(height!.trimmingCharacters(in: .whitespaces)), let weight = Double(weight!.trimmingCharacters(in: .whitespaces)) {
//                if height > 0 && height < 300, weight > 0 && weight < 300 {
//                    let bmi = Int(round(weight / (height * height) * 10000))
//                    //calcuateBMIBtn.setTitle("BMI: \(bmi)", for: .normal)
////                    let alert = UIAlertController(title: "BMI 결과", message: "BMI: \(bmi)", preferredStyle: .alert)
////                    let cancel = UIAlertAction(title: "닫기", style: .cancel)
////                    alert.addAction(cancel)
////                    present(alert, animated: false)
//                    alertSetUp(alertTitle: "BMI결과가 나왔습니다!", alertMessage: "BMI: \(bmi)")
//                   
//                } else {
//                   // calcuateBMIBtn.setTitle("너무 작거나 큰 숫자를 입력했습니다.", for: .normal)
////                    let alert = UIAlertController(title: "BMI 결과", message: "너무 작거나 큰 숫자를 입력했습니다.", preferredStyle: .alert)
////                    let cancel = UIAlertAction(title: "닫기", style: .cancel)
////                    alert.addAction(cancel)
////                    present(alert, animated: false)
//                    alertSetUp(alertTitle: "에러발생!", alertMessage: "너무 작거나 큰 숫자를 입력했습니다.")
//                }
//            } else {
////                  calcuateBMIBtn.setTitle("숫자를 입력해주세요.", for: .normal)
////                let alert = UIAlertController(title: "BMI 결과", message: "숫자를 입력해주세요.", preferredStyle: .alert)
////                let cancel = UIAlertAction(title: "닫기", style: .cancel)
////                alert.addAction(cancel)
////                present(alert, animated: false)
//                alertSetUp(alertTitle: "에러발생!", alertMessage: "숫자를 입력해주세요.")
//            }
//        } else {
//            //calcuateBMIBtn.setTitle("입력값이 없습니다.", for: .normal)
////            let alert = UIAlertController(title: "BMI 결과", message: "입력값이 없습니다.", preferredStyle: .alert)
////            let cancel = UIAlertAction(title: "닫기", style: .cancel)
////            alert.addAction(cancel)
////            present(alert, animated: false)
//            alertSetUp(alertTitle: "치명적오류", alertMessage: "입력값이 없습니다.")
//        }
        
        
        //        if let heightText = heightTextField.text, let weightText = weightTextField.text {
        //            if let height = Double(heightText), let weight = Double(weightText) {
        //                let height = height
        //                let weight = weight
        //                if height > 0 && height < 300, weight > 0 && weight < 300 {
        //                    let bmi = round(weight / (height * height) * 10000)
        //                    calcuateBMIBtn.setTitle("BMI: \(Int(bmi))", for: .normal)
        //                } else {
        //                    calcuateBMIBtn.setTitle("너무 작거나 큰 숫자를 입력했습니다.", for: .normal)
        //                }
        //            } else {
        //                calcuateBMIBtn.setTitle("숫자를 입력해주세요.", for: .normal)
        //            }
        //        } else {
        //            calcuateBMIBtn.setTitle("입력값이 없습니다.", for: .normal)
        //        }
        
    }
    @IBAction func randomCaculatorTapped(_ sender: UIButton) {
        /* 로직: BMI 계산 값을 alert 창에 띄워줌.
         - 키, 몸무게 값을 Int.random()으로 변수 생성 -> Int로 나누면 몫만 나오기 때문에 Double로 생성한 후 소수점 없애고 싶으면 Round로 소수 뒤자리 뗀 후 Int로 타입 변환하여 나타내면 됨.
         */
        
        let weight = Double.random(in: 40...100)
        let height = Double.random(in: 100...200)
        let bmi = Int(round(weight / (height * height) * 10000))
        //calcuateBMIBtn.setTitle("BMI: \(bmi)", for: .normal)
        alertSetUp(alertTitle: "랜덤 BMI 결과입니다!", alertMessage: "BMI: \(bmi)")
        
    }
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "storedHeight")
        UserDefaults.standard.removeObject(forKey: "storedWeight")
        UserDefaults.standard.removeObject(forKey: "storedNickname")
        
        nicknameTextField.text = UserDefaults.standard.string(forKey: "storedNickname")
        heightTextField.text = UserDefaults.standard.string(forKey: "storedHeight")
        weightTextField.text = UserDefaults.standard.string(forKey: "storedWeight")
        print("삭제완료")
        
        
    }
    
    
    }
