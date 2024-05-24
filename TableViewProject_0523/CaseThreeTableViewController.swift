//
//  CaseThreeTableViewController.swift
//  TableViewProject_0523
//
//  Created by Joy Kim on 5/24/24.
//

import UIKit


/* UIView + 텍스트필드: ph "무엇을 구매하실 건가요?"  + 버튼: 타이틀 "추가"
   셀: 커스텀 셀 사용 (search tableview cell)
 섹션 개수: 1 // 한개니까 안써도 디폴트
  numofrowinsection 개수: 4
  row 1: 캣그라스
  row 2: 캣타워
  row 3: 로얄캐닌 사료
  row 4: 참치캔
 
  image R: star  star.filled
  image L: checkbox checkbox.filled
 
 기능:
 추가버튼 누르면: list.append(텍스트필드.텍스트) & 텍스트필드.텍스트 = ""  & reload
 
 별버튼 누르면: 별버튼 태그 이용해서 토글 기능.
 
 체크박스 누르면: 태그 이용해서 토글.
 
 리스트 누르면: .remove 이용해서 삭제
  
 
 
*/

class CaseThreeTableViewController: UITableViewController {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var addBtn: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

 

}
