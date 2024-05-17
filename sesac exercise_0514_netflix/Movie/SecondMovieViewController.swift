//
//  SecondMovieViewController.swift
//  sesac exercise_0514_netflix
//
//  Created by Joy Kim on 5/16/24.
//

import UIKit

class SecondMovieViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var firstBtn: UIButton!
    @IBOutlet var secondBtn: UIButton!
    @IBOutlet var thirdBtn: UIButton!
    @IBOutlet var mainTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //버튼 3가지 기본 배경색 & 폰트색 설정
        firstBtn.backgroundColor = .systemPink
        firstBtn.titleLabel?.textColor = .black
        
        secondBtn.backgroundColor = .systemPink
        secondBtn.titleLabel?.textColor = .black
        
        thirdBtn.backgroundColor = .systemPink
        thirdBtn.titleLabel?.textColor = .black
        
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




