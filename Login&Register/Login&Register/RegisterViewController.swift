//
//  RegisterViewController.swift
//  Login&Register
//
//  Created by 이규빈 on 2022/04/03.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    //유효성 검사를 위한 프로퍼티
    var isValidEmail = false {
        didSet { //프로퍼티 옵저버
            self.validationUserInfo()
        }
    }
    var isValidName = false {
        didSet { //프로퍼티 옵저버
            self.validationUserInfo()
        }
    }
    var isValidNickname = false {
        didSet { //프로퍼티 옵저버
            self.validationUserInfo()
        }
    }
    var isValidPassword = false {
        didSet { //프로퍼티 옵저버
            self.validationUserInfo()
        }
    }
    
    @IBOutlet weak var signupButton: UIButton!
    //Textfields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var popToLoginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField()
        setupAttribute()
        
        //swipe bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    //MARK: - Action
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
        default:
            fatalError("Missing TextField...")
        }
    }
    
    @IBAction func backButtonDidTapped(_ sender: UIBarButtonItem) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func registerButtonDidTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickname,
            password: self.password)
        self.userInfo?(userInfo)
    }

    //MARK: - Helpers
    private func setupTextField() {
        textFields.forEach{ tf in
            tf.addTarget(self,
                         action: #selector(textFieldEditingChanged(_:)),
                         for: .editingChanged)
            
        }
    }
    //사용자가 입력한 회원정보를 확인하고 update
    private func validationUserInfo() {
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword {
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33){
                self.signupButton.backgroundColor = UIColor(named: "facebookColor")
            }
        } else {
            //유효성 검사 false
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33){
                self.signupButton.backgroundColor = UIColor(named: "disabledButtonColor")
            }
        }
    }
    private func setupAttribute() {
            let text1 = "계정이 있으신가요?"
            let text2 = "로그인"
            let font1 = UIFont.systemFont(ofSize: 13)
            let font2 = UIFont.systemFont(ofSize: 13, weight: .bold)
            
            let color1 = UIColor.darkGray
            let color2 = UIColor(named: "facebookColor")!
            
            let attributes = generateButtonAttribute(
                self.popToLoginButton,
                texts: text1, text2,
                fonts: font1, font2,
                colors: color1, color2 )
            self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
        }
}

//정규 표현식
extension String {
    //대문자, 소문자, 특수문자, 숙자 8자 이상일 때 true
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    //@2글자
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9,-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate.init(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
