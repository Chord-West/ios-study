//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 김현서 on 2022/11/12.
//

import UIKit

class EnterEmailViewController : UIViewController{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var erroMessageLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 30
        
        //초기 설정은 비활성화
        nextButton.isEnabled = false
        
        
        // 텍스트 Field 값을 받기 위해선 delegate 함수를 받아야함
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
        
        emailTextField.becomeFirstResponder()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Navigation Bar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
    }
    
    
}

extension EnterEmailViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField : UITextField) -> Bool{
        view.endEditing(true)
        return false
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        let isEmailEmpty =
            emailTextField.text == ""
        let isPasswordEmpty =
        passwordTextField.text == ""
        
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
    
}
