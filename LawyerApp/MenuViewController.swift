//
//  MenuViewController.swift
//  LawyerApp
//
//  Created by winklix on 30/11/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
struct menuStruc {
    var name: String?
    var menuimg: UIImage?
}


class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var userNameText: UILabel!
    
    @IBOutlet weak var tblMenu: UITableView!
    var menuArr = [menuStruc]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        menuArr = [menuStruc.init(name: "Home", menuimg: #imageLiteral(resourceName: "home")),menuStruc.init(name: "Rate Us", menuimg: #imageLiteral(resourceName: "star2")),menuStruc.init(name: "My Profile", menuimg: #imageLiteral(resourceName: "user2")),menuStruc.init(name: "Contact Us", menuimg: #imageLiteral(resourceName: "call2")),menuStruc.init(name: "Logout", menuimg:#imageLiteral(resourceName: "logout2"))]
        let userName = defaults.object(forKey: "userName") as! String
        
        userNameText.text = "Welcome " + userName
        
        tblMenu.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0:
self.performSegue(withIdentifier: "home", sender: self)
            break
        case 1:
            invokeAlertMethod(strTitle: "Alert!", strBody: "Rate will update soon!", delegate: nil)
            break
        case 2:
            self.performSegue(withIdentifier: "menuProfile", sender: self)
   
            break
        case 3:
            self.performSegue(withIdentifier: "menuContact", sender: self)
            
            break
            
        case 4:
            defaults.set(nil, forKey: "userEmailID")
            defaults.set(nil, forKey: "password")
            defaults.set(nil, forKey: "loginData")
            performSegue(withIdentifier: "menuLogin", sender: self)
            break
        default:
            print("will update soon!")
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuTableCell = tblMenu.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableCell
        cell.img.image = (menuArr[indexPath.row]).menuimg
        cell.name.text = (menuArr[indexPath.row]).name
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr.count
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
