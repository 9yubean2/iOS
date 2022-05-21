//
//  LoginViewController.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/05/21.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Properties
    
    var email = String()
    var password = String()
    var userInfo : UserInfo?
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnGoToRegister: UIButton!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAttribute()
        
    }
    
    //MARK: - Helper
    
    @IBAction func emailTextFieldEditingChenged(_ sender: UITextField) {
        //Optional: 값이 있을 수도 없을 수도 있다.
        let text = sender.text ?? ""
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChenged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.btnLogin.backgroundColor = text.count > 2 ? UIColor(named: "facebookColor"):UIColor(named: "disabledButtonColor")
        
        self.password = text
    }
    @IBAction func btnLoginDidTapped(_ sender: UIButton) {
        //회원가입 정보를 전달 받아서, 일치하면 로그인
        guard let userInfo = self.userInfo else {return}
        if userInfo.email == self.email && userInfo.password == self.password {
            self.btnLogin.backgroundColor = UIColor(named: "facebookColor")
            self.btnLogin.isEnabled = true
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabbarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            print("toNextView")
            
        } else {
            print("wrong info")
            self.btnLogin.backgroundColor = UIColor(named: "disabledButtonColor")
            self.btnLogin.isEnabled = false
        }
    }
    @IBAction func goToRegister(_ sender: UIButton) {
        //화면전환
        //1.스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2.뷰 컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        //3.화면전환 메소드를 이용해서 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        registerViewController.userInfo = { [weak self] (userInfo) in
            print(userInfo)
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
                self.btnGoToRegister,
                texts: text1, text2,
                fonts: font1, font2,
                colors: color1, color2 )
            self.btnGoToRegister.setAttributedTitle(attributes, for: .normal)
        }
    


}
