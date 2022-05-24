//
//  SuguePushViewController.swift
//  ScreenTransactionExamples
//
//  Created by 김현서 on 2022/05/24.
//

import UIKit

class SuguePushViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true) // 이전 화면으로 이동
        // rootView controller 로 이동시켜줌
        //self.navigation?.popToRootViewController(animated: true)
    }
    
    
}
