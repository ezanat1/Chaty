//
//  ViewController.swift
//  Chaty
//
//  Created by Ezana Tesfaye on 2/26/21.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "chat"
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
        
        if !isLoggedIn {
            let lc = LoginViewController()
            let nav = UINavigationController(rootViewController: lc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }
        
    }


}

