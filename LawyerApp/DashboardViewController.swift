//
//  DashboardViewController.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 10/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import FMDB

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var dashView: UIImageView!
    @IBOutlet var dashboardCV: UICollectionView!
    var checkNameStr:String?
    var icons:[String] = ["user.png","appointment.png","notification.png","case-status.png","law.png","map.png", "cloud-computing.png"]
    var allHeader :[String] = ["My Profile","Appointment Schedule", "Case Notification", "Case Status","About Lawfirm","Office information","Upload Documents"]
    
   
    
    var webURL: String?
    var navTitle: String?
    var userDict:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardCV.delegate = self
        dashboardCV.dataSource = self
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top:20, left: 2, bottom: 10, right:2)
        layout.itemSize = CGSize(width: width / 3 - 20, height: width / 2.6 - 20)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        dashboardCV!.collectionViewLayout = layout
//self.navigationController?.navigationBar.topItem?.title = ""
        //self.navigationItem.rightBarButtonItem?.title = userStr
        self.navigationItem.leftBarButtonItem?.title = "Logout"
        
        //let loginUserName = userDictionary?.object(forKey: "name") as? String
    //let dict = defaults.object(forKey: "loginData") as? NSDictionary
        //print("dict!!=", dict!)
        let userName = defaults.object(forKey: "userName") as! String
        
        checkNameStr = userName
        //print("loginUser=",loginUserName!)
     
      //navigationItem.rightBarButtonItem = UIBarButtonItem(title: userName, style: .plain, target: self, action: #selector(UserProfile))
    self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    
        
    }
    
    func createClientTables(){
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("naiyer.sqlite")
        //let id = defaults.object(forKey: "userId") as? String
        
        let database = FMDatabase(url: fileURL)
        guard database.open() else {
            print("Unable to open database")
            return
        }
        do {
//                try database.executeUpdate("DROP TABLE IF EXISTS clientdetails", values: nil)
         try database.executeUpdate("CREATE TABLE IF NOT EXISTS clientdetails(id INTEGER PRIMARY KEY AUTOINCREMENT, client_id INTEGER,fullname TEXT,client_dob TEXT, alien_number TEXT,email TEXT,phone TEXT,date_entry_usa TEXT,date_entry_port TEXT,family_name TEXT,relation TEXT,relative_dob TEXT,current_address TEXT,current_city TEXT,current_state TEXT,current_zip TEXT,current_country TEXT,cityandcounty_of_birth TEXT,gender TEXT,marital_status TEXT,fam_mem_phone TEXT,fam_mem_email TEXT,fam_mem_alien_no TEXT,fam_mem_gender TEXT,usa_ornot TEXT,usa_citycountry TEXT,profile_image TEXT,family_member TEXT,family_member1 TEXT,family_name1 TEXT,relation1 TEXT,relative_dob1 TEXT,fam_mem_phone1 TEXT,fam_mem_email1 TEXT,fam_mem_alien_no1 TEXT,fam_mem_gender1 TEXT,family_member2 TEXT,family_name2 TEXT,relation2 TEXT,relative_dob2 TEXT,fam_mem_phone2 TEXT,fam_mem_email2 TEXT,fam_mem_alien_no2 TEXT,fam_mem_gender2 TEXT)", values: nil)
        }
        catch {
            print("failed: \(error.localizedDescription)")
            
        }
        
    }
    
    @IBAction func rightbarButtonTapped(_ sender: Any) {
        
     invokeAlertMethod(strTitle: "Alert!", strBody: "No notification available", delegate: self)
        
    }
    
    func UserProfile(){
    print("work it!!")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Dashboard"
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        createClientTables()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
        let detail = self.storyboard?.instantiateViewController(withIdentifier: "webDetailVC") as! CaseStatusViewController
       
       
        if checkNameStr != nil{
        if indexPath.row == 0 {
            

            performSegue(withIdentifier: "profileDetailsVC", sender: self)

        
            }
        else if indexPath.row == 1{
            
            
            performSegue(withIdentifier: "appointmentVC", sender: self)
            
            }
        else if indexPath.row == 2 {
            
            self.performSegue(withIdentifier: "caseNotification", sender: self)
            }
            
        else if indexPath.row == 5
        {
            
            performSegue(withIdentifier: "map", sender: self)
            
            
            }
        else if indexPath.row == 6 {
            
            performSegue(withIdentifier: "uploadDocuments", sender: self)
            
            
            }
           else if indexPath.row == 3 {
                webURL = "https://egov.uscis.gov/casestatus/landing.do"
                navTitle = "Case Status"
                
                detail.urlStr = webURL
                detail.navstr = navTitle
                self.navigationController?.pushViewController(detail, animated: true)
                
            }
            
            else if indexPath.row == 4 {
                webURL = "http://dsdlawfirm.com/"
                navTitle = "About law firm"
                detail.urlStr = webURL
                detail.navstr = navTitle
                self.navigationController?.pushViewController(detail, animated: true)
            }
//           else if indexPath.row == 5{
//                
//                performSegue(withIdentifier: "client-login", sender: self)
//            }
        }
        
        else
        {
         if indexPath.row == 3 {
        webURL = "https://egov.uscis.gov/casestatus/landing.do"
            navTitle = "Case Status"
            
            detail.urlStr = webURL
            detail.navstr = navTitle
            self.navigationController?.pushViewController(detail, animated: true)
        
        }

         else if indexPath.row == 4 {
        webURL = "http://dsdlawfirm.com/"
            navTitle = "About law firm"
            detail.urlStr = webURL
            detail.navstr = navTitle
            self.navigationController?.pushViewController(detail, animated: true)
        }
//        else if indexPath.row == 5{
//        
//             performSegue(withIdentifier: "client-login", sender: self)
//        }
         else  {
            let alert = UIAlertController(title: "Alert", message: "You need to login first then desire function will access!", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { UIAlertAction in
               self.performSegue(withIdentifier: "client-login", sender: self)
            })
            alert.addAction(ok)
            present(alert, animated: true, completion:nil)
            
            
            }
        }
       
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dashboardCV.dequeueReusableCell(withReuseIdentifier: "dashcell", for: indexPath) as! DashboardCell
        cell.dash_icons.image = UIImage(named:icons [indexPath.row])
        cell.lbldashboard.text = allHeader[indexPath.row]
   
        cell.dashview.layer.cornerRadius = 8
        cell.dashview.clipsToBounds = true
        return cell
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
