//
//  moodMainViewController.swift
//  sesacExercise_moodDiary
//
//  Created by Joy Kim on 5/17/24.
//

import UIKit

// 과제: 9가지 감정에 대한 버튼 & 레이블 UI 구현 & 감정 버튼 클릭 횟수 올리기
// 코드 리팩토링: 반복되는 부분을 함수로 구현(와일드카드,매개변수 활용) & IBOutlet 선언을 개별이 아닌 Collection으로 연결 & tag 활용

class moodMainViewController: UIViewController {
    
    // view객체에 넣을 background에 image 변수 선언
    let backgroundImage: UIImage = UIImage(named: "paper_2")!
    
    @IBOutlet weak var mainViewNavigationBarListBtn: UIBarButtonItem!
    
    
    
    // 각자 연결했던  IBOutlet button 변수를 컬렉션으로 구현
    @IBOutlet var btnCollection: [UIButton]!
    
    //    @IBOutlet weak var buttonOne: UIButton!
    //    @IBOutlet weak var buttonTwo: UIButton!
    //    @IBOutlet weak var buttonThree: UIButton!
    //    @IBOutlet weak var buttonFour: UIButton!
    //    @IBOutlet weak var buttonFive: UIButton!
    //    @IBOutlet weak var buttonSix: UIButton!
    //    @IBOutlet weak var buttonSeven: UIButton!
    //    @IBOutlet weak var buttonEight: UIButton!
    //    @IBOutlet weak var buttonNine: UIButton!
    
    // 각자 연결했던 IBOutlet label 변수를 컬렉션으로 구현
    @IBOutlet var labelCollection: [UILabel]!
    
    //    @IBOutlet weak var labelOne: UILabel!
    //    @IBOutlet weak var labelTwo: UILabel!
    //    @IBOutlet weak var labelThree: UILabel!
    //    @IBOutlet weak var labelFour: UILabel!
    //    @IBOutlet weak var labelFIve: UILabel!
    //    @IBOutlet weak var labelSix: UILabel!
    //    @IBOutlet weak var labelSeven: UILabel!
    //    @IBOutlet weak var labelEight: UILabel!
    //    @IBOutlet weak var labelNine: UILabel!
    
    
    // 각각 선언했던 레이블 변수(숫자)를 배열로 구현 (tag 활용할 것)
    var btnLabelNumberArr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    //    var buttonOneNum:Int = 0
    //    var buttonTwoNum:Int = 0
    //    var buttonThreeNum:Int = 0
    //    var buttonFourNum:Int = 0
    //    var buttonFiveNum:Int = 0
    //    var buttonSixNum:Int = 0
    //    var buttonSevenNum:Int = 0
    //    var buttonEightNum:Int = 0
    //    var buttonNineNum:Int = 0
    
    
    
    // 각각 설정했던 버튼 이미지를 배열로 구현해서 버튼 UI세팅 함수로 실행할 것
    let btnImageArr = [UIImage(named: "slime1"), UIImage(named: "slime2"), UIImage(named: "slime3"), UIImage(named: "slime4"), UIImage(named: "slime5"), UIImage(named: "slime6"), UIImage(named: "slime7"), UIImage(named: "slime8"), UIImage(named: "slime9")]
    
    // 각각 설정했던 무드 텍스트를 배열로 구현해서 버튼 UI세팅 함수로 실행할 것
    let moodArr = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "한심해", "심심해", "곤란해", "우울해"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        // 직접 설정했던 레이블 텍스트 삭제 -> 버튼 UI세팅 함수로 실행할 것
     
        for i in btnCollection {
            setBtn(i)
            
        }
        //        labelOne.text = "행복해 0"
        //        labelTwo.text = "사랑해 0"
        //        labelThree.text = "좋아해 0"
        //        labelFour.text = "당황해 0"
        //        labelFIve.text = "속상해 0"
        //        labelSix.text = "한심해 0"
        //        labelSeven.text = "심심해 0"
        //        labelEight.text = "곤란해 0"
        //        labelNine.text = "우울해 0"
        
        //        buttonOne.setBackgroundImage(.slime1, for: .normal)
        //        buttonTwo.setBackgroundImage(.slime2, for: .normal)
        //        buttonThree.setBackgroundImage(.slime3, for: .normal)
        //        buttonFour.setBackgroundImage(.slime4, for: .normal)
        //        buttonFive.setBackgroundImage(.slime5, for: .normal)
        //        buttonSix.setBackgroundImage(.slime6, for: .normal)
        //        buttonSeven.setBackgroundImage(.slime7, for: .normal)
        //        buttonEight.setBackgroundImage(.slime8, for: .normal)
        //        buttonNine.setBackgroundImage(.slime9, for: .normal)
        
        // view객체는 UIColor로 backgroundColor만 설정할 수 있기에 넣고 싶은 배경 이미지를 UIColor(patternImage: UIImage)로 타입변한 시킨 후 삽입하였음
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        
        
        /* issue1: barButtonItem 이미지 변경하는 코드를 실행하면 빌드했을 때 아예 버튼이 보이지 않음
         soution1: 일단 storyboard로 이미지 삽입하고, 코드는 비활성화 해두었음. */
        //mainViewNavigationBarListBtn.image = UIImage(named: "pencil")
        
        /* issue2: button 객체의 사이즈에 딱 맞게 이미지를 넣으려 contentMode 설정 코드를 짰지만 버튼 사이즈에 맞춰 사이즈가 줄어들지 않음
         solution2: backgroundImage로 집어넣었더니 버튼 사이즈에 맞게 자동 조절됨
         solution2-1: setImage로도 버튼 사이즈에 맞게 들어감. 버튼 타입 하나가 plain으로 되어 있어 났던 오류였음.
         이미지 asset도 original 이미지로 바꿔줘야함. 그렇지 않으면 tint color 덮어 씌워져서 실행됨*/
        //buttonOne.imageView?.contentMode = .scaleAspectFit
        
        /* issue3: button 객체의 backgroundImage를 스토리보드가 아닌 코드로 설정하니 반영이 안됨
         solution3: button객체의 스타일을 plain -> default로 변경하고 코드 실행하니 정상반영됨. */
        
    }
    
    // 버튼 UI 세팅 함수 구현. 와일드카드 & 매개변수 활용. 스토리보드에서 각 버튼의 tag를 0~8로 지정해준 후 활용.
    func setBtn(_ sender: UIButton) {
        
        let tag = sender.tag
        
        bringSavedBtnCounts()
        
        sender.setImage(btnImageArr[tag], for: .normal)
        labelCollection[tag].text = "\(moodArr[tag]) \(btnLabelNumberArr[tag])"
        
        
    }
    
    func bringSavedBtnCounts() {
        
        
        
        for i in 0..<btnLabelNumberArr.count {

            
            btnLabelNumberArr[i] = UserDefaults.standard.integer(forKey: "btn\(i + 1)")
        
        }
    }

    
    // 버튼 클릭되었을 때 실행할 액션 함수 구현. 각각의 버튼이 아닌 컬렉션으로 선언한 버튼 배열에 tag를 인덱스로 활용해서 간결하게 구현. print(sender.tag)로 버튼 눌릴 때 tag 잘 실행되는지 확인.
    
    @IBAction func btnTapped(_ sender: UIButton) {
        
        let tag = sender.tag
            btnLabelNumberArr[tag] += 1
        
            labelCollection[tag].text = "\(moodArr[tag]) \(btnLabelNumberArr[tag])"
        
            UserDefaults.standard.set(btnLabelNumberArr[tag], forKey: "btn\(tag + 1)")
            
    }

    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        for i in 0..<btnLabelNumberArr.count {
            UserDefaults.standard.removeObject(forKey: "btn\(i + 1)")
        }
        
        btnLabelNumberArr = Array(repeating: 0, count: btnLabelNumberArr.count) // 클릭 횟수 배열 초기화
            for i in 0..<labelCollection.count {
                labelCollection[i].text = "\(moodArr[i]) \(btnLabelNumberArr[i])" // 레이블 업데이트
            }
           // print("삭제완료")
        
    }
    
    
    
    
    //    @IBAction func btnOne(_ sender: UIButton) {
    //
    //        buttonOneNum += 1
    //        labelOne.text = "행복해 \(buttonOneNum)"
    //
    //    }
    //
    //    @IBAction func btnTwo(_ sender: UIButton) {
    //        buttonTwoNum += 1
    //        labelTwo.text = "사랑해 \(buttonTwoNum)"
    //    }
    //
    //    @IBAction func btnThree(_ sender: UIButton) {
    //        buttonThreeNum += 1
    //        labelThree.text = "좋아해 \(buttonThreeNum)"
    //    }
    //
    //    @IBAction func btnFour(_ sender: UIButton) {
    //        buttonFourNum += 1
    //        labelFour.text = "당황해 \(buttonFourNum)"
    //    }
    //
    //    @IBAction func btnFive(_ sender: UIButton) {
    //        buttonFiveNum += 1
    //        labelFIve.text = "속상해 \(buttonFiveNum)"
    //    }
    //
    //    @IBAction func btnSix(_ sender: UIButton) {
    //        buttonSixNum += 1
    //        labelSix.text = "우울해 \(buttonSixNum)"
    //    }
    //
    //    @IBAction func btnSeven(_ sender: UIButton) {
    //        buttonSevenNum += 1
    //        labelSeven.text = "심심해 \(buttonSevenNum)"
    //    }
    //
    //    @IBAction func btnEight(_ sender: UIButton) {
    //        buttonEightNum += 1
    //        labelEight.text = "곤란해 \(buttonEightNum)"
    //    }
    //
    //    @IBAction func btnNine(_ sender: UIButton) {
    //        buttonNineNum += 1
    //        labelNine.text = "우울해 \(buttonNineNum)"
    //    }
    
    
    
}
