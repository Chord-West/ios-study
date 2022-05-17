//
//  SaguePushViewController.swift
//  ScreenTransactionExample
//
//  Created by 김현서 on 2022/05/16.
//

import UIKit

class SuguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?
            .popToRootViewController(animated: true)
    }
}
