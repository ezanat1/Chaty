//  ProfileViewController.swift
//  Chaty
//  Created by Ezana Tesfaye on 2/26/21.

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let data = ["Log Out"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: {[weak self] _  in

            guard let strongSelf = self else{
                return
            }
            do {
                try FirebaseAuth.Auth.auth().signOut()
                let lc = LoginViewController()
                let nav = UINavigationController(rootViewController: lc)
                nav.modalPresentationStyle = .fullScreen
                strongSelf.present(nav, animated: true)
            } catch  {
                print("Failed to logout")
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
}

