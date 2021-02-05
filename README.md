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


---


# 출력된 테이블뷰 리스트 클릭 이벤트

##  목표: 테이블뷰 셀이 클릭 되었을때 관련 정보 출력 (제목, 이미지, 작성자)
1. 셀 클릭 후 상세 정보가 나올 뷰 페이지와 뷰 컨트롤러를  생성 한 후 뷰페이지에 컨트롤러(ClickVC)를 연결해준다 
2. 새로 생성한 뷰 페이지를 기존 뷰페이지와 세크웨이로 연결 하고 세그웨이 식별자를 추가한다
3. 새로 생성한 뷰페이지에 제목과 작성자가 나올 텍스트라벨 2개와 이미지를 넣어주 이미지 라벨을 추가 후 ClickVC에 아울렛을 연결한다
4. 기존 뷰 컨트롤러에 작성자에 관한 String배열을 한가지 더 선언하고 Assets에 list배열의 값과 동일한 이미지를 추가한다 
```
 let artist = ["머쉬베놈", "저스디스 NO:EL 키드밀리 양홍원", "임창정", "애드 시런"]
```
5. 셀이 클릭 되면 이벤트가 일어날 수 있도록 DataSource를 추가한것과 동일하게 Delegate를 연결 해주고 ViewController를 확장시켜 코드를 작성한다
```
extension ViewController: UITableViewDelegate { // 셀이 클릭되면 어떻게 해줄까?}
```
6. extension ViewController: UITableViewDelegate 프로토콜을 추가 했으니 안에 클릭 시<br> 
정보를 보여줄 화면이 연결한 세그웨이를 이용해서 모달로 보여줄 코드를 작성한다
```
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // index의 x번째 셀이 클릭되면
        // 식별자 show 세그웨이 이용해서 다른 뷰페이지로 클릭된 셀의 인덱스번호를 보내고 번호에 맞춰서 모달 띄워줘
        performSegue(withIdentifier: "show", sender: indexPath.row)
        
        // 클릭 된 인덱스 번호를 콘솔에 표시해줘 
        print("\(indexPath.row)") 
    }
```
7. 세그웨이가 작동되어 데이터를 넘겨주기전에 준비하는 override func prepare함수를  작성한다
```
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  if segue.identifier == "show" {
            
            let clickCellVC = segue.destination as? ClickCellVC
            
            if let index = sender as? Int {
                
                clickCellVC?.musicTitle = list[index] 
                
                clickCellVC?.artist = artist[index]
                
                print("넘긴다 : \(clickCellVC?.musicTitle)") // 잘 넘어가는지 확인요 코드 
                print("넘긴다 : \(clickCellVC?.artist)")
            }
        }
```
8. 아까 새로만든 ClickVC에  musicTitle과 artist를 옵셔널 변수로 선언 해준다.
```
 var musicTitle: String?
 var artist: String?
```

9. 선언된 두 변수에 값이 잘 들어왔을 시 아울렛을 연결했던 UI요소들에 반응이 될 수 있도록 업데이트에 관한 함수를 작성한다
```
func updateUI() {
        if let title = self.musicTitle, let artist = self.artist { // 받아온 값들을 바인딩한다 
            
            let img = UIImage(named: "\(title).jpg")               
            
            imgLabel.image = img 
            
            titleLabel.text = title
            
            artistLabel.text = artist
            
             // 타이틀의 width 사이즈가 맞지 않는다면 (타이틀의 이름이 길어 짤리는것을  방지)
            if titleLabel.adjustsFontSizeToFitWidth == false {   
            
            // 타이틀 라벨의 폰트의 width사이즈를 자동으로 맞춰준다   
                titleLabel.adjustsFontSizeToFitWidth = true.      
            }
        }
    }
```
10. 창을 닫아줄 버튼을 생성하고 버튼이 클릭 되면 일어날 액션 이벤트르 만들어 준다 
```
 @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil) // 창 닫기(스택이 무한정 쌓임으 방지한다)
    }
```

### ViewController의 전체 코드 
```
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
```
### ClickVC의 전체 코드 
```
import UIKit

class ClickCellVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    
    var musicTitle: String?
    var artist: String?
    
    // 뷰가 생성되기전에
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // UIUpdate method
    func updateUI() {
        if let title = self.musicTitle, let artist = self.artist {
            
            let img = UIImage(named: "\(title).jpg")
            
            imgLabel.image = img 
            
            titleLabel.text = title
            
            artistLabel.text = artist
            
            if titleLabel.adjustsFontSizeToFitWidth == false {
                
                titleLabel.adjustsFontSizeToFitWidth = true
            }
        }
    }
   
    // MARK - close Action
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil) // 창 닫기
    }
}

```
<img src="https://user-images.githubusercontent.com/70513066/107092687-5f8d6200-6847-11eb-958f-ee07c9af3a5b.png" width="40%">
<img src="https://user-images.githubusercontent.com/70513066/107092770-8350a800-6847-11eb-8b17-cdb5a55f968a.png" width="40%">
<img src="https://user-images.githubusercontent.com/70513066/107092899-ada26580-6847-11eb-9362-b0aa180e8b75.png" width="40%">
<img src="https://user-images.githubusercontent.com/70513066/107092944-c27ef900-6847-11eb-8068-90592950fa90.png" width="40%">

 
