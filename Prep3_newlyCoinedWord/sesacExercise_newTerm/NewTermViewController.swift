//
//  NewTermViewController.swift
//  sesacExercise_newTerm
//
//  Created by Joy Kim on 5/20/24.
//

/* 과제: 신조어 검색 앱 만들기.
1. 신조어 서치 5~10개 : 구현 ok
2. 텍스트필드, 버튼, 레이블로 뷰객체 추가 & 코드로 UI 다듬기 : 구현 ok
3. 키보드 내리기: tap gesture 실행 시 액션 : 구현 ok
4. 검색 실행: 텍스트필드의 검색 버튼 or 키보드 리턴키: 구현 ok
5. 검색 결과: 메인 label 표기 (결과 없을 경우 결과가 없습니다. label 보여주기) : 구현 ok
6. 버튼 4개에 추천 검색어 보여주기 : 구현 ok -> 값 겹치지 않도록 설정 재시도 예정
7. enum & switch 구문으로 변경 구현 재시도 예정
 
 */


import UIKit

class NewTermViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var mainTextFieldButton: UIButton!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet var searchedTermBtnList : [UIButton]!
    
    // 신조어 배열
    let newTermDictionary: [String: String] = ["삼귀다": "사귀기 바로 전 단계", "내또출": "내일 또 출근함", "꾸웨엑": "후회해", "맛꿀마": "JMT 대신 요새는 맛꿀마!", "폭룡적": "쩐다 대신 폭룡적!"]
    let newTerm = ["삼귀다", "내또출", "꾸웨엑", "맛꿀마","폭룡적"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 텍스트 델리게이트 설정
        mainTextField.delegate = self
        
        // 화면 켜지자마자 키보드 띄우기
        mainTextField.becomeFirstResponder()
        
        
        
        setUp()
        
        
        
    }
    
    // UI 설정 메소드
    func setUp() {
        // 텍스트필드 UI 설정
        mainTextField.layer.borderWidth = 3
        mainTextField.layer.borderColor = UIColor.black.cgColor
        mainTextField.keyboardType = .default
        mainTextField.placeholder = "신조어를 입력하세요"
        mainTextField.clearButtonMode = .whileEditing
        
        // 텍스트필드 검색 버튼 UI 설정
        mainTextFieldButton.backgroundColor = .black
        mainTextFieldButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        mainTextFieldButton.tintColor = .white
        
        mainLabel.textAlignment = .center
        
        // 이전검색어 버튼 UI
        designSearchedTermBtn()
        
    }
    
    
    // 이전검색어 버튼 UI 함수
    func designSearchedTermBtn() {
        
        for i in 0...searchedTermBtnList.count-1 {
            searchedTermBtnList[i].setTitleColor(.black, for: .normal)
            searchedTermBtnList[i].layer.cornerRadius = 10
            searchedTermBtnList[i].layer.borderWidth = 2
            searchedTermBtnList[i].layer.borderColor = UIColor.black.cgColor
            searchedTermBtnList[i].clipsToBounds = true
            // 이걸 어떻게 겹치지 않는 타이틀로만 삽입되게 구현할 수 있을까?
            
                searchedTermBtnList[i].setTitle(newTerm[Int.random(in: 0...newTerm.count - 1)], for: .normal)
          
            
        }
        
    }
    
    
    
    
    // 검색어에 따른 로직 실행 함수 구현 (검색 결과에 따라 레이블 표시- 조건)
    func searchText(){
        
        if newTermDictionary[mainTextField.text ?? "검색 결과가 없습니다."] != nil {
            mainLabel.text = newTermDictionary[mainTextField.text ?? "검색 결과가 없습니다."]
        } else {
            mainLabel.text = "검색 결과가 없습니다"
        }
    }
    
    
    
    
    // 텍스트필드 리턴 버튼 누르면 로직 실행(레이블 로직 실행 함수로 구현)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchText()
        designSearchedTermBtn()
        
        
        // 텍스트필드 검색 버튼 누르면 키보드 내려가기
        mainTextField.resignFirstResponder()
        
        return true
        
    }
    
    // 검색 버튼 누르면 로직 실행(검색 결과에 따라 레이블 표시- 조건 )
    @IBAction func mainTextFieldBtnTapped(_ sender: UIButton) {
        // print("버튼이 클릭 되었습니다.")
        
        searchText()
        designSearchedTermBtn()
        
    }
    
    // 텍스트필드 클릭하면 키보드 올라오기
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    // 탭 누르면 키보드 내려가기
    @IBAction func tabClicked(_ sender: UITapGestureRecognizer) {
        resignFirstResponder()
    }
    
    
    @IBAction func btnOneTapped(_ sender: UIButton) {
        mainLabel.text = newTermDictionary[ searchedTermBtnList[0].currentTitle!]
    }
    
    @IBAction func btnTwoTapped(_ sender: UIButton) {
        mainLabel.text =  newTermDictionary[ searchedTermBtnList[1].currentTitle!]
    }
    
    @IBAction func btnThreeTapped(_ sender: UIButton) {
        mainLabel.text = newTermDictionary[ searchedTermBtnList[2].currentTitle!]
    }
    
    @IBAction func btnFourTapped(_ sender: UIButton) {
        mainLabel.text = newTermDictionary[ searchedTermBtnList[3].currentTitle!]
    }
    
}
    
