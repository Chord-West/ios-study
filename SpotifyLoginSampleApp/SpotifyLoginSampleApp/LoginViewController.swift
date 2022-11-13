//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 김현서 on 2022/11/12.
//

import UIKit

class LoginViewController: UIViewController{
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3개의 버튼의 동일 한 UI가 적용되도록
        [emailLoginButton, googleLoginButton,
         appleLoginButton].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Navigation Bar 숨기기
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: Any) {
        // FireBase 인증
        
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: Any) {
        // FireBase 인증
        
    }
}
