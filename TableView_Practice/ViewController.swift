//
//  ViewController.swift
//  TableView_Practice
//
//  Created by 다훈김 on 2021/02/06.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let list = ["몰라유", "인디고", "힘든건 사랑이 아니다", "shape of you"]
    let artist = ["머쉬베놈", "저스디스 NO:EL 키드밀리 양홍원", "임창정", "애드 시런"]
    
    // MARK: - prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // ClickVC에 데이터 줄꺼야
        if segue.identifier == "show" {
            
            let clickCellVC = segue.destination as? ClickCellVC
            
            if let index = sender as? Int {
                
                clickCellVC?.musicTitle = list[index]
                
                clickCellVC?.artist = artist[index]
                
                print("넘긴다 : \(clickCellVC?.musicTitle)")
                print("넘긴다 : \(clickCellVC?.artist)")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: -TableViewDataSource
extension ViewController: UITableViewDataSource { // 셀 출력
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 몇개 보여줄까?
        return list.count // 리스트 갯수 만큼
    }
    
    // 어떻게 표현할꺼야?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 식별자 이름이 cell인 셀을 재사용 해서 보여줄꺼야
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // 리스트 배열의 텍스트를 셀의 텍스트라벨에 넣어어서 보여줄꺼야
        cell.textLabel?.text = "\(list[indexPath.row])"
        
        return cell
    }
    
    
}    
// MARK: -TableVieWDelegate
extension ViewController: UITableViewDelegate { // 셀이 클릭되면 어떻게 해줄까?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // index의 x번째 셀이 클릭되면
        // 식별자 show 세그웨이 이용해서 다른 뷰페이지로 인덱스번호를 보내고 번호에 맞춰서 모달 띄워줘
        print("\(indexPath.row)")
        performSegue(withIdentifier: "show", sender: indexPath.row)
       
    }
}
