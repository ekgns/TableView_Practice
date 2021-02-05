# TableView_Practice

## 목표: 리스트 데이블뷰로 출력하기 


1. Storyboard으 View안에 tableView생성 하고 view와 사이즈를 맞춘다
 
2. TableCell을 추가한다


3. TableView를 DataSource를 ViewController에 연결해준다


4. 출력할 리스트 상수를 선언한다.
```
 let list = ["몰라유", "인디고", "힘든건 사랑이 아니다", "shape of you"]
```
5. ViewController의 을 확장시켜 UITableViewDataSource 프로토콜을 추가해준다 
```
extension ViewController: UITableViewDataSource { // 셀 출력 }
```
6. 확장한 viewController안에 몇개를 보여줄것인지, 어떻게 표현할것인지 함수 코드르 작성해준다 
```
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 몇개 보여줄까? }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 어떻게 표현할까? }
```
7. func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int<br>함수안에 선언했던 리스트 상수 갯수만큼 리턴 시키는 코드작성
```
return list.count // 리스트 갯수 만큼
```
8. func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 함수에 셀을 표현할 코드 작성 
```
  let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // 식별자 이름이 cell인 셀을 재사용 해서 보여줄꺼야
        cell.textLabel?.text = "\(list[indexPath.row])" // 리스트 배열의 텍스트를 셀의 텍스트라벨에 넣어어서 보여줄꺼야
        return cell
```
### 전체코드
```

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
```
### 이미지
<img src="https://user-images.githubusercontent.com/70513066/107080480-b0e02600-6834-11eb-95b2-596d3677400e.png" width="40%">


 
