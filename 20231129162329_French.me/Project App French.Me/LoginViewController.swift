//
//  LoginViewController.swift
//  Project App French.me
//
//  Created by english on 2023-11-27.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnShowPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtPassword.isSecureTextEntry = true
        
    }

   
        
        
                
    
    
    @IBAction func btnLoginTouchUpInside(_ sender: Any) {
        
        guard let email = txtEmail.text, !email.isEmpty,
              let password = txtPassword.text, !password.isEmpty
        else {
            Toast.ok(view: self, title: "Error", message: "Fill all fields")
            return
        }
        
        
        FrenchVerbAPI.signIn(email:  email, password: password) { token in
                    
            DispatchQueue.main.sync {
                print("Logged in with token \(token)")
                Context.loggedUserToken = token
                self.performSegue(withIdentifier: "toMainViewController", sender: self)
            }
                
        } failHandler: { httpStatusCode, errorMessage in
                    
            DispatchQueue.main.sync {
                Toast.ok(view: self, title: "Error", message: errorMessage)
            }
            print("Failed with httpCode \(httpStatusCode) - \(errorMessage)")
                
        }
    }
    
    
    
    @IBAction func btnToggleShowHidePassword(_ sender: Any) {
        
        txtPassword.isSecureTextEntry.toggle()
    }
    

    
}
