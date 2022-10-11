//
//  ViewController.swift
//  TodoList
//
//  Created by 김현서 on 2022/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


    @IBAction func tadEditButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { _ in
            debugPrint("\(alert.textFields?[0].text)")
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: {textField in textField.placeholder = "할 일을 입력해주세요."})
        
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
}

