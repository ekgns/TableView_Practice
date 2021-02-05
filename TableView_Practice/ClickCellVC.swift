//
//  ClickCellVC.swift
//  TableView_Practice
//
//  Created by 다훈김 on 2021/02/06.
//

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
