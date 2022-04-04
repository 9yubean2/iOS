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
    var userInfo: UserInfo?
    
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAttribute()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        //Optional: 값이 있을 수도 없을 수도 있다.
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor = text.isValidEmail() ? UIColor(named: "facebookColor") : UIColor(named: "disabledButtonColor")
            

        
        self.email = text

    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.count > 2 ? UIColor(named: "facebookColor") : UIColor(named: "disabledButtonColor")
        self.password = text
    }
    
    @IBAction func loginButtonDidTapped(_ sender: UIButton) {
        //회원가입 정보를 전달받아, 그것과 textfield 데이터가 일치하면 로그인 되어야 한다
        //optinal 해제: guard
        guard let userInfo = self.userInfo else {return}
        if userInfo.email == self.email
            && userInfo.password == self.password {
            print("toNextView")
        } else {
            print("Login Fail")
        }
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
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    private func setupAttribute() {
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.systemFont(ofSize: 13, weight: .bold)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor(named: "facebookColor")!
        
        let attributes = generateButtonAttribute(
            self.registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2 )
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
