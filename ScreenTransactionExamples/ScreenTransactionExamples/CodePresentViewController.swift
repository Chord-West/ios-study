//
//  CodePresentViewController.swift
//  ScreenTransactionExamples
//
//  Created by 김현서 on 2022/05/24.
//

import UIKit

protocol SendDateDelegate: AnyObject {
    func sendData(name : String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name:String?
    // Delgate 패턴을 사용할 때 앞에 Weak를 붙여줘야 한다. 안 붙이면 강한 참조가 발생해 메모리 누수가 발생할 수 있다.
    weak var delegate: SendDateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name{
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "Gunter");
        self.presentingViewController?.dismiss(animated: true,completion: nil)
    }
}
