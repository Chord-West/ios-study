//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by 김현서 on 2022/05/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapChangeColorButton(_ sender: UIButton) {
        self.colorView.backgroundColor = UIColor.blue
        print("색상이 변경 돠었습니다.")
    }
    
}

