//
//  MainViewController.swift
//  Project App French.me
//
//  Created by english on 2023-11-27.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var txtSelectVerb: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    @IBAction func btnSearchVerbTouchUpInside(_ sender: Any) {
        
        
        guard let verb = txtSelectVerb.text, !verb.isEmpty
        else {
            Toast.ok(view: self, title: "Error", message: "Please, type a verb!")
            return
        }
        
        FrenchVerbAPI.getVerb(verb: verb ) { verb in
            
            print(verb.fullDescription!)
            
            
            DispatchQueue.main.sync {
                
                
                self.performSegue(withIdentifier: "toResultViewController", sender: self)
            }
            
            
        } failHandler: { httpStatusCode, errorMessage in
            
            DispatchQueue.main.sync {
                Toast.ok(view: self, title: "Error", message: errorMessage)
            }
            
            
        }
        
    }
}
