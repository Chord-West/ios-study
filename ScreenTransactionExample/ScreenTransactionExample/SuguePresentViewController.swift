//
//  SuguePresentViewController.swift
//  ScreenTransactionExample
//
//  Created by 김현서 on 2022/05/17.
//

import UIKit

class SuguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?
            .dismiss(animated: true,completion: nil)
    }
    
}
