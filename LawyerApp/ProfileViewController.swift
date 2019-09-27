//
//  ProfileViewController.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 13/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import Alamofire
import FMDB
import DropDown
import MRCountryPicker
import TextFieldEffects


class ProfileViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIAlertViewDelegate ,UITextFieldDelegate{
    
    @IBOutlet weak var familyMember1Card: UIView!
    
    
    @IBOutlet weak var switch1: UISwitch!
    
    @IBOutlet weak var switch8: UISwitch!
    @IBOutlet weak var switch7: UISwitch!
    @IBOutlet weak var switch6: UISwitch!
    @IBOutlet weak var switch5: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var familyMember1City: UITextField!
    
    @IBOutlet weak var familyMember8City: UITextField!
    @IBOutlet weak var familyMember7City: UITextField!
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var familyMember2City: UITextField!
    @IBOutlet weak var familyMember3City: UITextField!
    
    @IBOutlet weak var familyMember6City: UITextField!
    @IBOutlet weak var familyMember5City: UITextField!
    @IBOutlet weak var familyMember4City: UITextField!
    
    
    
    @IBOutlet weak var saveInfoCard: UIView!
    @IBOutlet weak var familyMember2Card: UIView!
    
    
    @IBOutlet weak var familyMember7Name: HoshiTextField!
    
    @IBOutlet weak var familyMember8Name: HoshiTextField!
    @IBOutlet weak var familyMember8email: HoshiTextField!
    @IBOutlet weak var familyMember8alienumber: HoshiTextField!
    
    @IBOutlet weak var familyMember8maleBtn: UIButton!
    @IBOutlet weak var familyMember8femaleBtn: UIButton!
    @IBOutlet weak var familyMember8phone: HoshiTextField!
    @IBOutlet weak var familyMember8dob: HoshiTextField!
    @IBOutlet weak var familyMember8relation: HoshiTextField!
    @IBOutlet weak var familyMember7maleBtn: UIButton!
    @IBOutlet weak var familyMember7femaleBtn: UIButton!
    @IBOutlet weak var familyMember7phone: HoshiTextField!
    @IBOutlet weak var familyMember7alienumber: HoshiTextField!
    @IBOutlet weak var familyMember7email: HoshiTextField!
    @IBOutlet weak var familyMember7dob: HoshiTextField!
    @IBOutlet weak var familyMember7Relation: HoshiTextField!
    @IBOutlet weak var familyMember6maleBtn: UIButton!
    @IBOutlet weak var familyMember6femaleBtn: UIButton!
    @IBOutlet weak var familyMember6phone: HoshiTextField!
    @IBOutlet weak var familyMember6Alienumber: HoshiTextField!
    @IBOutlet weak var familyMember6Email: HoshiTextField!
    @IBOutlet weak var familyMember6dob: HoshiTextField!
    @IBOutlet weak var familyMember6relation: HoshiTextField!
    @IBOutlet weak var familyMember6Name: HoshiTextField!
    @IBOutlet weak var familyMember3Card: UIView!
    @IBOutlet weak var familyMember4Card: UIView!
    @IBOutlet weak var familyMember5Card: UIView!
    @IBOutlet weak var familyMember6Card: UIView!
    @IBOutlet weak var familyMember7Card: UIView!
    @IBOutlet weak var familyMember8Card: UIView!
    @IBOutlet weak var familyMember9Card: UIView!
//    @IBOutlet weak var familyMember2Card: UIView!
//    @IBOutlet weak var familyMember2Card: UIView!
    
    //user information only
    
    @IBOutlet weak var cityAndCountryOfbirthTextFields: HoshiTextField!
    @IBOutlet weak var meritstatusTextFields: HoshiTextField!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var phoneCodePicker: MRCountryPicker!
     @IBOutlet weak var nameTextFiled1: HoshiTextField!
    @IBOutlet var currentStateTextField: UITextField!
    @IBOutlet var currentCityTextField: UITextField!
    @IBOutlet var currentCountryTextField: UITextField!
    @IBOutlet var currentZipcodeTextField: UITextField!
    @IBOutlet var lastDateEntryUSA: UITextField!
    //family member informations
    
    
    
    @IBOutlet weak var familyMember3name: HoshiTextField!
    
    @IBOutlet weak var familyMember5alienumber: HoshiTextField!
    @IBOutlet weak var familyMember5email: HoshiTextField!
    @IBOutlet weak var familyMember5dob: HoshiTextField!
    @IBOutlet weak var familyMember5Relation: HoshiTextField!
    @IBOutlet weak var familyMember5Name: HoshiTextField!
    @IBOutlet weak var familyMember4Name: HoshiTextField!
    @IBOutlet weak var familyMember3relation: HoshiTextField!
    @IBOutlet weak var familyMember5phone: HoshiTextField!
    
    @IBOutlet weak var familyMember4Relation: HoshiTextField!
    @IBOutlet weak var familyMember3dob: HoshiTextField!
    @IBOutlet weak var familyMember4aliennumber: HoshiTextField!
    
    @IBOutlet weak var familyMember4makeBtn: UIButton!
    @IBOutlet weak var familyMember4femaleBtn: UIButton!
    @IBOutlet weak var familyMember4phone: HoshiTextField!
    @IBOutlet weak var familyMember4email: HoshiTextField!
    @IBOutlet weak var familyMember4dob: HoshiTextField!
    @IBOutlet weak var familyMember3email: HoshiTextField!
    @IBOutlet weak var famiyMemberTextField: HoshiTextField!
    @IBOutlet weak var familyAlineNumberTextFields: HoshiTextField!
    @IBOutlet weak var familyEmailTextFields: HoshiTextField!
    @IBOutlet weak var familyNumberTextFields: HoshiTextField!
    
    @IBOutlet weak var familyMember3alient: HoshiTextField!
    @IBOutlet weak var inUSACityCountryTextFields: HoshiTextField!
   
    @IBOutlet weak var familyMember3maleBtn: UIButton!
    @IBOutlet weak var familyMember3femaleBtn: UIButton!
    @IBOutlet weak var familyMember3phone: HoshiTextField!
    @IBOutlet weak var relationTextField1: HoshiTextField!
    @IBOutlet weak var dobTextField1: HoshiTextField!
    @IBOutlet weak var emailTextField1: HoshiTextField!
    @IBOutlet weak var phoneNoTextField1: HoshiTextField!
    @IBOutlet weak var familyTextField1: HoshiTextField!
    @IBOutlet weak var ifAnyNoTextField: HoshiTextField!
    @IBOutlet var currentAddressTextField: UITextField!
    @IBOutlet weak var btnprofileGenderMale: UIButton!
    var btnprofileGender: String = ""
    
    
    @IBAction func femaleBtnClicked(_ sender: Any) {
        let button = sender as! UIButton
        let index = button.tag
        switch index {
        case 1:
            if(!(sender as AnyObject).isSelected){
                //            btnprofileGender = "Male"
                //            btnprofileGenderMale.isSelected = !btnprofileGenderMale.isSelected
                (sender as AnyObject).setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
                btnprofileGenderFemale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            }
            else {
                btnprofileGenderMale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
                btnprofileGender = ""
            }
            btnprofileGenderFemale.isSelected = false
            break
        case 2:
            if(!(sender as AnyObject).isSelected){
                //            btnprofileGender = "Male"
                //            btnprofileGenderMale.isSelected = !btnprofileGenderMale.isSelected
                (sender as AnyObject).setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
                btnprofileGenderFemale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            }
            else {
                btnprofileGenderMale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
                btnprofileGender = ""
            }
            btnprofileGenderFemale.isSelected = false
        default:
            print("default")
        }
        
        
    
    }
    
    @IBAction func maleBtnClicked(_ sender: Any) {
    
    
    }
    
    
    @IBAction func btnprofileGenderMaleTapped(_ sender: Any) {
        if(!btnprofileGenderMale.isSelected){
            btnprofileGender = "Male"
            btnprofileGenderMale.isSelected = !btnprofileGenderMale.isSelected
            btnprofileGenderMale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnprofileGenderFemale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
        }
        else {
            btnprofileGenderMale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnprofileGender = ""
        }
        btnprofileGenderFemale.isSelected = false
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let position = touch.location(in: view)
//            print(position)
//        }
//    }
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        for subview in subviews {
//            if !subview.isHidden && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
//                return true
//            }
//        }
//        return false
//    }
    
//    class PassThroughView: UIView {
//        override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//            for subview in subviews {
//                if !subview.isHidden && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
//                    return true
//                }
//            }
//            return false
//        }
//    }
    @IBOutlet weak var btnprofileGenderFemale: UIButton!
    @IBAction func btnprofileGenderFemale(_ sender: Any) {
        if(!btnprofileGenderFemale.isSelected){
            btnprofileGender = "Female"
            btnprofileGenderFemale.isSelected = !btnprofileGenderFemale.isSelected
            btnprofileGenderMale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnprofileGenderFemale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
        }
        else {
            btnprofileGenderFemale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnprofileGender = ""
        }
        btnprofileGenderMale.isSelected = false
    }
    @IBOutlet weak var btnFamilyMemberGenderMale: UIButton!
    var btnfamilyMemberGender: String?
    @IBAction func btnFamilyMemberGenderMaleTapped(_ sender: Any) {
        if(!btnFamilyMemberGenderMale.isSelected){
            btnfamilyMemberGender = "Male"
            btnFamilyMemberGenderMale.isSelected = !btnFamilyMemberGenderMale.isSelected
            btnFamilyMemberGenderMale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnFamilyMemberGenderFemale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
        }
        else {
            btnFamilyMemberGenderMale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnfamilyMemberGender = ""
        }
        btnFamilyMemberGenderFemale.isSelected = false
    }
    
    @IBOutlet weak var btnFamilyMemberGenderFemale: UIButton!
    @IBAction func btnFamilyMemberGenderFemaleTapped(_ sender: Any) {
        if(!btnFamilyMemberGenderFemale.isSelected){
            btnfamilyMemberGender = "Female"
            btnFamilyMemberGenderFemale.isSelected = !btnFamilyMemberGenderFemale.isSelected
            btnFamilyMemberGenderMale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnFamilyMemberGenderFemale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
        }
        else {
            btnFamilyMemberGenderFemale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnfamilyMemberGender = ""
        }
        btnFamilyMemberGenderMale.isSelected = false
    }
    @IBOutlet weak var btnFamilyMemberGenderMale1: UIButton!
    var btnfamilyMemberGender1: String?
    @IBAction func btnFamilyMemberGenderMale1Tapped(_ sender: Any) {
        
        if(!btnFamilyMemberGenderMale1.isSelected){
            btnfamilyMemberGender1 = "Male"
            btnFamilyMemberGenderMale1.isSelected = !btnFamilyMemberGenderMale1.isSelected
            btnFamilyMemberGenderMale1.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnFamilyMemberGenderFemale1.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
        }
        else {
            btnFamilyMemberGenderMale1.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnfamilyMemberGender1 = ""
        }
        btnFamilyMemberGenderFemale1.isSelected = false
    }
    @IBOutlet weak var btnFamilyMemberGenderFemale1: UIButton!
    @IBAction func btnFamilyMemberGenderFemale1Tapped(_ sender: Any) {
        if(!btnFamilyMemberGenderFemale1.isSelected){
            btnfamilyMemberGender1 = "Female"
            btnFamilyMemberGenderFemale1.isSelected = !btnFamilyMemberGenderFemale1.isSelected
            btnFamilyMemberGenderMale1.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnFamilyMemberGenderFemale1.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
        }
        else {
            btnFamilyMemberGenderFemale1.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnfamilyMemberGender1 = ""
        }
        btnFamilyMemberGenderMale1.isSelected = false
    }
    @IBOutlet weak var btnFamilyMemberGenderMale2: UIButton!
    var btnfamilyMemberGender2: String?
    @IBAction func btnFamilyMemberGenderMale2Tapped(_ sender: Any) {
        if(!btnFamilyMemberGenderMale2.isSelected){
            btnfamilyMemberGender2 = "Male"
            btnFamilyMemberGenderMale2.isSelected = !btnFamilyMemberGenderMale2.isSelected
            btnFamilyMemberGenderMale2.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnFamilyMemberGenderFemale2.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
        }
        else {
            btnFamilyMemberGenderMale2.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnfamilyMemberGender2 = ""
        }
        btnFamilyMemberGenderFemale2.isSelected = false
    }
    @IBOutlet weak var btnFamilyMemberGenderFemale2: UIButton!
    @IBAction func btnFamilyMemberGenderFemale2Tapped(_ sender: Any) {
        
        if(!btnFamilyMemberGenderFemale2.isSelected){
            btnfamilyMemberGender2 = "Female"
            btnFamilyMemberGenderFemale2.isSelected = !btnFamilyMemberGenderFemale2.isSelected
            btnFamilyMemberGenderMale2.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnFamilyMemberGenderFemale2.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
        }
        else {
            btnFamilyMemberGenderFemale2.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnfamilyMemberGender2 = ""
        }
        btnFamilyMemberGenderMale2.isSelected = false
    }
    @IBOutlet weak var btnInUSAYes: UIButton!
    var btninUSA: String?
    @IBAction func btnInUSAYesTapped(_ sender: Any) {
        if(!btnInUSAYes.isSelected){
            btninUSA = "Yes"
            btnInUSAYes.isSelected = !btnInUSAYes.isSelected
        }
        btnInUSANo.isSelected = false
    }
    @IBOutlet weak var btnInUSANo: UIButton!
    @IBAction func btnInUSANoTapped(_ sender: Any) {
        
        if(!btnInUSANo.isSelected){
            btninUSA = "No"
            btnInUSANo.isSelected = !btnInUSANo.isSelected
        }
        btnInUSAYes.isSelected = false
    }
    
    @IBOutlet var dobPicker: UIDatePicker!
    var isDOBdisplay = false
    var isLast = false
    var isFamily = false
    var isDobInUSA = false
    var isViewVisible = false
    @IBOutlet var imgCountry: UIImageView!
    @IBOutlet var lblPhoneCode: UILabel!
    @IBOutlet var countryName: UILabel!
    @IBOutlet var countryCode: UILabel!
    var getAllinfo:NSMutableArray = NSMutableArray()
    var setDateFormat:String = "yyyy/MM/dd"
    var info:ClientInfo = ClientInfo()
    @IBOutlet var lbl:UILabel!
    var imgPicker = UIImagePickerController()
    @IBOutlet var inUSATextFieldDateEntry: UITextField!
    @IBOutlet var proView: UIView!
    @IBOutlet var scrollProfile: UIScrollView!
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var firstNametextField: UITextField!
    @IBOutlet var middleNameTextField: UITextField!
    @IBOutlet var lastNametextfield: UITextField!
    @IBOutlet var dobTextfield: UITextField!
    @IBOutlet var alienNumberTextfield: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var contactTextfield: UITextField!
    @IBOutlet var dateEntryPortTextField: UITextField!
    @IBOutlet var clientVisaTimeEntryTextField: UITextField!
    @IBOutlet var relationTextfiled: UITextField!
    @IBOutlet var familyNameTextField: UITextField!
    @IBOutlet var familydobTextField: UITextField!
    @IBOutlet var selectStates: UIButton!
    @IBOutlet var selectPortEntry: UIButton!
    @IBOutlet var visaStatusBtn: UIButton!
    var userArr:NSMutableArray = NSMutableArray()
    @IBOutlet var clientVisaAtTheTimeOFentryBtn: UIButton!
    @IBOutlet var selectVisaTimeEntry: UIButton!
    @IBOutlet var dateEntryPortUSATextField: UITextField!
    @IBOutlet var documentImg: UIImageView!
    @IBOutlet var editandSubmitBtn: UIButton!
    @IBOutlet var documentTitleLbl: UILabel!
    @IBOutlet weak var familyMember1Name: HoshiTextField!
    @IBOutlet weak var familyMember1Relation: HoshiTextField!
    @IBOutlet weak var familyMember1dob: HoshiTextField!
    @IBOutlet weak var familyMember1email: HoshiTextField!
    @IBOutlet weak var familyMember1phone: HoshiTextField!
    @IBOutlet weak var familyMember1familyMember: HoshiTextField!
    @IBOutlet weak var familyMember1alienNumber: HoshiTextField!
    @IBOutlet weak var familyMember2Name: HoshiTextField!
    @IBOutlet weak var familyMember2Relation: HoshiTextField!
    @IBOutlet weak var familyMember2dob: HoshiTextField!
    @IBOutlet weak var familyMember2email: HoshiTextField!
    @IBOutlet weak var familyMember2phone: HoshiTextField!
    @IBOutlet weak var familyMember2familyMember: HoshiTextField!
    @IBOutlet weak var familyMember2alienNumber: HoshiTextField!
    var isHiddenPicker = false
    var full_name:String?
    let chooseArticleDropDown = DropDown()
    let chooseState = DropDown()
    let chooseMaritalStatus = DropDown()
    let chooseCountry = DropDown()
    let choosePortEntry = DropDown()
    let ChooseVisaTimeEntry = DropDown()
    let chooseVisaStatus = DropDown()
    var datePicker: UIDatePicker = UIDatePicker()
    var clientDetailsArr: NSMutableArray = NSMutableArray()
    let chooseClientVisaAtThetimeOfEntry = DropDown()
    lazy var dropDowns: [DropDown] = {
        return [
            self.chooseArticleDropDown,
            self.choosePortEntry,
            self.ChooseVisaTimeEntry,
            self.chooseClientVisaAtThetimeOfEntry,
            self.chooseVisaStatus
        ]
    }()
    var rect = CGRect(
        origin: CGPoint(x: 0, y: 0),
        size: UIScreen.main.bounds.size
    )
    var isedit = false
    
    
    @IBAction func addFamilyMemberCard(_ sender: Any) {
        let button = sender as! UIButton
        let index = button.tag
        button.isEnabled = false
        print(index)
        print(UIScreen.main.bounds.size)
        print(proView.frame.height)
        print(self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 2)
        UIView.animateKeyframes(withDuration: 0.25, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: 7), animations: {
          
            self.familyMember1Card.isHidden = false
            self.saveInfoCard.frame.origin.y = self.familyMember1Card.frame.origin.y + self.familyMember1Card.frame.height + 2
//           self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
            
            if index == 2{
                self.familyMember2Card.isHidden = false
                self.familyMember2Card.frame.origin.y = self.familyMember2Card.frame.origin.y + 60
                self.saveInfoCard.frame.origin.y = self.familyMember2Card.frame.origin.y + self.familyMember2Card.frame.height + 2
                
//                 self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
            }
            if index == 3{
                self.familyMember3Card.isHidden = false
                self.familyMember3Card.frame.origin.y = self.familyMember2Card.frame.origin.y + self.familyMember2Card.frame.height + 2
//                self.view.bringSubview(toFront: self.familyMember3Card)

                self.saveInfoCard.frame.origin.y = self.familyMember3Card.frame.origin.y + self.familyMember3Card.frame.height + 2
                
                self//.familyMember3Card.backgroundColor = UIColor.green
//                self.proView.frame.height = self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 2
//                self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
            }
            
            if index == 4{
                self.familyMember4Card.isHidden = false
                self.familyMember4Card.frame.origin.y = self.familyMember3Card.frame.origin.y + self.familyMember3Card.frame.height + 5
//                self.view.bringSubview(toFront: self.familyMember4Card)
                //self.familyMember4Card.backgroundColor = UIColor.green
                self.saveInfoCard.frame.origin.y = self.familyMember4Card.frame.origin.y + self.familyMember4Card.frame.height + 2
                
                
                
//                self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
            }
            if index == 5{
                self.familyMember5Card.isHidden = false
                self.familyMember5Card.frame.origin.y = self.familyMember4Card.frame.origin.y + self.familyMember4Card.frame.height + 5
//                self.familyMember5Card.backgroundColor = UIColor.green
//                self.proView.backgroundColor = UIColor.red
                self.saveInfoCard.frame.origin.y = self.familyMember5Card.frame.origin.y + self.familyMember5Card.frame.height + 2
                
                
                
//                self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
            }
            
            if index == 6{
                self.familyMember6Card.isHidden = false
                self.familyMember6Card.frame.origin.y = self.familyMember5Card.frame.origin.y + self.familyMember5Card.frame.height + 2
                
                self.saveInfoCard.frame.origin.y = self.familyMember6Card.frame.origin.y + self.familyMember6Card.frame.height + 2
                
                
                
//                self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
            }
            
            if index == 7{
                self.familyMember7Card.isHidden = false
                self.familyMember7Card.frame.origin.y = self.familyMember6Card.frame.origin.y + self.familyMember6Card.frame.height + 2
                
                self.saveInfoCard.frame.origin.y = self.familyMember7Card.frame.origin.y + self.familyMember7Card.frame.height + 2
                
                
                
//                self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
            }
            if index == 8{
                self.familyMember8Card.isHidden = false
                self.familyMember8Card.frame.origin.y = self.familyMember7Card.frame.origin.y + self.familyMember7Card.frame.height + 2
                
                self.saveInfoCard.frame.origin.y = self.familyMember8Card.frame.origin.y + self.familyMember8Card.frame.height + 2
                
                
                
                //                self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
            }
            if index == 9{
                self.familyMember9Card.isHidden = false
                self.familyMember9Card.frame.origin.y = self.familyMember8Card.frame.origin.y + self.familyMember8Card.frame.height + 2
                
                self.saveInfoCard.frame.origin.y = self.familyMember9Card.frame.origin.y + self.familyMember9Card.frame.height + 2
                
                
                
                //                self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
            }
            self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
            
        },completion: nil)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height + 100)
//       self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: saveInfoCard.frame.origin.y + 100)
        
        //self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)

        
       familyMember2Card.isHidden = true
        saveInfoCard.frame.origin.y = familyMember1Card.frame.origin.y
       familyMember1Card.isHidden = true
        familyMember3Card.isHidden = true
        familyMember4Card.isHidden = true
        familyMember5Card.isHidden = true
        familyMember6Card.isHidden = true
        familyMember7Card.isHidden = true
        familyMember8Card.isHidden = true
        familyMember9Card.isHidden = true
        

        meritstatusTextFields.isUserInteractionEnabled = true
        meritstatusTextFields.allowsEditingTextAttributes = false
        currentCountryTextField.isUserInteractionEnabled = true
        currentCountryTextField.allowsEditingTextAttributes = false
        currentCountryTextField.isUserInteractionEnabled = true
        currentCountryTextField.allowsEditingTextAttributes = false
        currentStateTextField.isUserInteractionEnabled = true
        currentStateTextField.allowsEditingTextAttributes = false
        let MaritalStatustapGesture = UITapGestureRecognizer.init(target: self, action: #selector(showMaritalStatusPopOver))
        meritstatusTextFields.addGestureRecognizer(MaritalStatustapGesture)
        let countryTapGesture = UITapGestureRecognizer.init(target: self, action: #selector(showCountryPopOver))
        currentCountryTextField.addGestureRecognizer(countryTapGesture)
        let stateTapGesture = UITapGestureRecognizer.init(target: self, action: #selector(showStatesPopOver))
        currentStateTextField.addGestureRecognizer(stateTapGesture)
        hideKeyboardWhenTappedAround()
//         userProfileData()
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        // NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        self.editandSubmitBtn.layer.cornerRadius = 3
        scrollProfile.delegate = self
        profileImg.layer.cornerRadius = profileImg.frame.size.width/2
        profileImg.clipsToBounds = true
        profileImg.layer.borderWidth = 1
        profileImg.layer.borderColor = UIColor.white.cgColor
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageEditCLicked))
        
        profileImg!.addGestureRecognizer(tapGesture)
        
        
        profileImg!.isUserInteractionEnabled = true
        
        //        scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: 1200)
        //    view.addSubview(scrollProfile)
        
        //        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editTapped))
        //        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        self.setupDatePicker(textFields: lastDateEntryUSA)
        self.setupDatePicker(textFields: dobTextfield)
        
        self.setupDatePicker(textFields: familydobTextField)
        self.setupDatePicker(textFields: familyMember1dob)
        self.setupDatePicker(textFields: familyMember2dob)
        //self.setupDatePicker(textFields: inUSATextFieldDateEntry)
        
        DispatchQueue.global(qos: .userInteractive).sync {
            SwiftLoader.show(title: "fetching profile...", animated: true)
            userProfile()


        }
        setupDropDowns()
        dropDowns.forEach { $0.dismissMode = .onTap }
        dropDowns.forEach { $0.direction = .any }
        
        self.proView.isUserInteractionEnabled = true
        self.editButtonItem.isEnabled = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
//        self.userProfile()
    }
    
    @objc func showStatesPopOver() {
        chooseState.show()
    }
    @objc func showMaritalStatusPopOver() {
        chooseMaritalStatus.show()
    }
    @objc func showCountryPopOver() {
        chooseCountry.show()
    }
    @objc func showPopOver() {
        chooseArticleDropDown.show()
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        cancelTapped()
    }
    
    func userProfile(){
        let parameters = [
            "id":  UserDefaults.standard.object(forKey: "userId")!
        ]
//        print(parameters)
        let url = "https://rohit.winklix.com/lawyer/app/edit_profile.php"
//        Alamofire.request(url, method:.post, parameters:parameters,encoding: JSONEncoding.default).responseJSON { response in
//            switch response.result {
//            case .success:
//                print(response)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        
            let otp_parameters: [String: Any] = [
                "id":  UserDefaults.standard.object(forKey: "userId")!
            ]
            print("parameters=", otp_parameters)
            
            Alamofire.request(url, method: .post, parameters: otp_parameters, headers: nil).responseJSON { response in
                print("response=",response)
                
                switch(response.result) {
                case .success(_):
                    if response.result.value != nil{
                        
//                        if let object = response.result.value, let message = object["profileData"] as? Any {
//                            print(message) // "User has been successfully registrered"
//                        }
                        
//                        let jsonDictionary = try JSONSerialization.jsonObject(with: response.result.value[0], options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
//                        let jsonDictionary = response.result.value as Any
//                        print(jsonDictionary[0] as! )
//                        let userInfo = jsonDictionary["profileData"] as! NSDictionary?
                        
//                        print(response.result.value as? [String: Any] as NSDictionary?)
                        
                        if let dict = response.result.value as? [String: Any] as NSDictionary?{
                            print("loginDict= ", dict)
                            let status = dict.object(forKey: "status") as? String
                            if status == "invalid"{
                                SwiftLoader.hide()
                                self.view.makeToast("No data available", duration: 2.0, position: .center)
                                return
                            }
                            if let dic = response.result.value as? [String: Any]{
                                
                                print("regDict=", dic)
                                
                            }
                            else {
                                
                            }
                            
                        }
                        
                    }
                        
                        print("YOUR JSON DATA>>  \(response.result.value!)")
                    
                    let dict = response.result.value! as? [String: Any] as NSDictionary?
                    
//                    print(type(of: dict!["family_members"]))
                    if dict?.index(ofAccessibilityElement: "profileData") == nil{
                        SwiftLoader.hide()
                        
                        self.view.makeToast("No data available", duration: 2.0, position: .center)
                        return
                        print("the key 'someKey' is NOT in the dictionary")
                    }
//                    else{
//                        SwiftLoader.hide()
//                        return
//
//                    }
                    
                    let userInfo = dict!["profileData"] as? [String: Any] as NSDictionary?
                    
                    
                    print(userInfo)
                    
                    let familyMembers = dict!["family_members"] as? [NSDictionary]
                    var i = 1
                    
                    for member in familyMembers! {
                        switch i {
                            
                        case 1:
                            if member["usa_or_not"] as! String == "true"{
                                self.switch1.isOn = true
                            }else{
                                self.switch1.isOn = false
                            }
                            self.familyNameTextField.text = member["name"] as! String
                            self.familydobTextField.text = member["dob"] as! String
                            self.relationTextfiled.text = member["relation"] as! String
                            self.familyNumberTextFields.text = member["phone"] as! String
                            self.familyEmailTextFields.text = member["email"] as! String
                            self.familyAlineNumberTextFields.text = member["alien_no"] as! String
                            self.familyMember1City.text = member["city"] as! String
                            let s3 = member["gender"] as! String
                            if s3 != nil {
                                if s3.uppercased() == "MALE" {
                                    self.btnFamilyMemberGenderMale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
                                    self.btnFamilyMemberGenderFemale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
                                    self.btnfamilyMemberGender = "Male"
                                }
                                else {
                                    self.btnFamilyMemberGenderMale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
                                    self.btnFamilyMemberGenderFemale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
                                    self.btnfamilyMemberGender = "Female"
                                }}
//                        self.famiyMemberTextField.text = userInfo?["family_member"] as! String
                            print("famili number 1")
                            
                        case 2:
                            if member["usa_or_not"] as! String == "true"{
                                    self.switch2.isOn = true
                            }else{
                                self.switch2.isOn = false
                            }
                            let s6 = member["gender"] as! String
                            if s6 != nil {
                            if s6.uppercased() == "MALE" {
                                self.btnFamilyMemberGenderMale1.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
                                self.btnFamilyMemberGenderFemale1.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
                                self.btnfamilyMemberGender1 = "Male"
                            }
                            else {
                                self.btnFamilyMemberGenderMale1.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
                                self.btnFamilyMemberGenderFemale1.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
                                self.btnfamilyMemberGender1 = "Female"
                            }}
                              self.familyMember2City.text = member["city"] as! String
                            self.familyMember1Name.text = member["name"] as! String
                            self.familyMember1dob.text = member["dob"] as! String
                            self.familyMember1Relation.text = member["relation"] as! String
                            self.familyMember1phone.text = member["phone"] as! String
                            self.familyMember1email.text = member["email"] as! String
                            self.familyMember1alienNumber.text = member["alien_no"] as! String
                            
                            print("found Bobby")
                        case 3:
//                            self.familyMember3Card.isHidden = false
                            if member["usa_or_not"] as! String == "true"{
                                self.switch3.isOn = true
                            }else{
                                self.switch3.isOn = false
                            }
                            let s7 = member["gender"] as! String
                            if s7 != nil {
                                if s7.uppercased() == "MALE" {
                                    self.btnFamilyMemberGenderMale2.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
                                    self.btnFamilyMemberGenderFemale2.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
                                    self.btnfamilyMemberGender2 = "Male"
                                }
                                else {
                                    self.btnFamilyMemberGenderMale2.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
                                    self.btnFamilyMemberGenderFemale2.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
                                    self.btnfamilyMemberGender2 = "Female"
                                }}
                            
                              self.familyMember3City.text = member["city"] as! String
                            self.familyMember2Name.text = member["name"] as! String
                            self.familyMember2dob.text = member["dob"] as! String
                            self.familyMember2Relation.text = member["relation"] as! String
                            self.familyMember2phone.text = member["phone"] as! String
                            self.familyMember2email.text = member["email"] as! String
                            self.familyMember2alienNumber.text = member["alien_no"] as! String
                            
                            print("found Bobby")
                        case 4:
                            if member["usa_or_not"] as! String == "true"{
                                self.switch4.isOn = true
                            }else{
                                self.switch4.isOn = false
                            }
                              self.familyMember4City.text = member["city"] as! String
                            self.familyMember3name.text = member["name"] as! String
                            self.familyMember3dob.text = member["dob"] as! String
                            self.familyMember3relation.text = member["relation"] as! String
                            self.familyMember3phone.text = member["phone"] as! String
                            self.familyMember3email.text = member["email"] as! String
                            self.familyMember3alient.text = member["alien_no"] as! String
                            print("found Bobby")
                        case 5:
                           if member["usa_or_not"] as! String == "true"{
                                self.switch5.isOn = true
                            }else{
                                self.switch5.isOn = false
                            }
                              self.familyMember5City.text = member["city"] as! String
                            self.familyMember4Name.text = member["name"] as! String
                            self.familyMember4dob.text = member["dob"] as! String
                            self.familyMember4Relation.text = member["relation"] as! String
                            self.familyMember4phone.text = member["phone"] as! String
                            self.familyMember4email.text = member["email"] as! String
                            self.familyMember4aliennumber.text = member["alien_no"] as! String
                            print("found Bobby")
                        case 6:
                            if member["usa_or_not"] as! Bool{
                                self.switch6.isOn = true
                            }else{
                                self.switch6.isOn = false
                            }
                              self.familyMember6City.text = member["city"] as! String
                            self.familyMember5Name.text = member["name"] as! String
                            self.familyMember5dob.text = member["dob"] as! String
                            self.familyMember5Relation.text = member["relation"] as! String
                            self.familyMember5phone.text = member["phone"] as! String
                            self.familyMember5email.text = member["email"] as! String
                            self.familyMember5alienumber.text = member["alien_no"] as! String
                            print("found Bobby")
                        case 7:
                           if member["usa_or_not"] as! String == "true"{
                                self.switch7.isOn = true
                            }else{
                                self.switch7.isOn = false
                            }
                              self.familyMember7City.text = member["city"] as! String
                            self.familyMember6Name.text = member["name"] as! String
                            self.familyMember6dob.text = member["dob"] as! String
                            self.familyMember6relation.text = member["relation"] as! String
                            self.familyMember6phone.text = member["phone"] as! String
                            self.familyMember6Email.text = member["email"] as! String
                            self.familyMember6Alienumber.text = member["alien_no"] as! String
                            print("found Bobby")
                        
                        case 8:
                            if member["usa_or_not"] as! String == "true"{
                                self.switch8.isOn = true
                            }else{
                                self.switch8.isOn = false
                            }
                              self.familyMember8City.text = member["city"] as! String
                            self.familyMember7Name.text = member["name"] as! String
                            self.familyMember7dob.text = member["dob"] as! String
                            self.familyMember7Relation.text = member["relation"] as! String
                            self.familyMember7phone.text = member["phone"] as! String
                            self.familyMember7email.text = member["email"] as! String
                            self.familyMember7alienumber.text = member["alien_no"] as! String
                            print("found Bobby")
                        case 9:
                            self.familyMember8Name.text = member["name"] as! String
                            self.familyMember8dob.text = member["dob"] as! String
                            self.familyMember8relation.text = member["relation"] as! String
                            self.familyMember8phone.text = member["phone"] as! String
                            self.familyMember8email.text = member["email"] as! String
                            self.familyMember8alienumber.text = member["alien_no"] as! String
                            print("found Bobby")
                        case 10:
//                            self.familyMember9Name.text = member["name"] as! String
//                            self.familyMember9dob.text = member["dob"] as! String
//                            self.familyMember9Relation.text = member["relation"] as! String
//                            self.familyMember9phone.text = member["phone"] as! String
//                            self.familyMember9email.text = member["email"] as! String
//                            self.familyMember9alienNumber.text = member["alien_no"] as! String
                            print("found Bobby")
                            
                        default:
                            print("couldn't find him")
                        }
                        print (member)
                        i = i+1
                    }
                    
                    
                    
                    let str = userInfo!["fullname"] as! String
                    let fullNameStr = "\(str)"
                    let Arr = fullNameStr.components(separatedBy: " ")
                    
                    
                    if Arr.count == 3{
                        let f_name = Arr[0]
                        let m_name = Arr[1]
                        let l_name = Arr[2]
                        
                        self.firstNametextField.text = f_name
                        self.middleNameTextField.text = m_name
                        self.lastNametextfield.text = l_name
                        
                    }
                    else if(Arr.count == 2)
                    {
                        let f_name = Arr[0]
                        let l_name = Arr[1]
                        self.firstNametextField.text = f_name
                        self.lastNametextfield.text = l_name
                        
                    }
                    else{
                        let f_name = Arr[0]
                        self.firstNametextField.text = f_name
                    }
                    // firstNametextField.text =
                    
                    self.dobTextfield.text = userInfo?["client_dob"] as? String
                    //print("dob=",self.dobTextfield.text!)
                    self.emailTextField.text = userInfo?["email"] as! String
                    
                    self.alienNumberTextfield.text = userInfo?["alien_number"] as! String
                    
                    self.contactTextfield.text = userInfo?["phone"] as! String
                    self.lastDateEntryUSA.text = userInfo?["entry_in_usa"] as! String
                    let s4 = userInfo?["port_entry_in_usa"] as! String
                    self.currentStateTextField.text = userInfo?["current_state"] as! String
                    self.selectStates.setTitle(s4, for: UIControlState.normal)
                    
                    
                    // let s3 = (obj as! ClientInfo).value(forKey: "visa_time_entry_usa") as? String
                    
                    //  clientVisaAtTheTimeOFentryBtn.setTitle(s3, for: UIControlState.normal)
                    
                    self.currentAddressTextField.text = userInfo?["current_address"] as! String
                    self.currentCityTextField.text = userInfo?["current_city"] as! String
                    self.currentStateTextField.text = userInfo?["current_state"] as! String
                    self.currentZipcodeTextField.text = userInfo?["current_zip"] as! String
                    self.currentCountryTextField.text = userInfo?["current_country"] as! String
//                      // let s0 = (obj as! ClientInfo).value(forKey: "visa_status") as? String
                    //visaStatusBtn.setTitle(s0, for: UIControlState.normal)
                    
                    
                    //let s2 = (obj as! ClientInfo).value(forKey: "visatime_entry") as? String
                    //selectVisaTimeEntry.setTitle(s2, for: UIControlState.normal)
                    // new add
                    self.cityAndCountryOfbirthTextFields.text = userInfo?["city_state_of_birth"] as! String
                    
                    self.meritstatusTextFields.text = userInfo?["marital_status"] as! String
               
//                    self.inUSACityCountryTextFields.text = userInfo?["fam_mem_city_country"] as! String
                    
                    let s2 = userInfo?["gender"] as! String
                    self.btnprofileGender = userInfo?["gender"] as! String
                    let imgStr = userInfo?["profile_image"] as! String
                    
                    print("imgStr=",imgStr)
//                    print("s5=",s5)
                    SwiftLoader.hide()
                
                    if s2 != nil {
                        if s2.uppercased() == "MALE"{
                            self.btnprofileGenderMale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
                            self.btnprofileGenderFemale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
                            self.btnprofileGender = "Male"
                        }
                        else {
                            self.btnprofileGenderMale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
                            self.btnprofileGenderFemale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
                            self.btnprofileGender = "Female"
                        }}
                    
                    break
                
                case .failure(_):
                    
                    print("fail=", response.result.error!)
                    
                    break
                    
                }
        }
        
        }
    
        
        
        
    
    
    func detailsTableCall()  {
//        let fileURL = try! FileManager.default
//            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            .appendingPathComponent("naiyer.sqlite")
//        let id = defaults.object(forKey: "userId") as? String
//        let ids = Int(id!)
//        let database = FMDatabase(url: fileURL)
//        guard database.open() else {
//            print("Unable to open database")
//            return
//        }
        do {
//            let rs = try database.executeQuery("SELECT* FROM clientdetails where client_id = ?", values:[ids!])
            
//            while rs.next() {
//
//
//                let items :ClientInfo = ClientInfo()
//                items.client_id = Int(rs.int(forColumn: "client_id"))
//                items.fullname = rs.string(forColumn: "fullname")
//                items.client_dob = rs.string(forColumn: "client_dob")
//                items.alien_number = rs.string(forColumn: "alien_number")
//                items.email = rs.string(forColumn: "email")
//                items.phone = rs.string(forColumn: "phone")
//                //items.phoneCode = rs.string(forColumn: "<#T##String#>")
//                items.date_entry_usa = rs.string(forColumn: "date_entry_usa")
//                items.date_entry_port = rs.string(forColumn: "date_entry_port")
//                //items.visa_time_entry_usa = rs.string(forColumn: "visa_time_entry_usa")
//                items.family_name = rs.string(forColumn: "family_name")
//                items.relation = rs.string(forColumn: "relation")
//                items.relative_dob = rs.string(forColumn: "relative_dob")
//                //items.visa_status = rs.string(forColumn: "visa_status")
//                items.date_of_entry = rs.string(forColumn: "date_entry_usa")
//                items.port_of_entry = rs.string(forColumn: "date_entry_port")
//                //items.visatime_entry = rs.string(forColumn: "visatime_entry")
//                items.current_address = rs.string(forColumn: "current_address")
//                items.current_city = rs.string(forColumn: "current_city")
//                items.current_state = rs.string(forColumn: "current_state")
//                items.current_zip = rs.string(forColumn: "current_zip")
//                items.current_country = rs.string(forColumn: "current_country")
//                // New Add
//
//                items.cityandcounty_of_birth = rs.string(forColumn: "cityandcounty_of_birth")
//                items.gender = rs.string(forColumn: "gender")
//                items.marital_status = rs.string(forColumn: "marital_status")
//                items.fam_mem_phone = rs.string(forColumn: "fam_mem_phone")
//                items.fam_mem_gender = rs.string(forColumn: "fam_mem_gender")
//                items.fam_mem_alien_no = rs.string(forColumn: "fam_mem_alien_no")
//                items.fam_mem_email = rs.string(forColumn: "fam_mem_email")
//                items.usa_ornot = rs.string(forColumn: "usa_ornot")
//
//                items.usa_citycountry = rs.string(forColumn: "usa_citycountry")
//                items.profile_image = rs.string(forColumn: "profile_image")
//                items.family_member = rs.string(forColumn: "family_member")
//                clientDetailsArr.add(items)
//            }
            print("clientDetailsArr=", clientDetailsArr)
            
            for obj in clientDetailsArr {
                let str = (obj as! ClientInfo).value(forKey: "fullname") as? String
                let fullNameStr = "\(str!)"
                let Arr = fullNameStr.components(separatedBy: " ")
                
                
                if Arr.count == 3{
                    let f_name = Arr[0]
                    let m_name = Arr[1]
                    let l_name = Arr[2]
                    
                    self.firstNametextField.text = f_name
                    self.middleNameTextField.text = m_name
                    self.lastNametextfield.text = l_name
                    
                }
                else if(Arr.count == 2)
                {
                    let f_name = Arr[0]
                    let l_name = Arr[1]
                    self.firstNametextField.text = f_name
                    self.lastNametextfield.text = l_name
                    
                }
                else{
                    let f_name = Arr[0]
                    self.firstNametextField.text = f_name
                }
                // firstNametextField.text =
                
                dobTextfield.text = (obj as! ClientInfo).value(forKey: "client_dob") as? String
                //print("dob=",self.dobTextfield.text!)
                emailTextField.text = (obj as! ClientInfo).value(forKey: "email") as? String
                alienNumberTextfield.text = (obj as! ClientInfo).value(forKey: "alien_number") as? String
                contactTextfield.text = (obj as! ClientInfo).value(forKey: "phone") as? String
                lastDateEntryUSA.text = (obj as! ClientInfo).value(forKey: "date_entry_usa") as? String
                let s4 = (obj as! ClientInfo).value(forKey: "date_entry_port") as? String
                selectStates.setTitle(s4, for: UIControlState.normal)
                
                
                // let s3 = (obj as! ClientInfo).value(forKey: "visa_time_entry_usa") as? String
                
                //  clientVisaAtTheTimeOFentryBtn.setTitle(s3, for: UIControlState.normal)
                
                self.currentAddressTextField.text = (obj as! ClientInfo).value(forKey: "current_address") as? String
                self.currentCityTextField.text = (obj as! ClientInfo).value(forKey: "current_city") as? String
                self.currentStateTextField.text = (obj as! ClientInfo).value(forKey: "current_state") as? String
                self.currentZipcodeTextField.text = (obj as! ClientInfo).value(forKey: "current_zip") as? String
                self.currentCountryTextField.text = (obj as! ClientInfo).value(forKey: "current_country") as? String
                self.familyNameTextField.text = (obj as! ClientInfo).value(forKey: "family_name") as? String
                self.familydobTextField.text = (obj as! ClientInfo).value(forKey: "relative_dob") as? String
                self.relationTextfiled.text = (obj as! ClientInfo).value(forKey: "relation") as? String
                //self.lblPhoneCode.text = phoneCodes.firstObject as? String
                // let s0 = (obj as! ClientInfo).value(forKey: "visa_status") as? String
                //visaStatusBtn.setTitle(s0, for: UIControlState.normal)
                
                self.lastDateEntryUSA.text = (obj as! ClientInfo).value(forKey: "date_of_entry") as? String
                let s1 = (obj as! ClientInfo).value(forKey: "port_of_entry") as? String
                print("state=",s1!)
                selectStates.setTitle(s1, for: UIControlState.normal)
                //let s2 = (obj as! ClientInfo).value(forKey: "visatime_entry") as? String
                //selectVisaTimeEntry.setTitle(s2, for: UIControlState.normal)
                // new add
                cityAndCountryOfbirthTextFields.text = (obj as! ClientInfo).value(forKey: "cityandcounty_of_birth") as? String
                meritstatusTextFields.text = (obj as! ClientInfo).value(forKey: "marital_status") as? String
                familyNumberTextFields.text = (obj as! ClientInfo).value(forKey: "fam_mem_phone") as? String
                familyEmailTextFields.text = (obj as! ClientInfo).value(forKey: "fam_mem_email") as? String
                familyAlineNumberTextFields.text = (obj as! ClientInfo).value(forKey: "fam_mem_alien_no") as? String
                famiyMemberTextField.text = (obj as! ClientInfo).value(forKey: "family_member") as? String
                inUSACityCountryTextFields.text = (obj as! ClientInfo).value(forKey: "usa_citycountry") as? String
                
                let s2 = (obj as! ClientInfo).value(forKey: "gender") as? String
                btnprofileGender = ((obj as! ClientInfo).value(forKey: "gender") as? String)!
                let s3 = (obj as! ClientInfo).value(forKey: "fam_mem_gender") as? String
                let s5 = (obj as! ClientInfo).value(forKey: "usa_ornot") as? String
                let imgStr = (obj as! ClientInfo).value(forKey: "profile_image") as? String
                
                print("imgStr=",imgStr!)
                print("s5=",s5!)
                SwiftLoader.hide()
//                profileImg.image = load(fileName: imgStr!)
                //self.profileImg.image = imgStr!
                if s5 != nil{
                    guard s5 == "Yes" else{
                        
                        btnInUSANo.sendActions(for: .touchUpInside)
                        return
                    }
                    btnInUSAYes.sendActions(for: .touchUpInside)
                    
                }
                
                if s2 != nil{
                    guard s2 == "Female" else{
                        btnprofileGenderMale.sendActions(for: .touchUpInside)
                        return
                    }
                    
                    btnprofileGenderFemale.sendActions(for: .touchUpInside)
                    
                    
                }
                if s3 != nil{
                    guard s3 == "Male" else{
                        btnFamilyMemberGenderFemale.sendActions(for: .touchUpInside)
                        
                        return
                    }
                    btnFamilyMemberGenderMale.sendActions(for: .touchUpInside)
                }
                
                
                //            cityAndCountryOfbirthTextFields.text = (obj as! ClientInfo).value(forKey: "cityandcounty_of_birth") as? String
                //            cityAndCountryOfbirthTextFields.text = (obj as! ClientInfo).value(forKey: "cityandcounty_of_birth") as? String
                
            }
        }
            
        catch {
            print("failed: \(error.localizedDescription)")
        }
        
//        database.close()
        
    }
    func setupDatePicker(textFields:UITextField) {
        // Specifies intput type
        datePicker.datePickerMode = .date
        // Creates the toolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adds the buttons
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        // Adds the toolbar to the view
        textFields.inputView = datePicker
        textFields.inputAccessoryView = toolBar
    }
    
    
    func doneClick() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = setDateFormat

        let current = view.getSelectedTextField()
        let str = dateFormatter.string(from: datePicker.date)
        current?.text = str
        current?.resignFirstResponder()
        
    }
    
    func cancelClick() {
        //meetingtimeTextfield!.resignFirstResponder()
        resignFirstResponder()
    }
    
    
    func cancelTapped() {
        
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to exit without Saving?", preferredStyle: UIAlertControllerStyle.alert)
        let yes = UIAlertAction(title: "Save", style: UIAlertActionStyle.default) { UIAlertAction in
            self.editandSubmitBtnClicked(self.editButtonItem)
        }
        let no = UIAlertAction(title: "Exit", style: UIAlertActionStyle.default) { UIAlertAction in
            self.performSegue(withIdentifier: "backToDashboard", sender: self)

        }
        alert.addAction(yes)
        alert.addAction(no)
        self.present(alert, animated: true, completion: nil)
        
    }
    func setupDropDowns() {
        setupChooseArticleDropDown()
        setupMaritalStatusDropDown()
        setupCountryDropDown()
        setUpchoosePortEntry()
        setUpChooseVisaTimeEntry()
        setUpClientVisaTimeOfENtry()
        setUpVisaStatus()
        setupStatesDropDown()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
//        self.scrollProfile.contentSize.height = 1200
        self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        //print("userProfileArr=", getAllinfo)
        
        self.navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "My Profile"
        self.navigationController?.navigationBar.isHidden = false
        self.scrollProfile.contentSize = CGSize(width: self.view.frame.size.width, height: self.saveInfoCard.frame.origin.y + self.saveInfoCard.frame.height + 150)
        
    }
    
    func userInfo() {
        
        
        
    }
    func familyDobChangeValue(sender: UIDatePicker) {
        isDOBdisplay = true
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = DateFormatter.Style.medium
        dateFormater.timeStyle = DateFormatter.Style.none
        familydobTextField.text = dateFormater.string(from: sender.date)
    }
    func family1dobchange(sender: UIDatePicker) {
        isDOBdisplay = true
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = DateFormatter.Style.medium
        dateFormater.timeStyle = DateFormatter.Style.none
        familyMember1dob.text = dateFormater.string(from: sender.date)
    }
    func family2dobchange(sender: UIDatePicker) {
        isDOBdisplay = true
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = DateFormatter.Style.medium
        dateFormater.timeStyle = DateFormatter.Style.none
        familyMember2dob.text = dateFormater.string(from: sender.date)
    }
    
    
    func ClientDobChangeValue(sender: UIDatePicker) {
        isDOBdisplay = true
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = DateFormatter.Style.medium
        dateFormater.timeStyle = DateFormatter.Style.none
        dobTextfield.text = dateFormater.string(from: sender.date)
        
    }
    
    func LastdateChangeValue(sender: UIDatePicker) {
        isDOBdisplay = true
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = DateFormatter.Style.medium
        dateFormater.timeStyle = DateFormatter.Style.none
        lastDateEntryUSA.text = dateFormater.string(from: sender.date)
        
    }
    
    
    @IBAction func inUSAEntryDataTapped(_ sender: UITextField) {
        
        if isDobInUSA == false
        {
            isDobInUSA = true
            dobPicker.isHidden = false
            
            let datePickerView: UIDatePicker = UIDatePicker()
            datePickerView.datePickerMode = UIDatePickerMode.date
            sender.inputView = datePickerView
            datePickerView.addTarget(self, action: #selector(ProfileViewController.dobChangeValue), for: UIControlEvents.valueChanged)
            
            
        }
        else{
            dobPicker.isHidden = true
        }
    }
    func dobChangeValue(sender: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = DateFormatter.Style.medium
        dateFormater.timeStyle = DateFormatter.Style.none
        inUSATextFieldDateEntry.text = dateFormater.string(from: sender.date)
        
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        var contentRect = CGRect.zero
//        for view: UIView in scrollProfile.subviews {
//            contentRect = contentRect.union(view.frame)
//        }
//        contentRect.size.height = contentRect.size.height + 20
//        scrollProfile.contentSize = contentRect.size
//    }
    
    func countryPhoneCodePicker(_ picker: MRCountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        //self.countryName.text = name
        //self.countryCode.text = countryCode
        
        
        
        self.lblPhoneCode.text = phoneCode
        
        
        //self.imgCountry.image = flag
    }
    @IBAction func visaStatusBtnTapped(_ sender: Any) {
        chooseVisaStatus.show()
    }
    
    func setUpVisaStatus() {
        
        
        chooseVisaStatus.anchorView = visaStatusBtn
        chooseVisaStatus.dataSource = ["WITHING VALID STAY PERIOD","VALID STAY PERIOD EXPIRED"]
        chooseVisaStatus.selectionAction = { [unowned self] (index, item) in
            self.visaStatusBtn.setTitle(item, for: .normal)
            
        }
    }
    
    @IBAction func selectVisaTimeEntryTapped(_ sender: Any) {
        ChooseVisaTimeEntry.show()
    }
    func setUpChooseVisaTimeEntry() {
        
        
        ChooseVisaTimeEntry.anchorView = selectVisaTimeEntry
        ChooseVisaTimeEntry.dataSource = ["CITIZENSHIP","GREEN CARD","WORKING IN USA"]
        ChooseVisaTimeEntry.selectionAction = { [unowned self] (index, item) in
            self.selectVisaTimeEntry.setTitle(item, for: .normal)
            
        }
    }
    @IBAction func clientVisatatTimeOfEntryTapped(_ sender: Any) {
        chooseClientVisaAtThetimeOfEntry.show()
    }
    
    func setUpClientVisaTimeOfENtry() {
        
        
        chooseClientVisaAtThetimeOfEntry.anchorView = clientVisaAtTheTimeOFentryBtn
        chooseClientVisaAtThetimeOfEntry.dataSource = ["IMMIGRANT VISA","NON IMMIGRANT VISA ","OTHERS"]
        chooseClientVisaAtThetimeOfEntry.selectionAction = { [unowned self] (index, item) in
            self.clientVisaAtTheTimeOFentryBtn.setTitle(item, for: .normal)
            
        }
    }
    @IBAction func selectPortTapped(_ sender: Any) {
        
        choosePortEntry.show()
        //print("port !!")
    }
    func setUpchoosePortEntry() {
        
        
        choosePortEntry.anchorView = selectPortEntry
        choosePortEntry.dataSource = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","West Virginia"," Wisconsin","Wyoming","*US/MEXICO BORDER "]
        choosePortEntry.selectionAction = { [unowned self] (index, item) in
            self.selectPortEntry.setTitle(item, for: .normal)
            
        }
    }
    
    @IBAction func selectStatesTapped(_ sender: Any) {
        chooseArticleDropDown.show()
        
    }

    func setupChooseArticleDropDown() {
        
        chooseArticleDropDown.anchorView = selectStates
        chooseArticleDropDown.dataSource = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","West Virginia"," Wisconsin","Wyoming","*US/MEXICO BORDER "]
        
        chooseArticleDropDown.selectionAction = { [unowned self] (index, item) in
            self.selectStates.setTitle(item, for: .normal)
        }
    }
    
    func setupStatesDropDown() {
        
        chooseState.anchorView = currentStateTextField
        chooseState.dataSource = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","West Virginia"," Wisconsin","Wyoming","*US/MEXICO BORDER "]
        
        chooseState.selectionAction = { [unowned self] (index, item) in
            self.currentStateTextField.text = item
        }
    }
    
    func setupCountryDropDown(){
        chooseCountry.anchorView = currentCountryTextField
//        chooseCountry.dataSource = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana"]
        chooseCountry.dataSource = ["USA"]
        chooseCountry.selectionAction = { [unowned self] (index, item) in
            self.currentCountryTextField.text = item
        }
    }
    func setupMaritalStatusDropDown() {
        
        chooseMaritalStatus.anchorView = meritstatusTextFields
        chooseMaritalStatus.dataSource = ["Single","Married","Divorced"]
        
        chooseMaritalStatus.selectionAction = { [unowned self] (index, item) in
            self.meritstatusTextFields.text = item
        }
    }
  
    func profileImageEditCLicked(gesture:UIGestureRecognizer) {
        
        imgPicker.delegate = self
        
        let alert: UIAlertController = UIAlertController(title: "Choose images", message: nil, preferredStyle:UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) {
            
            UIAlertAction in self.camera()
            
        }
        let galleryAction = UIAlertAction(title: "Photo Gallery", style: UIAlertActionStyle.default) { UIAlertAction in
            self.gallery()
        }
        let yes = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { UIAlertAction in
            
        }
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(yes)
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    func camera() {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            
            imgPicker.sourceType = UIImagePickerControllerSourceType.camera
            present(imgPicker, animated: true, completion: nil)
        }
        else{ gallery()}
        
    }
    func gallery(){
        
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            
            imgPicker.allowsEditing = true
            imgPicker.sourceType = .savedPhotosAlbum
            
            self.present(imgPicker, animated: true, completion: nil)
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])  {
        
        if let picker = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImg.contentMode = .scaleAspectFit
            profileImg.backgroundColor = UIColor.lightGray
            profileImg.image = picker
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imgPicker = UIImagePickerController()
        dismiss(animated: true, completion: nil)
        
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
    
    func userProfileData() {
        
        getAllinfo = ModelManager.getInstance().getAllData()
        // var fullStr = NSDictionary()
        let fullNameArr = getAllinfo.value(forKey: "fullname") as! NSArray
        let dobArr = getAllinfo.value(forKey: "client_dob") as! NSArray
        let emailArr = getAllinfo.value(forKey: "email") as! NSArray
        let phoneArr = getAllinfo.value(forKey: "phone") as! NSArray
        let alienNumberArr = getAllinfo.value(forKey: "alien_number") as! NSArray
        let dateEntryUsaArr = getAllinfo.value(forKey: "date_entry_usa") as! NSArray
        let dateEntryPortArr = getAllinfo.value(forKey: "date_entry_port") as! NSArray
        let visaTimeEntryUSAArr = getAllinfo.value(forKey: "visa_time_entry_usa") as! NSArray
        let gender = getAllinfo.value(forKey: "gender") as! NSArray
        let fam_mem_gender = getAllinfo.value(forKey: "fam_mem_gender") as! NSArray
        
        let currentAddressArr = getAllinfo.value(forKey: "current_address") as! NSArray
        let currentCityArr = getAllinfo.value(forKey: "current_city") as! NSArray
        let currentStateArr = getAllinfo.value(forKey: "current_state") as! NSArray
        let currentZipArr = getAllinfo.value(forKey: "current_zip") as! NSArray
        let currentCountryArr = getAllinfo.value(forKey: "current_country") as! NSArray
        let familyNameArr = getAllinfo.value(forKey: "family_name") as! NSArray
        let relativeDobArr = getAllinfo.value(forKey: "relative_dob") as! NSArray
        
        let relationArr = getAllinfo.value(forKey: "relation") as! NSArray
        let visaStatusArr = getAllinfo.value(forKey: "visa_status") as! NSArray
         let familyMember1 = getAllinfo.value(forKey: "family_member1") as! NSArray
         let familyMemberName1 = getAllinfo.value(forKey: "family_name1") as! NSArray
         let familyMemberRelation1 = getAllinfo.value(forKey: "relation1") as! NSArray
         let familyMemberDOB1 = getAllinfo.value(forKey: "relative_dob1") as! NSArray
         let familyMemberPhone1 = getAllinfo.value(forKey: "fam_mem_phone1") as! NSArray
         let familyMemberEmail1 = getAllinfo.value(forKey: "fam_mem_email1") as! NSArray
         let familyMemberAlien1 = getAllinfo.value(forKey: "fam_mem_alien_no1") as! NSArray
         let familyMemberGender1 = getAllinfo.value(forKey: "fam_mem_gender1") as! NSArray
        
        let familyMember2 = getAllinfo.value(forKey: "family_member2") as! NSArray
        let familyMemberName2 = getAllinfo.value(forKey: "family_name2") as! NSArray
        let familyMemberRelation2 = getAllinfo.value(forKey: "relation2") as! NSArray
        let familyMemberDOB2 = getAllinfo.value(forKey: "relative_dob2") as! NSArray
        let familyMemberPhone2 = getAllinfo.value(forKey: "fam_mem_phone2") as! NSArray
        let familyMemberEmail2 = getAllinfo.value(forKey: "fam_mem_email2") as! NSArray
        let familyMemberAlien2 = getAllinfo.value(forKey: "fam_mem_alien_no2") as! NSArray
        let familyMemberGender2 = getAllinfo.value(forKey: "fam_mem_gender2") as! NSArray
        
        self.familyMember1familyMember.text = familyMember1.firstObject as? String
        self.familyMember1dob.text = familyMemberDOB1.firstObject as? String
        self.familyMember1alienNumber.text = familyMemberAlien1.firstObject as? String
        self.familyMember1email.text = familyMemberEmail1.firstObject as? String
        self.familyMember1phone.text = familyMemberPhone1.firstObject as? String
        self.familyMember1Relation.text = familyMemberRelation1.firstObject as? String
        self.familyMember1Name.text = familyMemberName1.firstObject as? String
        self.btnfamilyMemberGender1 = familyMemberGender1.firstObject as? String
        
        self.familyMember2familyMember.text = familyMember2familyMember.firstRect as? String
        self.familyMember2dob.text = familyMemberDOB2.firstObject as? String
        self.familyMember2alienNumber.text = familyMemberAlien2.firstObject as? String
        self.familyMember2email.text = familyMemberEmail2.firstObject as? String
        self.familyMember2phone.text = familyMemberPhone2.firstObject as? String
        self.familyMember2Relation.text = familyMemberRelation2.firstObject as? String
        self.familyMember2Name.text = familyMemberName2.firstObject as? String
        self.btnfamilyMemberGender2 = familyMemberGender2.firstObject as? String
        
//        btnprofileGender = (gender.firstObject as? String)!
        btnfamilyMemberGender = fam_mem_gender.firstObject as? String
        
        if btnprofileGender != nil {
            if btnprofileGender == "Male" {
            btnprofileGenderMale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnprofileGenderFemale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnprofileGender = "Male"
        }
        else {
            btnprofileGenderMale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnprofileGenderFemale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnprofileGender = "Female"
        }}
        
        if btnfamilyMemberGender != nil {
        if btnfamilyMemberGender == "Male" {
            btnFamilyMemberGenderMale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnFamilyMemberGenderFemale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnfamilyMemberGender = "Male"
        }
        else {
            btnFamilyMemberGenderMale.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnFamilyMemberGenderFemale.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnfamilyMemberGender = "Female"
            }}
        
        if btnfamilyMemberGender1 != nil {
        if btnfamilyMemberGender1 == "Male" {
            btnFamilyMemberGenderMale1.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnFamilyMemberGenderFemale1.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnfamilyMemberGender1 = "Male"
        }
        else {
            btnFamilyMemberGenderMale1.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnFamilyMemberGenderFemale1.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnfamilyMemberGender1 = "Female"
            }}
        
        if btnfamilyMemberGender2 != nil {
        if btnfamilyMemberGender2 == "Male" {
            btnFamilyMemberGenderMale2.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnFamilyMemberGenderFemale2.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnfamilyMemberGender2 = "Male"
        }
        else {
            btnFamilyMemberGenderMale2.setImage(#imageLiteral(resourceName: "EmptyRadioButton"), for: .normal)
            btnFamilyMemberGenderFemale2.setImage(#imageLiteral(resourceName: "radioButton-1"), for: .normal)
            btnfamilyMemberGender2 = "Female"
            }}
        
        //let phoneCodes = getAllinfo.value(forKey: "phoneCode") as! NSArray
        //var strCount = 0
        //self.phoneCodes1 = phoneCodes
        
        let strname = fullNameArr.firstObject as? String
        // print("full=",strname!)
        let NamesArr = strname?.components(separatedBy:" ")
        
        
        //print("fullArr=", NamesArr!)
        if fullNameArr.count == 1{
            let f_name = NamesArr?[0]
            let m_name = NamesArr?[1]
            let l_name = NamesArr?[2]
            
            self.firstNametextField.text = f_name
            self.middleNameTextField.text = m_name
            self.lastNametextfield.text = l_name
            
        }
        else if(fullNameArr.count == 0)
        {
            let f_name = NamesArr?[0]
            let l_name = NamesArr?[1]
            self.firstNametextField.text = f_name
            self.lastNametextfield.text = l_name
            
        }
        else{
            let f_name = NamesArr?[0]
            self.firstNametextField.text = f_name
        }
        
        //firstNametextField.text = fullNameArr.firstObject as? String
        
        dobTextfield.text = dobArr.firstObject as? String
        //print("dob=",self.dobTextfield.text!)
        emailTextField.text = emailArr.firstObject as? String
        alienNumberTextfield.text = alienNumberArr.firstObject as? String
        contactTextfield.text = phoneArr.firstObject as? String
        lastDateEntryUSA.text = dateEntryUsaArr.firstObject as? String
        let s4 = dateEntryPortArr.firstObject as? String
        selectStates.setTitle(s4, for: UIControlState.normal)
        
        
        let s3 = visaTimeEntryUSAArr.firstObject as? String
        
//        clientVisaAtTheTimeOFentryBtn.setTitle(s3, for: UIControlState.normal)
        
        self.currentAddressTextField.text = currentAddressArr.firstObject as? String
        self.currentCityTextField.text = currentCityArr.firstObject as? String
        self.currentStateTextField.text = currentStateArr.firstObject as? String
        self.currentZipcodeTextField.text = currentZipArr.firstObject as? String
        self.currentCountryTextField.text = currentCountryArr.firstObject as? String
        self.familyNameTextField.text = familyNameArr.firstObject as? String
        self.familydobTextField.text = relativeDobArr.firstObject as? String
        self.relationTextfiled.text = relationArr.firstObject as? String
        //self.lblPhoneCode.text = phoneCodes.firstObject as? String
        let s0 = visaStatusArr.firstObject as? String
//        visaStatusBtn.setTitle(s0, for: UIControlState.normal)
     }
    
    func ConvertImageToBase64String (img: UIImage) -> String {
        let imageData:NSData = UIImageJPEGRepresentation(img, 0.50)! as NSData //UIImagePNGRepresentation(img)
        let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
        return imgString
    }
    
    
    func uploadImage() {
        let userFullName = firstNametextField.text! + " " + middleNameTextField.text! + " " + lastNametextfield.text!
        let alien_num = "A" + alienNumberTextfield.text!
        
        let selectStates1 = selectStates.titleLabel?.text!
        if (btnfamilyMemberGender == nil){
            btnfamilyMemberGender = ""
        }
        if (btnfamilyMemberGender1 == nil){
            btnfamilyMemberGender1 = ""
        }
        if (btnfamilyMemberGender2 == nil){
            btnfamilyMemberGender2 = ""
        }
        
        if (btninUSA == nil){
            btninUSA = ""
            
        }
        
        let defaults = UserDefaults.standard
        let client_id = defaults.string(forKey: "userId")
//        var familyMembers:[NSDictionary] = []
        
//        var myArrayOfFamily = [[String:Any]]()
        var usa1:String = "false"
        var usa2:String = "false"
        var usa3:String = "false"
        var usa4:String = "false"
        var usa5:String = "false"
        var usa6:String = "false"
        var usa7:String = "false"
        var usa8:String = "false"
        
        if switch1.isOn {
            usa1 =  "true"
            
        } else {
            usa1 =  "false"
        }
        if switch2.isOn {
            usa2 =  "true"
            
        } else {
            usa2 =  "false"
        }
        if switch3.isOn {
            usa3 =  "true"
            
        } else {
            usa3 =  "false"
        }
        if switch4.isOn {
            usa4 =  "true"
            
        } else {
            usa4 =  "false"
        }
        if switch5.isOn {
            usa5 =  "true"
            
        } else {
            usa5 =  "false"
        }
        if switch6.isOn {
            usa6 =  "true"
            
        } else {
            usa6 =  "false"
        }
      
        if switch7.isOn {
            usa7 =  "true"
            
        } else {
            usa7 =  "false"
        }
        if switch8.isOn {
            usa8 =  "true"
            
        } else {
            usa8 =  "false"
        }
        
        let familyOne = ["name": self.familyNameTextField.text!, "relation": self.relationTextfiled.text!,"dob": self.familydobTextField.text!, "email": self.familyEmailTextFields.text!,"alien_no": self.familyAlineNumberTextFields.text!, "gender": "male","city": self.familyMember1City.text!, "phone": self.familyNumberTextFields.text!,"usa_or_not":usa1]
        
        let familyTwo = ["name": self.familyMember1Name.text!, "relation": self.familyMember1Relation.text!,"dob": self.familyMember1dob.text!, "email": self.familyMember1email.text!,"alien_no": self.familyMember1alienNumber.text!, "gender": btnfamilyMemberGender1!,"city": self.familyMember2City.text!, "phone": self.familyMember1phone.text!,"usa_or_not":usa2]
        let familyThree = ["name": self.familyMember2Name.text!, "relation": self.familyMember2Relation.text!,"dob": self.familyMember2dob.text!, "email": self.familyMember2email.text!,"alien_no": self.familyMember2alienNumber.text! , "gender": btnfamilyMemberGender2!,"city": self.familyMember3City.text!, "phone": self.familyMember2phone.text!,"usa_or_not": usa3]
        
        let familyFour = ["name": self.familyMember4Name.text!, "relation": self.familyMember4Relation.text!,"dob": self.familyMember4dob.text!, "email": self.familyMember4email.text!,"alien_no": self.familyMember4aliennumber.text!, "gender": "male","city": self.familyMember4City.text!, "phone": self.familyMember4phone.text!,"usa_or_not": usa4]
        
        let familyFive = ["name": self.familyMember5Name.text!, "relation": self.familyMember5Relation.text!,"dob": self.familyMember5dob.text!, "email": self.familyMember5email.text! ?? "","alien_no": self.familyMember5alienumber.text!, "gender": "male","city": self.familyMember5City.text!, "phone": self.familyMember5phone.text!,"usa_or_not":usa5]
        
        let familySix = ["name": self.familyMember6Name.text!, "relation": self.familyMember6relation.text!,"dob": self.familyMember6dob.text!, "email": self.familyMember6Email.text!,"alien_no": self.familyMember6Alienumber.text!, "gender": "male","city": self.familyMember6City.text!, "phone": self.familyMember6phone.text!,"usa_or_not": usa6]
        
        let FamilySeven = ["name": self.familyMember7Name.text!, "relation": self.familyMember7Relation.text!,"dob": self.familyMember7dob.text!, "email": self.familyMember7email.text!,"alien_no": self.familyMember7alienumber.text!, "gender": "male","city": self.familyMember7City.text!, "phone": self.familyMember7phone.text!,"usa_or_not": usa7]
        
        let familyEight = ["name": self.familyMember8Name.text!, "relation": self.familyMember8relation.text!,"dob": self.familyMember8dob.text!, "email": self.familyMember8email.text!,"alien_no": self.familyMember8alienumber.text!, "gender": "male","city": self.familyMember8City.text!, "phone": self.familyMember8phone.text!,"usa_or_not": usa8]
//        var myArrayOfFamily = [familyOne,familyTwo,familyThree,familyFour,familyFive,familySix,FamilySeven,familyEight
//        ]
        var myArrayOfFamily = [familyOne]
        if self.familyMember1Name.text != ""{
            myArrayOfFamily.append(familyTwo)
        }
        if self.familyMember2Name.text != ""{
            myArrayOfFamily.append(familyThree)
        }
//        if self.familyMember3Name.text != ""{
//            myArrayOfFamily.append(familyFour)
//        }
        if self.familyMember4Name.text != ""{
            myArrayOfFamily.append(familyFive)
        }
        if self.familyMember5Name.text != ""{
            myArrayOfFamily.append(familySix)
        }
        if self.familyMember6Name.text != ""{
            myArrayOfFamily.append(FamilySeven)
        }
        if self.familyMember7Name.text != ""{
            myArrayOfFamily.append(familyEight)
        }
     
        let upload_parameter: [String:Any] =
            ["client_id":client_id!,
             "fullname":userFullName,
             "client_dob":dobTextfield.text!,
             "alien_number":alien_num,
             "email":emailTextField.text!,
             "phone": contactTextfield.text!,
             "entry_in_usa":lastDateEntryUSA.text!,
             "port_entry_in_usa":selectStates1!,
             "current_address":currentAddressTextField.text!,
             "current_city":currentCityTextField.text!,
             "current_state":currentStateTextField.text!,
             "current_zip":currentZipcodeTextField.text!,
             "current_country":currentCountryTextField.text!,
             "city_state_of_birth":cityAndCountryOfbirthTextFields.text!,
             "gender":btnprofileGender,
             "marital_status":meritstatusTextFields.text!,
             "profile_image" : ConvertImageToBase64String(img: self.profileImg.image!)        ]
//        let upload_parameter: [String:String] =
//            ["client_id":client_id!,
//             "fullname":userFullName,
//             "client_dob":dobTextfield.text!,
//             "alien_number":alien_num,
//             "email":emailTextField.text!,
//             "phone": contactTextfield.text!,
//             "entry_in_usa":lastDateEntryUSA.text!,
//             "port_entry_in_usa":selectStates1!,
//                "current_address":currentAddressTextField.text!,
//                "current_city":currentCityTextField.text!,
//                "current_state":currentStateTextField.text!,
//                "current_zip":currentZipcodeTextField.text!,
//                "current_country":currentCountryTextField.text!,
//
//                "fam_mem_name":familyNameTextField.text!,
//                "fam_mem_relation":relationTextfiled.text!,
//                "fam_mem_dob":familydobTextField.text!,
//                "city_state_of_birth":cityAndCountryOfbirthTextFields.text!,
//                "gender":btnprofileGender,
//                "marital_status":meritstatusTextFields.text!,
//                "fam_mem_phone":familyNumberTextFields.text!,
//                "fam_mem_email":familyEmailTextFields.text!,
//                "fam_mem_alien_no":familyAlineNumberTextFields.text!,
//                "fam_mem_gender":btnfamilyMemberGender!,
//                "usa_or_not":btninUSA!,
//                "fam_mem_city_country":inUSACityCountryTextFields.text!,
//                "fam_mem_name1":familyMember1Name.text!,
//                "fam_mem_relation1":familyMember1Relation.text!,
//                "fam_mem_dob1":familyMember1dob.text!,
//                "fam_mem_phone1":familyMember1phone.text!,
//                "fam_mem_email1":familyMember1email.text!,
//                "fam_mem_alien_no1":familyMember1alienNumber.text!,
//                "fam_mem_gender1":btnfamilyMemberGender1!,
//
//                "fam_mem_name2":familyMember2Name.text!,
//                "fam_mem_relation2":familyMember2Relation.text!,
//                "fam_mem_dob2":familyMember2dob.text!,
//                "fam_mem_phone2":familyMember2phone.text!,
//                "fam_mem_email2":familyMember2email.text!,
//                "fam_mem_alien_no2":familyMember2alienNumber.text!,
//                "fam_mem_gender2":btnfamilyMemberGender2!,
//                "profile_image" : ConvertImageToBase64String(img: self.profileImg.image!),
//                "family_members" : myArrayOfFamily
//        ]
        print(upload_parameter)
        
        let url = "http://rohit.winklix.com/lawyer/app/client_details.php" /* your API url */

        //test 2
       
        
        //end test 2
        let userData = try? JSONSerialization.data(withJSONObject: myArrayOfFamily)
        
        let json = try? JSONSerialization.data(withJSONObject: myArrayOfFamily, options: [.prettyPrinted])
        let jsonPresentation = String(data: json!, encoding: .utf8)
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in upload_parameter {
 multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            multipartFormData.append(json!, withName: "family_members")
//            multipartFormData.append((jsonPresentation?.data(using: .utf8)!)!, withName: "family_members")
        }, to:"http://rohit.winklix.com/lawyer/app/client_details.php")
        { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                upload.responseString { response in
                    if let JSON = response.result.value {
                        print("JSON: \(String(describing: response.result.value))")
                    let defaults = UserDefaults.standard
                    defaults.set("A" + self.alienNumberTextfield.text!, forKey: "alien_number")
                    defaults.synchronize()
                    self.view.makeToast("Profile successfully saved", duration: 2.0, position: .center)
                    SwiftLoader.hide()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.4, execute: {
                    self.performSegue(withIdentifier: "backToDashboard", sender: self)                                })
                    }
                    else
                    {
                        print("A JSON parsing error occurred, here are the details: %@" ,response.result.error)
                        self.view.makeToast("Profile saved errorr", duration: 2.0, position: .center)
                        SwiftLoader.hide()
                    }
                }

            case .failure(let encodingError):
                print(encodingError)
            }

        }
        
    }
    
    
    @IBAction func editandSubmitBtnClicked(_ sender: Any) {
        
        SwiftLoader.show(title: "Saving...", animated: true)
//        if (firstNametextField.text != "") && (lastNametextfield.text != "") && (dobTextfield.text != "") && (alienNumberTextfield.text != "") && (emailTextField.text != "") && (contactTextfield.text != "") && (selectStates.titleLabel?.text != "") && (lastDateEntryUSA.text != "") && (currentAddressTextField.text != "") && (currentCityTextField.text != "") && (currentStateTextField.text != "") && (currentCountryTextField.text != "") && (currentZipcodeTextField.text != "") && (btnprofileGender != nil)
//        {
        if true{
            if !(common.isValidEmail(testStr: emailTextField.text!)){
                SwiftLoader.hide()
                self.view.makeToast("Enter valid email id.", duration: 2.0, position: .center)
                return
            }
            if !(common.phonevalidate(value: contactTextfield.text!)){
                SwiftLoader.hide()
                self.view.makeToast("Enter valid phone no.", duration: 2.0, position: .center)
                return
            }
            let userFullName = firstNametextField.text! + " " + middleNameTextField.text! + " " + lastNametextfield.text!
            let alien_num = "A" + alienNumberTextfield.text!
            
            let selectStates1 = selectStates.titleLabel?.text!
            if (btnfamilyMemberGender == nil){
                btnfamilyMemberGender = ""
            }
            if (btnfamilyMemberGender1 == nil){
                btnfamilyMemberGender1 = ""
            }
            if (btnfamilyMemberGender2 == nil){
                btnfamilyMemberGender2 = ""
            }
            
            if (btninUSA == nil){
                btninUSA = ""
                
            }
            
            let defaults = UserDefaults.standard
            let client_id = defaults.string(forKey: "userId")
            let upload_parameter:[String: Any] =
                ["client_id":client_id!,
                "fullname":userFullName,
                "client_dob":dobTextfield.text!,
                "alien_number":alien_num,
                "email":emailTextField.text!,
                "phone": contactTextfield.text!,
                "entry_in_usa":lastDateEntryUSA.text!,
                "port_entry_in_usa":selectStates1!,
                // "visa_time_entry_usa":clientVisaAtTheTimeOFentryStr!,
                    "current_address":currentAddressTextField.text!,
                "current_city":currentCityTextField.text!,
                "current_state":currentStateTextField.text!,
                "current_zip":currentZipcodeTextField.text!,
                "current_country":currentCountryTextField.text!,
                
                "fam_mem_name":familyNameTextField.text!,
                "fam_mem_relation":relationTextfiled.text!,
                "fam_mem_dob":familydobTextField.text!,
                "city_state_of_birth":cityAndCountryOfbirthTextFields.text!,
                "gender":btnprofileGender,
                "marital_status":meritstatusTextFields.text!,
                "fam_mem_phone":familyNumberTextFields.text!,
                "fam_mem_email":familyEmailTextFields.text!,
                "fam_mem_alien_no":familyAlineNumberTextFields.text!,
                "fam_mem_gender":btnfamilyMemberGender!,
                "usa_or_not":btninUSA!,
                "fam_mem_city_country":inUSACityCountryTextFields.text!,
                "fam_mem_name1":familyMember1Name.text!,
            "fam_mem_relation1":familyMember1Relation.text!,
            "fam_mem_dob1":familyMember1dob.text!,
            "fam_mem_phone1":familyMember1phone.text!,
            "fam_mem_email1":familyMember1email.text!,
            "fam_mem_alien_no1":familyMember1alienNumber.text!,
            "fam_mem_gender1":btnfamilyMemberGender1!,
            
            "fam_mem_name2":familyMember2Name.text!,
            "fam_mem_relation2":familyMember2Relation.text!,
            "fam_mem_dob2":familyMember2dob.text!,
            "fam_mem_phone2":familyMember2phone.text!,
            "fam_mem_email2":familyMember2email.text!,
            "fam_mem_alien_no2":familyMember2alienNumber.text!,
            "fam_mem_gender2":btnfamilyMemberGender2!,
            "profile_image" : ConvertImageToBase64String(img: self.profileImg.image!)
            ]

            print(upload_parameter)

            let urlservice = serviceUrl + "client_details.php"
            //print("userProfile=",upload_parameter)
            let clientsDefualts = UserDefaults.standard
            clientsDefualts.set(upload_parameter, forKey: "myProfile")
            clientsDefualts.synchronize()
            SwiftLoader.show(title: "Saving...", animated: true)
//            let url = try! URLRequest(url: URL(string: urlservice)!, method: .post, headers: nil)
            
//            print("img!=", self.profileImg.image!)
//            save(image: self.profileImg.image!)
            let headers: HTTPHeaders = [:]
            
            
//            Alamofire.upload(multipartFormData: { (multipartFormData) in
//
////                for (key, value) in upload_parameter {
////                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
////
////                }
//                for (key,value) in upload_parameter {
//                    multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
//                }
//            }, to: serviceUrl + "client_details.php")
//            { (result) in
//                switch result {
//                case .success(let upload, _, _):
//
//                    upload.uploadProgress(closure: { (Progress) in
//                        print("Upload Progress: \(Progress.fractionCompleted)")
//                    })
//
//                    upload.responseJSON { response in
//                        //self.delegate?.showSuccessAlert()
////                        print(response.request)  // original URL request
////                        print(response.response) // URL response
////                        print(response.data)     // server data
////                        print(response.result)   // result of response serialization
//                        //                        self.showSuccesAlert()
//                        //self.removeImage("frame", fileExtension: "txt")
//                        if let JSON = response.result.value {
//                            let defaults = UserDefaults.standard
//                            defaults.set("A" + self.alienNumberTextfield.text!, forKey: "alien_number")
//                            defaults.synchronize()
//                            self.view.makeToast("Profile successfully saved", duration: 2.0, position: .center)
//                            SwiftLoader.hide()
//
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4, execute: {
//                            self.performSegue(withIdentifier: "backToDashboard", sender: self)                                })
//                        }
//                    }
//
//                case .failure(let encodingError):
//                    //self.delegate?.showFailAlert()
//                    SwiftLoader.hide()
//                   self.view.makeToast("unable to upload please try again", duration: 2.0, position: .center)
//                    print(encodingError)
//                }
//
            
            //test
            
            uploadImage()
//            Alamofire.upload(multipartFormData: { (multipartFormData) in
////                multipartFormData.append(UIImageJPEGRepresentation(self.photoImageView.image!, 0.5)!, withName: "photo_path", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
//                for (key, value) in upload_parameter {
//                    multipartFormData.append((value as! String).data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
//                }
//            }, to:"http://rohit.winklix.com/lawyer/app/client_details.php")
//            { (result) in
//                switch result {
//                case .success(let upload, _, _):
//
//                    upload.uploadProgress(closure: { (Progress) in
//                        print("Upload Progress: \(Progress.fractionCompleted)")
//                    })
//
//                    upload.responseJSON { response in
//                        //self.delegate?.showSuccessAlert()
//                        print(response.request)  // original URL request
//                        print(response.response) // URL response
//                        print(response.data)     // server data
//                        print(response.result)   // result of response serialization
//                        //                        self.showSuccesAlert()
//                        //self.removeImage("frame", fileExtension: "txt")
//                        if let JSON = response.result.value {
//                            print("JSON: \(JSON)")
//                        }
//                        self.view.makeToast("Profile successfully saved", duration: 2.0, position: .center)
//                         SwiftLoader.hide()
//
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4, execute: {
//                        self.performSegue(withIdentifier: "backToDashboard", sender: self)                                })
//                    }
//
//                case .failure(let encodingError):
//                    //self.delegate?.showFailAlert()
//                    print(encodingError)
//                }
            
            
            
            //end test
            
            
            
//            Alamofire.upload(multipartFormData: { (multipartFormData) in
//
////                for (key, value) in upload_parameter {
////                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
////
////                }
//
//                    for (key, value) in upload_parameter {
//                        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//                    }
////                    multipartFormData.append(UIImageJPEGRepresentation(self.profileImg.image!, 0.5)!, withName:"profile_image", fileName: "uploads.jpg", mimeType: "image/jpeg")
//            }, usingThreshold: UInt64.init(), to: urlservice, method: .post, headers: headers){ (result) in
//                    print("result",result)
//                    switch result {
//
//                    case .success(let upload, _, _):
//                        upload.responseJSON { response in
//                            print("response",response)
//                            if response.response?.statusCode == 200 {
//                                let defaults = UserDefaults.standard
//                                defaults.set("A" + self.alienNumberTextfield.text!, forKey: "alien_number")
//                                defaults.synchronize()
//                                self.view.makeToast("Profile successfully saved", duration: 2.0, position: .center)
//                                self.saveIntoLocalDatabase()
//                                SwiftLoader.hide()
//
//
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.4, execute: {
//                                    self.performSegue(withIdentifier: "backToDashboard", sender: self)                                })
//                            }
//                        }
//                    case .failure(let encodingErr):
//                        SwiftLoader.hide()
//                        self.view.makeToast("unable to upload please try again", duration: 2.0, position: .center)
//                        break
//                    }
//            }
            
        }
            
        else{
            SwiftLoader.hide()
            Profile.invokeAlertMethod(strTitle: "Alert", strBody: "Please fill your field", delegate: nil)
            
        }
    }
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    
    var imgName = "FileName"
    private func save(image: UIImage) -> String? {
        
        let fileURL = documentsUrl.appendingPathComponent(imgName)
        if let imageData = UIImageJPEGRepresentation(image, 1.0) {
            try? imageData.write(to: fileURL, options: .atomic)
            return imgName // ----> Save fileName
        }
        print("Error saving image")
        return nil
    }
  
    private func load(fileName: String) -> UIImage? {
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
    
    
    func saveIntoLocalDatabase(){
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("naiyer.sqlite")
        let id = defaults.object(forKey: "userId") as? String
        let ids = Int(id!)
        print("idsss=", ids!)
        let fullName = "\(firstNametextField.text!) " + "\(middleNameTextField.text!) " + "\(lastNametextfield.text!)"
        let entryport = selectStates.titleLabel?.text!
        let database = FMDatabase(url: fileURL)
        guard database.open() else {
            print("Unable to open database")
            return
        }
        do {
            //let imgStr = self.profileImg.image!
            let rs = try database.executeQuery("select count(*) from clientdetails where client_id = ?", values:[ids!])
            while rs.next() {
                //let visatimeEntry = clientVisaAtTheTimeOFentryBtn.titleLabel?.text!
                let count = rs.int(forColumnIndex: 0)
                if count > 0{
                    try database.executeUpdate("UPDATE clientdetails SET fullname=?,client_dob=?, alien_number=?, email=?, phone=?, date_entry_usa=?, date_entry_port=?,family_name=?,relation=?,relative_dob=?,current_address=?,current_city=?,current_state=?,current_zip=?,current_country=?,cityandcounty_of_birth=?,gender=?,marital_status=?,fam_mem_phone=?,fam_mem_email=?,fam_mem_alien_no=?,fam_mem_gender=?,usa_ornot=?,usa_citycountry=? ,profile_image=?, family_member =?,family_member1 =?,family_name1 =?,relation1 =?,relative_dob1 =?,fam_mem_phone1 =?,fam_mem_email1 =?,fam_mem_alien_no1 =?,fam_mem_gender1 =?,family_member2 =?,family_name2 =?,relation2 =?,relative_dob2 =?,fam_mem_phone2 =?,fam_mem_email2 =?,fam_mem_alien_no2 =?,fam_mem_gender2 =? where client_id ='\(ids!)'", values: [fullName,dobTextfield.text!,alienNumberTextfield.text!,emailTextField.text!,contactTextfield.text!,lastDateEntryUSA.text!,entryport!,familyNameTextField.text!,relationTextfiled.text!,familydobTextField.text!,currentAddressTextField.text!,currentCityTextField.text!,currentStateTextField.text!,currentZipcodeTextField.text!,currentCountryTextField.text!,cityAndCountryOfbirthTextFields.text!,btnprofileGender,meritstatusTextFields.text!,familyNumberTextFields.text!,familyEmailTextFields.text!,familyAlineNumberTextFields.text!,btnfamilyMemberGender!,btninUSA!,inUSACityCountryTextFields.text!,imgName,famiyMemberTextField.text!,familyMember1familyMember.text!,familyMember1Name.text!, familyMember1Relation.text!, familyMember1dob.text!, familyMember1phone.text!,familyMember1email.text!, familyMember1alienNumber.text!, btnfamilyMemberGender1 as Any,familyMember2familyMember.text!,familyMember2Name.text!, familyMember2Relation.text!, familyMember2dob.text!, familyMember2phone.text!,familyMember2email.text!, familyMember2alienNumber.text!, btnfamilyMemberGender2 as Any])
                }
                else{
                    try database.executeUpdate("INSERT INTO clientdetails (client_id,fullname,client_dob, alien_number,email,phone,date_entry_usa,date_entry_port,family_name,relation,relative_dob,current_address,current_city,current_state,current_zip,current_country,cityandcounty_of_birth,gender,marital_status,fam_mem_phone ,fam_mem_email ,fam_mem_alien_no,fam_mem_gender,usa_ornot,usa_citycountry, profile_image,family_member, family_member1,family_name1,relation1,relative_dob1,fam_mem_phone1 ,fam_mem_email1 ,fam_mem_alien_no1,fam_mem_gender1,family_member2,family_name2,relation2,relative_dob2,fam_mem_phone2 ,fam_mem_email2 ,fam_mem_alien_no2,fam_mem_gender2) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", values: [ids!,fullName,dobTextfield.text!,alienNumberTextfield.text!,emailTextField.text!,contactTextfield.text!,lastDateEntryUSA.text!,entryport!,familyNameTextField.text!,relationTextfiled.text!,familydobTextField.text!,currentAddressTextField.text!,currentCityTextField.text!,currentStateTextField.text!,currentZipcodeTextField.text!,currentCountryTextField.text!,cityAndCountryOfbirthTextFields.text!,btnprofileGender,meritstatusTextFields.text!,familyNumberTextFields.text!,familyEmailTextFields.text!,familyAlineNumberTextFields.text!,btnfamilyMemberGender!,btninUSA!,inUSACityCountryTextFields.text!,imgName,famiyMemberTextField.text!,familyMember1familyMember.text!,familyMember1Name.text!, familyMember1Relation.text!, familyMember1dob.text!, familyMember1phone.text!,familyMember1email.text!, familyMember1alienNumber.text!, btnfamilyMemberGender1 as Any,familyMember2familyMember,familyMember2Name.text!, familyMember2Relation.text!, familyMember2dob.text!, familyMember2phone.text!,familyMember2email.text!, familyMember2alienNumber.text!, btnfamilyMemberGender2 as Any])
                }
            }}
        catch {
            print("failed: \(error.localizedDescription)")
        }
        
    }
}

extension UIView {
    func getSelectedTextField() -> UITextField? {
        
        let totalTextFields = getTextFieldsInView(view: self)
        
        for textField in totalTextFields{
            if textField.isFirstResponder{
                return textField
            }
        }
        
        return nil
        
    }
    
    func getTextFieldsInView(view: UIView) -> [UITextField] {
        
        var totalTextFields = [UITextField]()
        
        for subview in view.subviews as [UIView] {
            if let textField = subview as? UITextField {
                totalTextFields += [textField]
            } else {
                totalTextFields += getTextFieldsInView(view: subview)
            }
        }
        
        return totalTextFields
    }}

