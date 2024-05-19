//
//  moodMainViewController.swift
//  sesacExercise_moodDiary
//
//  Created by Joy Kim on 5/17/24.
//

import UIKit

// 과제: 9가지 감정에 대한 버튼 & 레이블 UI 구현 & 감정 버튼 클릭 횟수 올리기

class moodMainViewController: UIViewController {
    
    // view객체에 넣을 background에 image 변수 선언
    let backgroundImage: UIImage = UIImage(named: "paper_2")!
    
    @IBOutlet weak var mainViewNavigationBarListBtn: UIBarButtonItem!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFIve: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    
    var buttonOneNum:Int = 0
    var buttonTwoNum:Int = 0
    var buttonThreeNum:Int = 0
    var buttonFourNum:Int = 0
    var buttonFiveNum:Int = 0
    var buttonSixNum:Int = 0
    var buttonSevenNum:Int = 0
    var buttonEightNum:Int = 0
    var buttonNineNum:Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelOne.text = "행복해 0"
        labelTwo.text = "사랑해 0"
        labelThree.text = "좋아해 0"
        labelFour.text = "당황해 0"
        labelFIve.text = "속상해 0"
        labelSix.text = "한심해 0"
        labelSeven.text = "심심해 0"
        labelEight.text = "곤란해 0"
        labelNine.text = "우울해 0"
   
        
        // view객체는 UIColor로 backgroundColor만 설정할 수 있기에 넣고 싶은 배경 이미지를 UIColor(patternImage: UIImage)로 타입변한 시킨 후 삽입하였음
        
      self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        
     
        /* issue1: barButtonItem 이미지 변경하는 코드를 실행하면 빌드했을 때 아예 버튼이 보이지 않음
           soution1: 일단 storyboard로 이미지 삽입하고, 코드는 비활성화 해두었음. */
        //mainViewNavigationBarListBtn.image = UIImage(named: "pencil")
        
        /* issue2: button 객체의 사이즈에 딱 맞게 이미지를 넣으려 contentMode 설정 코드를 짰지만 버튼 사이즈에 맞춰 사이즈가 줄어들지 않음
           solution2: backgroundImage로 집어넣었더니 버튼 사이즈에 맞게 자동 조절됨*/
        //buttonOne.imageView?.contentMode = .scaleAspectFit
        
        /* issue3: button 객체의 backgroundImage를 스토리보드가 아닌 코드로 설정하니 반영이 안됨
           solution3: button객체의 스타일을 plain -> default로 변경하고 코드 실행하니 정상반영됨. */
        
        buttonOne.setBackgroundImage(.slime1, for: .normal)
        buttonTwo.setBackgroundImage(.slime2, for: .normal)
        buttonThree.setBackgroundImage(.slime3, for: .normal)
        buttonFour.setBackgroundImage(.slime4, for: .normal)
        buttonFive.setBackgroundImage(.slime5, for: .normal)
        buttonSix.setBackgroundImage(.slime6, for: .normal)
        buttonSeven.setBackgroundImage(.slime7, for: .normal)
        buttonEight.setBackgroundImage(.slime8, for: .normal)
        buttonNine.setBackgroundImage(.slime9, for: .normal)
  
        
        
        
        
    }
    
    
    @IBAction func btnOne(_ sender: UIButton) {
        
        buttonOneNum += 1
        labelOne.text = "행복해 \(buttonOneNum)"
        
    }
    
    @IBAction func btnTwo(_ sender: UIButton) {
        buttonTwoNum += 1
        labelTwo.text = "사랑해 \(buttonTwoNum)"
    }
    
    @IBAction func btnThree(_ sender: UIButton) {
        buttonThreeNum += 1
        labelThree.text = "좋아해 \(buttonThreeNum)"
    }
    
    @IBAction func btnFour(_ sender: UIButton) {
        buttonFourNum += 1
        labelFour.text = "당황해 \(buttonFourNum)"
    }
    
    @IBAction func btnFive(_ sender: UIButton) {
        buttonFiveNum += 1
        labelFIve.text = "속상해 \(buttonFiveNum)"
    }
    
    @IBAction func btnSix(_ sender: UIButton) {
        buttonSixNum += 1
        labelSix.text = "우울해 \(buttonSixNum)"
    }
    
    @IBAction func btnSeven(_ sender: UIButton) {
        buttonSevenNum += 1
        labelSeven.text = "심심해 \(buttonSevenNum)"
    }
    
    @IBAction func btnEight(_ sender: UIButton) {
        buttonEightNum += 1
        labelEight.text = "곤란해 \(buttonEightNum)"
    }
    
    @IBAction func btnNine(_ sender: UIButton) {
        buttonNineNum += 1
        labelNine.text = "우울해 \(buttonNineNum)"
    }
}
    
   
    
    
    



        
       
    

  

