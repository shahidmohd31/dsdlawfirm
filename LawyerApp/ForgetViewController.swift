//
//  ForgetViewController.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 01/07/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import Alamofire

class ForgetViewController: UIViewController {

    @IBOutlet var phoneNumbertextField: UITextField!
    @IBOutlet var lblRelogin: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(reCreateLogin))
        self.lblRelogin.isUserInteractionEnabled = true
        self.lblRelogin.addGestureRecognizer(tapGesture)
        hideKeyboardWhenTappedAround()
        self.navigationController?.navigationItem.title = "Forget Password"

    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    func reCreateLogin(gesture:UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "relogin", sender: self)
        
    }
    @IBAction func btnRequestResetLoginClick(_ sender: Any) {
        
        
        if (phoneNumbertextField.text != "")
        {
            SwiftLoader.show(title: "Uploading...", animated: true)
            
            let contact_parameters: [String: Any] = [
                "email": phoneNumbertextField.text!,
                ]
            // print("parameters=", reg_parameters)
            let contact_url = serviceUrl + "forgetpassword.php"
            
            
            
            Alamofire.request(contact_url, method: .post, parameters: contact_parameters, headers: nil).responseJSON { (response:DataResponse<Any>) in
                print("response=",response)
                
                switch(response.result) {
                case .success(_):
                    if response.result.value != nil{
                        if let dic = response.result.value as? [String: Any] as NSDictionary?{
                            SwiftLoader.hide()
                            print("dict==!", dic)
                            
                            let status = dic.object(forKey: "status") as? String
                            
                            self.view.makeToast(status!, duration: 2.0, position: .center)
                        }
                    }
                    self.phoneNumbertextField.text = ""
                   
                 
                    
                case .failure(_):
                    SwiftLoader.hide()
                    
                    print("fail=", response.result.error!)
                    
                    break
                    
                }
                
            }
            
        }
        else{
            
            self.view.makeToast("Please fill your correct number", duration: 2.0, position: .center)
        }

    }
   

}
