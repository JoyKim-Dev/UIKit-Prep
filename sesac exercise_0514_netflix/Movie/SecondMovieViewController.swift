//
//  SecondMovieViewController.swift
//  sesac exercise_0514_netflix
//
//  Created by Joy Kim on 5/16/24.
//

import UIKit

class SecondMovieViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var firstBtn: UIButton! //생성 시 plain 스타일로 설정되어 있을 것. iOS15+ 버전이라. 그 이전 legacy는 default 스타일 기준임. default 스타일을 다루는 버튼 코드와 plain 스타일 다루는 버튼 코드는 다름.어떤건 되고 어떤건 안됨. 이 부분 많이 헷갈릴 수 있으니 정리 필요.
    // titleLabel?은 default style로 해둘 때만 잘 작동함. 버튼 스타일 스토리보드에서 변경!
    // Image Rendering Mode: template(원본 그대로) vs original(형태만 따옴) image.withRenderingMode() 함수로 사용
    // .tintColor: 안에 내용을 채워줌. 이미지나 컨텐츠 등. 배경색과는 다름! 텍스트필드의 깜빡이는 커서 색을 변환할 때 등에 사용.
    // global Tint 컬러 설정해두면 관련된 tint 컬러 일괄 변경 가능
    
    @IBOutlet var secondBtn: UIButton!
    @IBOutlet var thirdBtn: UIButton!
    @IBOutlet var mainTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //버튼 3가지 기본 배경색 & 폰트색 설정
        firstBtn.backgroundColor = .systemPink
        firstBtn.titleLabel?.textColor = .black
        firstBtn.titleLabel?.font = .boldSystemFont(ofSize: 10)
        //버튼 이미지 가져오기. renderingMode 오리지널로 하면 이미지 변형 없이 잘나옴.
        let image = UIImage(named: "blue")?.withRenderingMode(.alwaysOriginal) // renderingMode로 아예 사용할 asset은 asset inspector쪽에서 설정해둘 수도 있음. 
        firstBtn.setImage(image, for: .normal)
        
        secondBtn.backgroundColor = .systemPink
        secondBtn.titleLabel?.textColor = .black
        secondBtn.titleLabel?.font = .boldSystemFont(ofSize: 10)
        let secondImage = UIImage(named: "pink")?.withRenderingMode(.alwaysOriginal)
        secondBtn.setImage(secondImage, for: .normal)
        
        thirdBtn.backgroundColor = .systemPink
        thirdBtn.titleLabel?.textColor = .black
        thirdBtn.titleLabel?.font = .boldSystemFont(ofSize: 10)

        let thirdImage = UIImage(named: "blue")?.withRenderingMode(.alwaysOriginal)
        thirdBtn.setImage(thirdImage, for: .normal)
        
        // 텍스트필드 placeholder 설정
        // * sf symbol 돋보기 넣기 실패...
        mainTextField.placeholder = " 게임, 시리즈, 영화를 검색하세요"
       
    }
    
    
    @IBAction func firstBtnTapped(_ sender: UIButton) {
     
        // 공개 예정 버튼 눌리면 버튼 배경색 / 폰트색 변경
        firstBtn.titleLabel?.textColor = .black
        firstBtn.backgroundColor = .systemPink
        
        // 공개 예정 버튼 눌리면 아래 레이블 문구 변경
        mainLabel.text = "공개예정인 작품 알려드릴까요"
        
        // 공개 예정 버튼 눌리면 다른 두 버튼 배경색 / 폰트색 변경
        secondBtn.backgroundColor = .none
        secondBtn.titleLabel?.textColor = .white
        thirdBtn.backgroundColor = .none
        thirdBtn.titleLabel?.textColor = .white
    }
   
    
    @IBAction func secondBtnTapped(_ sender: UIButton) {
        secondBtn.backgroundColor = .systemPink
        
        secondBtn.titleLabel?.textColor = .black
        mainLabel.text = "인기 콘텐츠가 없습니다"
        
        firstBtn.backgroundColor = .none
        firstBtn.titleLabel?.textColor = .white
        thirdBtn.backgroundColor = .none
        thirdBtn.titleLabel?.textColor = .white
        
    }
    
    
    @IBAction func thirdBtnTapped(_ sender: UIButton) {
        thirdBtn.backgroundColor = .systemPink
        
        thirdBtn.titleLabel?.textColor = .black
        mainLabel.text = "탑텐 인기 시리즈 페이지입니다"
        firstBtn.backgroundColor = .none
        firstBtn.titleLabel?.textColor = .white
        secondBtn.backgroundColor = .none
        secondBtn.titleLabel?.textColor = .white
        
        
    }
    
    // 텍스트필드 외부 클릭하면 키보드 내려가기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            mainTextField.resignFirstResponder()


    }
}




