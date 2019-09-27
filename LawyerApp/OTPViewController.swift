//
//  OTPViewController.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 13/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import Alamofire
class OTPViewController: UIViewController {

    @IBOutlet var lblTimer: UILabel!
    @IBOutlet var ViewQuareFull: UIView!
    @IBOutlet var textfieldOTP: UITextField!
    @IBOutlet var lblNumber: UILabel!
    var numID: String?
    var timeCount : Timer = Timer()
    var count = 60
    var defaultsObj = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitOtp))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action:#selector(cancelClicked))
        ViewQuareFull.layer.cornerRadius = 5
        ViewQuareFull.layer.borderWidth = 2
        ViewQuareFull.layer.borderColor = UIColor(red:240.0/255.0, green:121.0/255.0, blue: 13.0/255.0, alpha:1.0).cgColor
lblNumber.text = defaultsObj.object(forKey: "userEmail") as? String
        timeCount = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func submitOtp(){
    
        if textfieldOTP.text != ""
        {timeCount.invalidate()
            
            SwiftLoader.show(title: "Uploading...", animated: true)
            let defaults = UserDefaults.standard
             let numStrID = defaults.object(forKey: "regUserID")
           // defaults.synchronize()
            print("id=", numStrID!)
            let otp_parameters: [String: Any] = [
                "otp": textfieldOTP.text!,
                "id": numStrID!,
               ]
            print("parameters=", otp_parameters)
            let otpUrl = serviceUrl + "match_otp.php"
            
            let userEmail = defaults.object(forKey: "userEmail")
            let pwd = defaults.object(forKey: "pwd")
            
            Alamofire.request(otpUrl, method: .post, parameters: otp_parameters, headers: nil).responseJSON { (response:DataResponse<Any>) in
                print("response=",response)
                
                switch(response.result) {
                case .success(_):
                    if response.result.value != nil{
                        if let dic = response.result.value as? [String: Any]{
                          
                             print("regDict=", dic)
                           let status = dic["status"] as? String
                            if status == "otp not matched"{
                            SwiftLoader.hide()
                                self.view.makeToast("otp is not matched Please try again", duration: 2.0, position: .center)
                            
                            }
                            else {
                                SwiftLoader.hide()
                                defaults.set(userEmail, forKey: "userEmailID")
                                defaults.set(pwd, forKey: "password")
                                self.performSegue(withIdentifier: "loginVCCall", sender: self)
                            }}
                       
                        print("YOUR JSON DATA>>  \(response.data!)")
                        self.textfieldOTP.text = ""
                        
                    }
                    break
                    
                case .failure(_):
                    
                    print("fail=", response.result.error!)
                    
                    break
                    
                }
                
            }
        }
        else{
            
            self.view.makeToast("Please fill your OTP", duration: 2.0, position: .center)
        }
        
    
    }
    func updateCounter() {
        
        //you code, this is an example
        if self.count > 0 {
           // print("\(self.count) seconds to the end of the world")
            
            self.count -= 1
            self.lblTimer.text = String(self.count)
        }
        else if self.count == 0{
            let alert = UIAlertController(title:"Time Out", message:" Your OTP has been expired please clicked resend OTP button", preferredStyle:UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            timeCount.invalidate()
            
            print("func stopTimer")
        }
        
    }
    
    @IBAction func btnResendOTPClicked(_ sender: Any) {
        
            
            SwiftLoader.show(title: "Uploading...", animated: true)
            let defaults = UserDefaults.standard
            let numStrID = defaults.object(forKey: "userId")
        let userEmail = defaults.object(forKey: "userEmail")
        //let pwd = defaults.object(forKey: "pwd")
            // defaults.synchronize()
            print("id=", numStrID!)
            let otp_parameters: [String: Any] = [
                "id": numStrID!,
                "email": userEmail!,
                ]
            print("parameters=", otp_parameters)
            let otpUrl = serviceUrl + "resend_otp.php"
            
            
            
            Alamofire.request(otpUrl, method: .post, parameters: otp_parameters, headers: nil).responseJSON { (response:DataResponse<Any>) in
                print("response=",response)
                
                switch(response.result) {
                case .success(_):
                    if response.result.value != nil{
                        if let dic = response.result.value as? [String: Any]{
                          
                            print("regDict=", dic)
                           self.count = 60
                        self.timeCount = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: false)
                        }
                        SwiftLoader.hide()
                        print("YOUR JSON DATA>>  \(response.data!)")
                      
                    }
                    break
                    
                case .failure(_):
                    SwiftLoader.hide()
                    print("fail=", response.result.error!)
                    
                    break
                    
                }
                
            }
        
        
    }
    func cancelClicked(){
    self.navigationController?.popViewController(animated: true)

    
    }

}
