//
//  ContactUsViewController.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 17/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import Alamofire
import MRCountryPicker

class ContactUsViewController: UIViewController, MRCountryPickerDelegate {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet var phoneCodeView: MRCountryPicker!
    var isHiddenPickerView = false
    @IBOutlet var nameTextFiled: UITextField!
    
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var lblPhoneCode: UILabel!
    @IBOutlet var messageView: UITextView!
    @IBOutlet var countryNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        // let callImage   = UIImage(named: "phone")!
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: callImage, style: .plain, target:self, action: #selector(callMethod))
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        // phone code start...
        //let tapPhonecode = UITapGestureRecognizer(target: self, action: #selector(pickerShowCall))
        //lblPhoneCode.isUserInteractionEnabled = true
        //lblPhoneCode.addGestureRecognizer(tapPhonecode)
       self.phoneCodeView.isHidden = true
//        self.phoneCodeView.countryPickerDelegate = self
//        self.phoneCodeView.setCountry("IN")
        let userLoginDict = defaults.object(forKey: "loginData") as? NSDictionary
        if userLoginDict != nil{
            nameTextFiled.text = userLoginDict?.object(forKey: "name") as? String
            emailTextField.text = userLoginDict?.object(forKey: "email") as? String
            phoneTextField.text = userLoginDict?.object(forKey: "enteredPhone") as? String
            
            
        }
       
      
    }
    @IBAction func callToCustomercare(_ sender: Any) {
        callMethod()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
       
    }
    func pickerShowCall() {
        hideKeyboardWhenTappedAround()
        if isHiddenPickerView == false {
            phoneCodeView.isHidden = false
            print("working")
            isHiddenPickerView = true
        }
        else {
            phoneCodeView.isHidden = true
            isHiddenPickerView = false
        }
        
        
    }
    func countryPhoneCodePicker(_ picker: MRCountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        lblPhoneCode.text = phoneCode
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title = " Contact Us"
    }

   
    @IBAction func btnSubmitClicked(_ sender: Any) {
        
            
            
            
            if (nameTextFiled.text != "") && (phoneTextField.text != "") && (emailTextField.text != "") && (messageView.text != "") && (countryNameTextField.text != "")
            {
                
                SwiftLoader.show(title: "Uploading...", animated: true)
                let defaults = UserDefaults.standard
                let client_id = defaults.object(forKey: "userId")
                let contact_parameters: [String: Any] = [
                    "client_id":client_id!,
                    "name": nameTextFiled.text!,
                    "email": emailTextField.text!,
                    "phone": phoneTextField.text!,
                    "country": countryNameTextField.text!,
                    "message":messageView.text!]
                // print("parameters=", reg_parameters)
                let contact_url = serviceUrl + "contact_us.php"
                
                
                
                Alamofire.request(contact_url, method: .post, parameters: contact_parameters, headers: nil).responseJSON { (response:DataResponse<Any>) in
                    print("response=",response)
                    
                    switch(response.result) {
                    case .success(_):
                        if response.result.value != nil{
                            if let dic = response.result.value as? [String: Any] as NSDictionary?{
                                SwiftLoader.hide()
                                
                             let status = dic.object(forKey: "status") as? String
                                
                                 self.view.makeToast(status!, duration: 2.0, position: .center)
                            }
                        }
                        
                       
                        
                        self.nameTextFiled.text = ""
                        self.emailTextField.text = ""
                        self.phoneTextField.text = ""
                        self.countryNameTextField.text = ""
                        self.messageView.text = ""
                      
                        break
                        
                    case .failure(_):
                        SwiftLoader.hide()
                        
                        print("fail=", response.result.error!)
                        
                        break
                        
                    }
                    
                }
                
            }
            else{
                
                self.view.makeToast("Please fill all field", duration: 2.0, position: .center)
            }
            
        
    }

}
