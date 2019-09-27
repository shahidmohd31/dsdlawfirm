//
//  ViewController.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 09/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import Alamofire
import TextFieldEffects

class ViewController: UIViewController, UIScrollViewDelegate {
 
    @IBOutlet var lblCount: UILabel!
    @IBOutlet var freezView: UIView!
    @IBOutlet var phoneNumberTextField: HoshiTextField!
    
    var yellowborder = UIColor(red: 240.0/255.0, green: 121.0/255.0, blue: 13.0/255.0, alpha: 1.0)
    @IBOutlet var loginView: UIView!
    @IBOutlet var creatNewUserLabel: UILabel!
    @IBOutlet var forgetPwdLabel: UILabel!
   var componentArray: [String] = []
    var count = 30
    var loginCount = 0
    var timeCount: Timer = Timer()
    @IBOutlet var pwdField: HoshiTextField!
    
/// btn add for return
    @IBOutlet weak var txtReturn: UITextField!
    let button = UIButton(type: UIButtonType.custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        freezView.isHidden = true
        defaults.set(nil, forKey: "userId")
        //hideKeyboardWhenTappedAround()
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:.UIKeyboardWillShow, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
       
        print("textfieldwidth=", phoneNumberTextField.bounds.size.width)
        
        let forgetGesture = UITapGestureRecognizer(target:self, action:#selector(ViewController.forgetMethod(recognizer:)))
        self.forgetPwdLabel.isUserInteractionEnabled = true
        self.forgetPwdLabel.addGestureRecognizer(forgetGesture)
        
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.createLogin(recognizer:)))
        
        self.creatNewUserLabel.isUserInteractionEnabled = true
        self.creatNewUserLabel.addGestureRecognizer(tapGesture)
        //hideKeyboardWhenTappedAround()

    }
    
    
    func Done(_ sender : UIButton){
        
        DispatchQueue.main.async { () -> Void in
            
            self.phoneNumberTextField.resignFirstResponder()
            
        }
    }
    func createLogin(recognizer:UITapGestureRecognizer){
        
        performSegue(withIdentifier: "createNewUser", sender: self)
    
    }
  
    func forgetMethod(recognizer:UITapGestureRecognizer){
        self.performSegue(withIdentifier: "forget", sender: self)
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func homebuttonClicked(_ sender: Any) {
           performSegue(withIdentifier: "dashboard", sender: self)
    }
    @IBAction func loginBtnClicked(_ sender: Any) {
        if ( phoneNumberTextField.text != "") && (pwdField.text != "")
        {
            if !(common.phonevalidate(value: phoneNumberTextField.text!)){
                self.view.makeToast("Enter a valid Phone number", duration: 2.0, position: .center)
                return
            }
            if (loginCount <= 2){
                loginCount = loginCount + 1
            
            SwiftLoader.show(title: "Signing in...", animated: true)
            
            let loginParameter: [String: Any] = [
            "phone":phoneNumberTextField.text!,
            "password": pwdField.text!,
            "device_token":UserDefaults.standard.string(forKey: "device_token")]
            let loginUrl = serviceUrl + "login.php"
            
            Alamofire.request(loginUrl, method: .post, parameters: loginParameter,  headers: nil).responseJSON{ (response:DataResponse<Any>) in
                print(response.result)
                switch(response.result)
                {
                case .success(_):
                    if response.result.value != nil{
                        
                        print(response.result.value)
                        if let dict = response.result.value as? [String: Any] as NSDictionary?{
                            // print("loginDict= ", dict)
                            let status = dict.object(forKey: "status") as? String
                            
                            defaults.synchronize()
                            if status == "invalid" {
                                SwiftLoader.hide()
                                self.view.makeToast("Phone number and password is incorrect", duration: 2.0, position: .center)
                            }
                            else{
                                userDictionary = dict["login"] as? NSDictionary
                                defaults.set(userDictionary, forKey: "loginData")
                                let client_id = userDictionary?.object(forKey:"id")
                                let loginName = userDictionary?.object(forKey: "name")
                                defaults.set(loginName, forKey: "userName")
                                defaults.set(client_id!, forKey: "userId")
                                let userEmail = userDictionary?.object(forKey: "email")
                                defaults.set(userEmail, forKey: "userEmailID")
                                let pwd = userDictionary?.object(forKey: "password")
                                defaults.set(pwd, forKey: "password")
                                SwiftLoader.hide()
                                self.performSegue(withIdentifier: "dashboard", sender: self)
                            }
                        }}
                    
                case .failure(_):
                    SwiftLoader.hide()
                  break
                }
             }
         }
            else{
                freezView.isHidden = false
                lblCount.text = String(count)
                count = 30
                loginCount = 0
                timeCount = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
            }
        }
        else{
            let alert = UIAlertController(title:"Credential", message:"Please fill your UserId and Password",preferredStyle:UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:nil))
            self.present(alert, animated: true, completion: nil)
            
        
        }
        
    }

    func updateCounter() {
        
        //you code, this is an example
        if self.count > 0 {
            // print("\(self.count) seconds to the end of the world")
            
            self.count -= 1
            self.lblCount.text = String(self.count)
        }
        else if self.count == 0{
            self.freezView.isHidden = true
            timeCount.invalidate()
            
            print("func stopTimer")
        }
        
    }
    
    @IBAction func guestUserBtnClicked(_ sender: Any) {
        
        //performSegue(withIdentifier: "guestUser", sender: self)
        
        //performSegue(withIdentifier: "guestuserToAppointment", sender: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "appointment_call") as! AppoinmentScheduleVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextfield(textfield: textField, moveDistance: -100, up: true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        moveTextfield(textfield: textField, moveDistance: -100, up: false)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    

}
extension UITextField{
    func textfieldBorderBottom(){
        
      // self.addSubview(borderLine)
       
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor(red: 240.0/255.0, green: 121.0/255.0, blue: 13.0/255.0, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
      
        
    }
   
    

}
extension UIView{
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height:width)
        self.layer.addSublayer(border)
        
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
    }
   func dismissKeyboard() {
        
        view.endEditing(true)
        
    }
    func moveTextfield(textfield: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let moveMent:CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        UIView.beginAnimations("animationTextfield", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: moveMent)
        UIView.commitAnimations()
    }
   
}
extension UIViewController {
    
    func keyboardWillShow(notification: NSNotification) {

        self.view.frame.origin.y = self.view.frame.origin.y - 30
    }

    func keyboardWillHide(notification: NSNotification) {

        self.view.frame.origin.y = 0
    }
    func invokeAlertMethod(strTitle: NSString, strBody: NSString, delegate: AnyObject?) {
        let alert: UIAlertView = UIAlertView()
        alert.message = strBody as String
        alert.title = strTitle as String
        alert.delegate = delegate
        alert.addButton(withTitle: "Ok")
        alert.show()
    }
    func topTitleRemove() {
        navigationController?.navigationBar.topItem?.title = ""
    }

}


