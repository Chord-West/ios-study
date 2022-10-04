//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by 김현서 on 2022/10/04.
//

import UIKit

protocol LEDBoardSettingDelegate:AnyObject{
    func changedSetting(text:String?, textColor : UIColor, backgroundColor: UIColor)
    
}

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    var textColor : UIColor = .yellow
    var bacgroundColor:UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView(){
        if let ledText = ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColorButton(color: self.bacgroundColor)
    }
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        // 버튼을 누르게 되면 sender 파라미터로 전달됨
        if sender == self.yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        }else if sender == self.purpleButton{
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        }else{
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
        
    }
    
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColorButton(color: .black)
            self.bacgroundColor = .black
        }else if sender == self.blueButton{
            self.changeBackgroundColorButton(color: .blue)
            self.bacgroundColor = .blue
        }else{
            self.changeBackgroundColorButton(color: .orange)
            self.bacgroundColor = .orange
        }
    }
    
    @IBAction func tabSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: self.textField.text,
            textColor : self.textColor,
            backgroundColor: self.bacgroundColor
        )
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color : UIColor){
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColorButton(color: UIColor){
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
    
}
