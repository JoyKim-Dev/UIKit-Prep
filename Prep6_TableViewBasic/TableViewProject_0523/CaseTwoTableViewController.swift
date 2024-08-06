//
//  CaseTwoTableViewController.swift
//  TableViewProject_0523
//
//  Created by Joy Kim on 5/23/24.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total, personal, others
    
    var mainOptions: String {
        switch self {
        case .total:
            return "전체설정"
        case .personal:
            return "개인설정"
        case .others:
            return "기타"
        }
    }
    var subOptions: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}


class CaseTwoTableViewController: UITableViewController {
    // 전체설정(공지사항, 실험실, 버전 정보) / 개인 설정(개인/보안, 알림, 재팅, 열린프로필) / 기타(고객센터)
    // section 3개, 셀 8개, 내용물
//    let list = [["공지사항", "실험실", "버전 정보"], ["개인/보안", "알림", "채팅", "열린프로필"],["고객센터"]]
    
    
    let setting = SettingOptions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       // return list.count
        return setting.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return list[section].count
        return setting[section].subOptions.count
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print(#function, indexPath)
//        return 50
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting")!
        
   //     cell.textLabel?.text = list[indexPath.section][indexPath.row]
        cell.textLabel?.text = setting[indexPath.section].subOptions[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return setting[section].mainOptions
        
        //        switch section {
//        case 0:
//            return "전체 설정"
//        case 1:
//            return "개인 설정"
//        case 2:
//            return "기타"
//        default:
//            return ""
//        }
    }
    
}







