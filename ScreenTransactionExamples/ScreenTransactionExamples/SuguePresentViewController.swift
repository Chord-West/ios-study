//
//  SuguePresentViewController.swift
//  ScreenTransactionExamples
//
//  Created by κΉνμ on 2022/05/24.
//

import UIKit

class SuguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
}
