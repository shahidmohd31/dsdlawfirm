//
//  AppoinmentScheduleVC.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 14/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import Alamofire
import DropDown
import MRCountryPicker
import TextFieldEffects

class AppoinmentScheduleVC: UIViewController, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var guestBtn: UIButton!
    @IBOutlet weak var lblAddPeople: UILabel!
    @IBOutlet var lblPhoneCode: UILabel!
    
    @IBOutlet weak var btnGuestManager: UIButton!
    @IBOutlet weak var scrollAppointment: UIScrollView!
    @IBOutlet var phoneCodePickerView: MRCountryPicker!
    @IBOutlet var btnEmergency: UIButton!
    @IBOutlet var selectBtn: UIButton!
@IBOutlet weak var innerview: UIView!
    @IBOutlet var userNameTextField: HoshiTextField!
    
    @IBOutlet weak var addPeopleButton: UIButton!
    
    @IBOutlet var emailTextField: HoshiTextField!
    
    @IBOutlet var phoneTextField: HoshiTextField!
    
    @IBOutlet weak var dateAndTimeTextFields: HoshiTextField!
    
    @IBOutlet weak var addNameTextFields: HoshiTextField!
    
    
    @IBOutlet var messageText: UITextView!
    
    @IBOutlet var btnDirectToOffiec: UIButton!
    @IBOutlet var btnCaseManager: UIButton!
    
    var toCaseManager:String? = nil
    var guestUser: String?
    var isHiddenPickerView = false
    var people = ""
    var isshown: Bool = false
    // emergency dropdown code
    let emergency = DropDown()
    let caseMangerDrop = DropDown()
    let guestManager = DropDown()
    lazy var dropDowns: [DropDown] = {
        return  [self.emergency,
                 self.caseMangerDrop,
                 self.guestManager] }()
    
    var datePicker = UIDatePicker()
    var dateFormatter = DateFormatter()
    var date = Date()
    
    var peopleArray: [String] = []
    
    let emergencyData = ["Select case manager","Dalbir Singh (Attorney)","Natasha M (Attorney)","Eric (Attorney)","Alex H (Senior Paralegal)","Shahzad R (Senior Paralegal)","Tabassam C (Senior Paralegal)","Naji (Paralegal)","Amit K (Paralegal)","Simran K (Paralegal)","Mahima B (Paralegal)","Sophia (Law Clerk)"]
    let guestData = ["More guest(optional) ","Dalbir Singh (Attorney)","Natasha M (Attorney)","Eric (Attorney)","Alex H (Senior Paralegal)","Shahzad R (Senior Paralegal)","Tabassam C (Senior Paralegal)","Naji (Paralegal)","Amit K (Paralegal)","Simran K (Paralegal)","Mahima B (Paralegal)","Sophia (Law Clerk)"]
    let caseManagerData = ["Select Appointment type","Case Manager","Direct to office"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.btnGuestManager.isHidden = true
        self.btnEmergency.frame.origin.y = self.selectBtn.frame.origin.y + self.selectBtn.frame.height + 5
        
        self.myView.frame.origin.y = self.btnEmergency.frame.origin.y + self.btnEmergency.frame.height - 10
            hideKeyboardWhenTappedAround()
        dateFormatter.dateFormat = setDateFormat
        self.dateAndTimeTextFields.text = dateFormatter.string(from: date)
        
        self.setupDatePicker(textFields: dateAndTimeTextFields)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        self.navigationController?.navigationItem.title = "Case Notification"
        
        let userLoginDict = defaults.object(forKey: "loginData") as? NSDictionary
        if userLoginDict != nil{
            userNameTextField.text = userLoginDict?.object(forKey: "name") as? String
            emailTextField.text = userLoginDict?.object(forKey: "email") as? String
            phoneTextField.text = userLoginDict?.object(forKey: "enteredPhone") as? String
            
            
        }

        showDropDown()
        //setupDropDownscall()
        dropDowns.forEach { $0.dismissMode = .onTap }
        dropDowns.forEach { $0.direction = .any }
        
        //lblAddPeople.addBottomBorderWithColor(color: .black, width: 1.0)
        //  lblAddPeople.clipsToBounds = true
        scrollAppointment.delegate = self
        
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.scrollAppointment.contentSize.height = 700
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationItem.title = "Appointment Schedule"
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func pickerShowCall() {
        hideKeyboardWhenTappedAround()
        if isHiddenPickerView == false {
            phoneCodePickerView.isHidden = false
            print("working")
            isHiddenPickerView = true
        }
        else {
            phoneCodePickerView.isHidden = true
            isHiddenPickerView = false
        }
    }
    
    func setupChooseAppointmentDropDown() {
        
        emergency.anchorView = btnEmergency
       
        emergency.dataSource = emergencyData
        
        emergency.selectionAction = { [unowned self] (index, item) in
            self.btnEmergency.setTitle(item, for: .normal)
        }
    }
    
    func setGuestUserAppoinmentDropDown() {
        
//        guestManager.anchorView = btnGuestManager
        
        guestManager.dataSource = guestData
        
        guestManager.selectionAction = { [unowned self] (index, item) in
//            self.btnGuestManager.setTitle(item, for: .normal)
        }
    }
    
    func caseManagerChooseAppointmentDropDown() {
        
        caseMangerDrop.anchorView = selectBtn
        
        caseMangerDrop.dataSource = caseManagerData
        
        caseMangerDrop.selectionAction = { [unowned self] (index, item) in
            self.selectBtn.setTitle(item, for: .normal)
            if item == "Direct to office" {
                self.btnEmergency.isHidden = true
                self.myView.frame.origin.y = self.selectBtn.frame.origin.y + self.selectBtn.frame.height - 10
//                self.btnGuestManager.isHidden = true
            }
            else {
                self.btnEmergency.isHidden = false
                self.btnEmergency.frame.origin.y = self.selectBtn.frame.origin.y + self.selectBtn.frame.height + 5
                
                self.myView.frame.origin.y = self.btnEmergency.frame.origin.y + self.btnEmergency.frame.height - 10
                
//                self.btnGuestManager.isHidden = true
            }
        }
    }
    
    func showDropDown(){
        caseManagerChooseAppointmentDropDown()
        setupChooseAppointmentDropDown()
        setGuestUserAppoinmentDropDown()
    }
    
    @IBAction func btnEmergencyTapped(_ sender: AnyObject) {
        emergency.show()
        
    }
    @IBAction func selectbtnClicked(_ sender: AnyObject) {
        
        caseMangerDrop.show()
        
    }
    @IBAction func btnGuestManagerTapped(_ sender: Any) {
        guestManager.show()
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any) {
        if (userNameTextField.text != "") && (emailTextField.text != "") && (phoneTextField.text != "") && (selectBtn.titleLabel?.text != "") && (btnEmergency.titleLabel?.text != "")
        {
            
            print(btnEmergency.titleLabel?.text)
            if selectBtn.titleLabel?.text == "  Select Appointment type !!"{
                self.view.makeToast("Please select Appointment Type", duration: 2.0, position: .center)
                return
            }else{
                if btnEmergency.titleLabel?.text == "  Select Case Manager" && selectBtn.titleLabel?.text == "Case Manager"{
                    self.view.makeToast("Please select case manager", duration: 2.0, position: .center)
                    return
                }else{
                     toCaseManager = "DALBIR@DSDLAWFIRM.COM"
                }
            }
            
            
            
            if !(common.isValidEmail(testStr: emailTextField.text!)){
                self.view.makeToast("Enter valid email id.", duration: 2.0, position: .center)
                return
            }
            if !(common.phonevalidate(value: phoneTextField.text!)){
                self.view.makeToast("Enter valid phone no.", duration: 2.0, position: .center)
                return
            }
            SwiftLoader.show(title: "Saving...", animated: true)
            if btnEmergency.titleLabel?.text != "Select Case Manager"{
                
                if (btnEmergency.titleLabel?.text?.uppercased().contains("ALEX"))!  {
                    toCaseManager = "ALEX@DSDLAWFIRM.COM"
                }
                if (btnEmergency.titleLabel?.text?.uppercased().contains("AMIT"))!  {
                    toCaseManager = "AMIT@DSDLAWFIRM.COM"
                }
                if (btnEmergency.titleLabel?.text?.uppercased().contains("DALBIR"))!  {
                    toCaseManager = "DALBIR@DSDLAWFIRM.COM"
                }
                if (btnEmergency.titleLabel?.text?.uppercased().contains("ERIC"))!  {
                    toCaseManager = "ERIC@DSDLAWFIRM.COM"
                }
                if (btnEmergency.titleLabel?.text?.uppercased().contains("MAHIMA"))!  {
                    toCaseManager = "MAHIMA@DSDLAWFIRM.COM"
                }
                if (btnEmergency.titleLabel?.text?.uppercased().contains("NAJI"))!  {
                    toCaseManager = "NAJI@DSDLAWFIRM.COM"
                }
                if (btnEmergency.titleLabel?.text?.uppercased().contains("NATASHA"))!  {
                    toCaseManager = "NATASHA@DSDLAWFIRM.COM"
                }
                if (btnEmergency.titleLabel?.text?.uppercased().contains("SHAHZAD"))!  {
                    toCaseManager = "SHAHZAD@DSDLAWFIRM.COM"
                }
                if (btnEmergency.titleLabel?.text?.uppercased().contains("SIMRAN"))!  {
                    toCaseManager = "SIMRAN@DSDLAWFIRM.COM"
                }
                if (btnEmergency.titleLabel?.text?.uppercased().contains("SOPHIA"))!  {
                    toCaseManager = "SOPHIA@DSDLAWFIRM.COM"
                }
                if (btnEmergency.titleLabel?.text?.uppercased().contains("TABASSAM"))!  {
                    toCaseManager = "TABASSAM@DSDLAWFIRM.COM"
                }
//                if btnGuestManager.titleLabel?.text != nil{ //commented if
                if false{
                    if btnGuestManager.titleLabel?.text == "More guest(optional)" {
                        guestUser = ""
                    }
                    else{
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("ALEX"))!  {
                            guestUser = "ALEX@DSDLAWFIRM.COM"
                        }
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("AMIT"))!  {
                            guestUser = "AMIT@DSDLAWFIRM.COM"
                        }
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("DALBIR"))!  {
                            guestUser = "DALBIR@DSDLAWFIRM.COM"
                        }
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("ERIC"))!  {
                            guestUser = "ERIC@DSDLAWFIRM.COM"
                        }
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("MAHIMA"))!  {
                            guestUser = "MAHIMA@DSDLAWFIRM.COM"
                        }
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("NAJI"))!  {
                            guestUser = "NAJI@DSDLAWFIRM.COM"
                        }
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("NATASHA"))!  {
                            guestUser = "NATASHA@DSDLAWFIRM.COM"
                        }
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("SHAHZAD"))!  {
                            guestUser = "SHAHZAD@DSDLAWFIRM.COM"
                        }
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("SIMRAN"))!  {
                            guestUser = "SIMRAN@DSDLAWFIRM.COM"
                        }
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("SOPHIA"))!  {
                            guestUser = "SOPHIA@DSDLAWFIRM.COM"
                        }
                        if (btnGuestManager.titleLabel?.text?.uppercased().contains("TABASSAM"))!  {
                            guestUser = "TABASSAM@DSDLAWFIRM.COM"
                        }
                    }
                }
                
                let defaults = UserDefaults.standard
                var client_id = ""
                if let cc = defaults.object(forKey: "userId") as? String{
                   client_id = cc
                }
                var p1 = "", p2="",p3=""
                let arrp = people.components(separatedBy: ",")
                if arrp.count>0{
                    p1 = arrp[0]
                }
                if arrp.count>1{
                    p2 = arrp[1]
                }
                if arrp.count>2{
                    p3 = arrp[2]
                }
               
                var toCaseManagerParam:String = ""
                if toCaseManager != nil {
                    toCaseManagerParam = toCaseManager!
                }
                let appoinment_parameters: [String: Any] = [
                    "client_id":client_id,
                    "case_manager_email": toCaseManagerParam ,
                    "name": userNameTextField.text!,
                    "email": emailTextField.text!,
                    "phone": phoneTextField.text!,
                    "message":messageText.text!,
                    "appdate":dateAndTimeTextFields.text!,
                    "addpeople":p1,
                    "addpeople1":p2,
                "addpeople2":p3]
                print(appoinment_parameters)
                let appoinment_url = serviceUrl + "appointment_schedule.php"
                Alamofire.request(appoinment_url, method: .post, parameters: appoinment_parameters, headers: nil).responseJSON { (response:DataResponse<Any>) in
                    print("response=",response)
                    
                    switch(response.result) {
                    case .success(_):
                        if response.result.value != nil{
                            if let dic = response.result.value as? [String: Any] as NSDictionary?{
                                let status = dic.object(forKey: "status") as? String
                                self.view.makeToast(status!, duration: 2.0, position: .center)
                                SwiftLoader.hide()
                                 DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                self.navigationController?.popViewController(animated: true)
                                }
                            }
                        }
                        self.userNameTextField.text = ""
                        self.emailTextField.text = ""
                        self.phoneTextField.text = ""
                        self.btnEmergency.setTitle(self.emergencyData[0], for: .normal)
//                        self.btnGuestManager.setTitle(self.guestData[0], for: .normal)
                        self.selectBtn.setTitle(self.caseManagerData[0], for: .normal)
                        self.dateAndTimeTextFields.text = ""
                        self.messageText.text = ""
                        self.addNameTextFields.text = ""
                        break
                    case .failure(_):
                        SwiftLoader.hide()
                        print("fail=", response.result.error!)
                        break
                        
                    }
                }
            }
            else{
                SwiftLoader.hide()
                Profile.invokeAlertMethod(strTitle: "Alert", strBody: "Please Select case manager!", delegate: nil)
            }
        }
        else{
            SwiftLoader.hide()
            
            self.view.makeToast("Please fill all field", duration: 2.0, position: .center)
        }
    }
    
    @IBAction func addPeopleTapped(_ sender: Any) {
        if peopleArray.count < 3 {
            showAddAlert()
        }
        else{
            addPeopleButton.isEnabled = false
            self.view.makeToast("You can add only upto 3 people", duration: 2.0, position: .center)
        }
    }
    
    func showAddAlert() {
        let alert = UIAlertController.init(title: "Add people", message: "Please add a name", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter a name"
        }
        let saveAction = UIAlertAction.init(title: "Save", style: .default) { Void in
            if let text = alert.textFields![0].text {
                if self.peopleArray.count < 3 {
                    
                    self.peopleArray.append(text)
                    if self.peopleArray.count == 1
                    {
                        self.people = "\(text)"
                    }
                    else {
                        self.people = ""
                        for name in self.peopleArray {
                            if self.people == ""{
                            self.people += "\(name)"
                            }else{
                                self.people += ",\(name)"
                            }
                        }}
                    self.addNameTextFields.text = self.people
                }
            }
        }
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupDatePicker(textFields:HoshiTextField) {
        datePicker.datePickerMode = .dateAndTime
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textFields.inputView = datePicker
        textFields.inputAccessoryView = toolBar
    }
    
    func doneClick() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        if dateAndTimeTextFields?.isFirstResponder == true {
            dateAndTimeTextFields!.text = dateFormatter.string(from: datePicker.date)
            dateAndTimeTextFields!.resignFirstResponder()
        }
    }
    func cancelClick() {
        dateAndTimeTextFields!.resignFirstResponder()
        dateAndTimeTextFields!.resignFirstResponder()
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
