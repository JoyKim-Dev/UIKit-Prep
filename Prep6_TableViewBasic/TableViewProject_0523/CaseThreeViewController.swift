//
//  CaseThreeViewController.swift
//  TableViewProject_0523
//
//  Created by Joy Kim on 5/25/24.
//

// cell 사이 간격 띄우기 구현 필요

import UIKit


struct toBuy {
    let item: String
    var check: Bool
    var favorite: Bool
}

class CaseThreeViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var searchBarView: UIView!
    
    var itemList = [
    toBuy(item: "캣그라스", check: false, favorite: false),
    toBuy(item: "캣타워", check: false, favorite: false),
    toBuy(item: "로얄캐닌 사료", check: false, favorite: false),
    toBuy(item: "참치캔", check: false, favorite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        configureUI()
    }
    


}

extension CaseThreeViewController {
    
    func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        
        searchBarView.backgroundColor = .gray.withAlphaComponent(0.1)
        searchBarView.layer.cornerRadius = 4
        
        searchTextField.placeholder = "사야할 아이템을 입력하세요"
        searchTextField.backgroundColor = .clear
        searchTextField.borderStyle = .none
        
        
        
        addBtn.setTitle("추가", for: .normal)
        addBtn.setTitleColor(.black, for: .normal)
        addBtn.layer.cornerRadius = 4
        addBtn.backgroundColor = .lightGray.withAlphaComponent(0.2)
        addBtn.addTarget(self, action: #selector(addBtnTapped), for: .touchUpInside)
    }
    
    @objc func addBtnTapped(_ sender:UIButton) {
     
        guard let newItem = searchTextField.text, newItem.count > 0 else {
            print("오류")
            return
        }
        
        itemList.append(toBuy(item: newItem, check: false, favorite: false))
        searchTextField.text = ""
        tableView.reloadData()
        
    }
    
    @objc func checkBtnTapped(sender: UIButton) {
        
        itemList[sender.tag].check.toggle()
        tableView.reloadRows(at:[IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func favoriteBtnTapped(sender:UIButton) {
        itemList[sender.tag].favorite.toggle()
        tableView.reloadRows(at:[IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
}

extension CaseThreeViewController:UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemList.count
   }
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
       return " "
   }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
       return 3
   }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath)as! SearchTableViewCell
       
       let data = itemList[indexPath.row]
       
       cell.backgroundColor = .gray.withAlphaComponent(0.1)
       cell.layer.cornerRadius = 4
       
     
       cell.titleLabel.text = data.item
       cell.titleLabel.font = .boldSystemFont(ofSize: 15)
       
       
       let checkName = data.check ? "checkmark.square.fill" : "checkmark.square"
       let checkImage = UIImage(systemName: checkName)
       cell.checkBtn.setImage(checkImage , for: .normal)
       cell.checkBtn.tintColor = .black
       
       cell.checkBtn.tag = indexPath.row
       cell.checkBtn.addTarget(self, action: #selector(checkBtnTapped), for: .touchUpInside)
       
       let starName = data.favorite ? "star.fill" : "star"
       let starImage = UIImage(systemName: starName)
       cell.favoriteBtn.setImage(starImage, for: .normal)
       cell.favoriteBtn.tintColor = .black
       
       cell.favoriteBtn.tag = indexPath.row
       cell.favoriteBtn.addTarget(self, action: #selector(favoriteBtnTapped), for: .touchUpInside)

       return cell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       itemList.remove(at: indexPath.row)
       tableView.reloadData()
       
   }
}
