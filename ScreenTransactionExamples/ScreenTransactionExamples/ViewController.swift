//
//  ViewController.swift
//  ScreenTransactionExamples
//
//  Created by 김현서 on 2022/05/24.
//

import UIKit

class ViewController: UIViewController, SendDateDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier:
        "CodePresentViewController") as? CodePresentViewController else{ return } // CodePresentViewController 로 다운캐스트
        viewController.modalPresentationStyle = .fullScreen // 전체화면으로 전환
        viewController.name = "Gunter"
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    @IBAction func tapCodePushButton(_ sender: UIButton) {
        // 스토리 보드에 있는 viewcontroller 를 인스턴스화 시켜야한다.
        guard let viewController = self.storyboard?.instantiateViewController(identifier:
       "CodePushViewController") as? CodePushViewController else{ return}// optional로 반환하기 때문에 guard문으로 처리
        viewController.name = "Gunter"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SuguePushViewController{
            viewController.name = "Gunter"
        }
    }
    
    func sendData(name: String){
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
    
}

