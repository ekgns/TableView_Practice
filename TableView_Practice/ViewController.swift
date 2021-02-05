//
//  ViewController.swift
//  TableView_Practice
//
//  Created by 다훈김 on 2021/02/06.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let list = ["몰라유", "인디고", "힘든건 사랑이 아니다", "shape of you"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
   

}

// MARK: -TableViewDataSource
extension ViewController: UITableViewDataSource { // 셀 출력
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 몇개 보여줄까?
        return list.count // 리스트 갯수 만큼
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 어떻게 표현할꺼야?
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // 식별자 이름이 cell인 셀을 재사용 해서 보여줄꺼야
        cell.textLabel?.text = "\(list[indexPath.row])" // 리스트 배열의 텍스트를 셀의 텍스트라벨에 넣어어서 보여줄꺼야
        return cell
    }
    
    
}    

