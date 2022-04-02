//
//  LoginViewController.swift
//  Login&Register
//
//  Created by 이규빈 on 2022/04/03.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    var email = String()
    var password = String()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        //Optional: 값이 있을 수도 없을 수도 있다.
        let text = sender.text ?? ""
        self.email = text

    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTapped(_ sender: UIButton) {
    }
    @IBAction func registerButtonDidTapped(_ sender: UIButton) {
        //화면전환
        //1.스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2.뷰 컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        //3.화면전환 메소드를 이용해서 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
}
