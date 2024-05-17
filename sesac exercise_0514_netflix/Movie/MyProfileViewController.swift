//
//  MyProfileViewController.swift
//  sesac exercise_0514_netflix
//
//  Created by Joy Kim on 5/16/24.
//

import UIKit

class MyProfileViewController: UIViewController {

    // UI 속성 구현할 각 뷰객체들의 아웃렛 변수 지정 (IBOutlet 연결)
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var thirdTextField: UITextField!
    @IBOutlet var fourthTextField: UITextField!
    @IBOutlet var fifthTextField: UITextField!
    
    @IBOutlet var addInfoSwitch: UISwitch!
    @IBOutlet var signUpBtn: UIButton!
    
    
    // 앱 실행시 화면에 나타낼 UI 속성 세팅
    override func viewDidLoad() {
        super.viewDidLoad()

        // Placeholder text & textcolor 설정
        firstTextField.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호 입력", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        // text 정렬 설정
        firstTextField.textAlignment = .center
        // 입력될 textcolor 설정
        firstTextField.textColor = .red
        // 텍스트필드 선택하면 팝업될 키보드 유형 설정
        firstTextField.keyboardType = .emailAddress
        // 텍스트필드 테두리 디자인 설정
        firstTextField.borderStyle = .roundedRect
        // 텍스트필드 폰트 사이즈 설정
        firstTextField.font = UIFont.boldSystemFont(ofSize: 15.0)
       
        secondTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호 입력", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        secondTextField.textAlignment = .center
        secondTextField.textColor = .orange
        secondTextField.keyboardType = .default
        secondTextField.borderStyle = .roundedRect
        secondTextField.font = UIFont.boldSystemFont(ofSize: 15.0)
        secondTextField.isSecureTextEntry = true
        
        thirdTextField.attributedPlaceholder = NSAttributedString(string: "닉네임 입력", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        thirdTextField.textAlignment = .center
        thirdTextField.textColor = .yellow
        thirdTextField.keyboardType = .default
        thirdTextField.borderStyle = .roundedRect
        thirdTextField.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        fourthTextField.attributedPlaceholder = NSAttributedString(string: "위치 입력", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        fourthTextField.textAlignment = .center
        fourthTextField.textColor = .green
        fourthTextField.keyboardType = .default
        fourthTextField.borderStyle = .roundedRect
        fourthTextField.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        fifthTextField.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        fifthTextField.textAlignment = .center
        fifthTextField.textColor = .blue
        fifthTextField.keyboardType = .decimalPad
        fifthTextField.borderStyle = .roundedRect
        fifthTextField.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        // 스위치 on/off 상태 설정
        addInfoSwitch.setOn(false, animated: true)
        addInfoSwitch.thumbTintColor = .gray
        addInfoSwitch.onTintColor = .gray
        
        // 버튼 타이틀 & 타이틀 컬러 & 백그라운드 컬러 상태 설정
        signUpBtn.setTitle("회원가입 신청하기", for: .normal)
        signUpBtn.setTitleColor(.magenta, for: .normal)
        signUpBtn.backgroundColor = .lightGray
        signUpBtn.layer.cornerRadius = 5
        // iOS15 이후 새로운 버튼 스타일 나옴. 기존의 default 스타일 버튼이 아니기에 .titleLabel?.font로 폰트 설정 불가능 -> default 버튼으로 변경하는 대신 아래 코드 활용해서 plain 스타일 버튼에서 폰트 설정 가능.
        signUpBtn.configuration?.titleTextAttributesTransformer =
        UIConfigurationTextAttributesTransformer { incoming in
          var outgoing = incoming
          outgoing.font = UIFont.systemFont(ofSize: 15)
          return outgoing
      }
        
    }
    
    // 뷰객체들의 액션 변수 지정 (IBAction 연결) & 실행할 action 함수 설정
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        // 버튼 누르면 상위 텍스트필드들 모두 키보드 내려가게 하기
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
        thirdTextField.resignFirstResponder()
        fourthTextField.resignFirstResponder()
        fifthTextField.resignFirstResponder()
        
        // 버튼 누르면 버튼 컬러 변경하기
        if signUpBtn.backgroundColor == #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1) {
            signUpBtn.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        } else {
            signUpBtn.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
        
        // 버튼 누르면 텍스트 컬러 변경하기
        signUpBtn.setTitleColor(.white, for: .normal)
        }
        
  
    
    @IBAction func addInfoSwitchToggled(_ sender: UISwitch) {
        
        // 추가 정보 입력 스위치 눌릴 때 틴트 컬러 변경 설정
        
        if addInfoSwitch.thumbTintColor == UIColor.white {
            addInfoSwitch.thumbTintColor = .gray
        } else {
            addInfoSwitch.thumbTintColor = .white
        }
        
        addInfoSwitch.onTintColor = .green
    }
    
}
