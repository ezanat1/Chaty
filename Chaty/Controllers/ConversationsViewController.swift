//
//  ViewController.swift
//  Chaty
//
//  Created by Ezana Tesfaye on 2/26/21.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
      
        
    }
    
    private func validateAuth(){
        
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let lc = LoginViewController()
            let nav = UINavigationController(rootViewController: lc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
            
        }
       
    }


}

