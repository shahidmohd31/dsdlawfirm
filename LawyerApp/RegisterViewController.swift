//
//  RegisterViewController.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 09/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import Alamofire
import MRCountryPicker

class RegisterViewController: UIViewController, UITextFieldDelegate {
     var yellowborder = UIColor(red: 240.0/255.0, green: 121.0/255.0, blue: 13.0/255.0, alpha: 1.0)
    var msg: String?
    @IBOutlet var phoneCodePicker: MRCountryPicker!
    var isPickerShow = false
    @IBOutlet var phoneCode: UILabel!
    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var textFieldPhone: UITextField!
    @IBOutlet var TextFieldPassword: UITextField!
   
  
    @IBOutlet weak var backToLogin: UIButton!
    var mszOtp :String?
     var id :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        hideKeyboardWhenTappedAround()
     phoneCodePicker.isHidden = true

    }
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.isHidden = false;
//        self.navigationItem.title = "Sign Up Form"
//        self.navigationController?.navigationBar.topItem?.title = ""
    }

    @IBAction func submitClicked(_ sender: Any) {
        if (textFieldName.text != "") && (textFieldEmail.text != "") && (TextFieldPassword.text != "") && (textFieldPhone.text != "")
        {
            if !(common.isValidEmail(testStr: textFieldEmail.text!)){
                self.view.makeToast("Please enter a valid email id.", duration: 2.0, position: .center)
                return
            }
            if !(common.phonevalidate(value: textFieldPhone.text!)){
        
                self.view.makeToast("Please enter a valid mobile no.", duration: 2.0, position: .center)
                return
            }
            
            let defaultsObj = UserDefaults.standard
            let userNumber = textFieldPhone.text
            defaultsObj.set(userNumber, forKey: "number")
            defaultsObj.synchronize()
                SwiftLoader.show(title: "registering...", animated: true)
                let reg_parameters: [String: Any] = [
                    "name": textFieldName.text! ,
                    "email": textFieldEmail.text!,
                    "password": TextFieldPassword.text!,
                    "phone": "+1\(textFieldPhone.text!)"]
                print("parameters=", reg_parameters)
                let reg = serviceUrl + "register.php"
               Alamofire.request(reg, method: .post, parameters: reg_parameters, headers: nil).responseJSON { (response:DataResponse<Any>) in
                    switch(response.result) {
                    case .success(_):
                        if response.result.value != nil{
                            if let dic = response.result.value as? [String: Any] as NSDictionary?{
                                let usID = dic.object(forKey: "id")
                                 defaults.set(usID, forKey: "userId")
                                if let regDict = dic["Registration"] as? NSDictionary{
                                    print("regDict=", regDict)
                                    self.id = regDict.object(forKey: "id") as? String
                                    print("id==", self.id!)
                                    if (self.id == "already_registered") {
                                        SwiftLoader.hide()
                                        self.view.makeToast("Please try again your Phone Number is already registered", duration: 2.0, position: .center)
                                    }
                                }
                                else{
                                     let idStr = dic.object(forKey: "id")
                                    let defaults = UserDefaults.standard
                                    defaults.set(idStr, forKey: "regUserID")
                                   defaults.set(self.textFieldEmail.text, forKey: "userEmail")
                                    defaults.set(self.TextFieldPassword.text, forKey: "pwd")
                                    //defaults.set(self.textFieldAleinNumber.text, forKey: "alien_number")
                                    defaults.set(self.textFieldName.text, forKey: "userName")
                                    defaults.synchronize()
                                    self.mszOtp = dic.object(forKey: "status") as? String
                                    self.textFieldName.text = ""
                                    self.textFieldEmail.text = ""
                                    self.textFieldPhone.text = ""
                                    self.TextFieldPassword.text = ""
                                    self.view.makeToast(self.mszOtp!, duration: 3.0, position: .center)
                                    SwiftLoader.hide()
                                    if self.mszOtp! == "otp sent on email"{
                                        defaults.synchronize()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            self.navigationController?.popViewController(animated: true)
                                        }
                                    }
                                }
                            }
                        }
                    case .failure(_):
                        SwiftLoader.hide()
                        break
                    }
                }
        }
        else{
            self.view.makeToast("Please fill all field", duration: 2.0, position: .center)
        }
        
        }
    }

