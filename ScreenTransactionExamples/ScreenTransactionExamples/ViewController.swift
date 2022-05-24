//
//  ViewController.swift
//  ScreenTransactionExamples
//
//  Created by 김현서 on 2022/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tapCodePushButton(_ sender: UIButton) {
        // 스토리 보드에 있는 viewcontroller 를 인스턴스화 시켜야한다.
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController")
        else{ return}// optional로 반환하기 때문에 guard문으로 처리
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController")
        else{ return}
        viewController.modalPresentationStyle = .fullScreen // 전체화면으로 전환
        self.present(viewController, animated: true, completion: nil)
        
    }
}

