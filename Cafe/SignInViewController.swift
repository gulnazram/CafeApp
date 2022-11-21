//
//  ViewController.swift
//  Cafe
//
//  Created by Gulnaz on 21.11.2022.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblValidationMessage: UILabel!
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var imgPasswordEye: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewParameters()
    }
    
    func setViewParameters() {
        createEyeTapRecognizer()
        txtEmail.addOnlyBottomBorder()
        txtPassword.addOnlyBottomBorder()
        lblValidationMessage.isHidden = true
        signInButton.layer.cornerRadius = 12
        self.hideKeyboardWhenTappedAround()
    }
    
    func createEyeTapRecognizer() {
        imgPasswordEye.image = UIImage(named: "openedEye")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgPasswordEye.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if imgPasswordEye.image == UIImage(named: "openedEye") {
            imgPasswordEye.image = UIImage(named: "closedEye")
        } else {
            imgPasswordEye.image = UIImage(named: "openedEye")
        }
        txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry
    }
    
    @IBAction func loginUser(_ sender: UIButton) {
        guard let email = txtEmail.text, txtEmail.text?.count != 0 else {
            showValidationError("Enter correct email")
            return
        }
        if isValidEmail(emailID: email) {
            guard let _ = txtPassword.text, txtPassword.text?.count != 0 else {
                showValidationError("Enter correct password")
                return
            }
        } else {
            showValidationError("Email is not valid")
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
          guard let registrationVC = storyboard.instantiateViewController(identifier: "RegistrationVC") as? RegistationViewController else { return }
        lblValidationMessage.isHidden = true
        show(registrationVC, sender: nil)
    }
    
    func showValidationError( _ message: String) {
        lblValidationMessage.text = message
        lblValidationMessage.isHidden = false
        buttonSignIn.shake()
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


