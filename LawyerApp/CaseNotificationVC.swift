//
//  CaseNotificationVC.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 03/08/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import Alamofire
import FMDB

class CaseNotificationVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tblNotification: UITableView!
    var alienStr: String?
    var noti_id:String?
    var message:String?
    var status: String?
    var body: String?
    var dataArr: NSArray = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        let alien_number = defaults.object(forKey: "alien_number") as? String
        alienStr = alien_number
getNotificationMethod()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "Case Notification"
        tblNotification.tableFooterView = UIView(frame: .zero)
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    func getNotificationMethod(){
            SwiftLoader.show(title: "Loading..", animated: true)
        let clientID = defaults.object(forKey: "userId")
        let urlNotification = serviceUrl + "notification.php"
        let parameters: [String: Any] = ["id": clientID!]
        Alamofire.request(urlNotification, method: .post, parameters: parameters, headers: nil).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    if let dic = response.result.value as? [String: Any] as NSDictionary?{
                         let noExist = dic.object(forKey: "status") as? String
                        if noExist == "success"
                            {
                                 self.dataArr = dic.object(forKey: "response") as! NSArray
                                self.tblNotification.reloadData()
                                SwiftLoader.hide()
                            }
                        else{
                            Profile.invokeAlertMethod(strTitle:"Alert" , strBody: "No Notifiaction exist" as NSString, delegate: nil)
                            SwiftLoader.hide()
                        }
                        print("DictNoti=\(dic)")
                    }
                    print("YOUR JSON DATA>>  \(response.data!)")
                }
            case .failure(_):
                SwiftLoader.hide()
                print("fail=", response.result.error!)
                break
            }
        }
    }
    
    func getLocalData(){
        let user_noti:Noti_info = Noti_info()
        user_noti.noti_id = self.noti_id
        user_noti.message = self.message
        user_noti.body = self.body
        user_noti.status = self.status
        ModelManager.getInstance().insertNotiFicationData(user_noti)
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let identifie = "notiCell"
var cell: NotificationCell! = tblNotification.dequeueReusableCell(withIdentifier: identifie) as? NotificationCell
    if cell == nil {
        tblNotification.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: identifie)
        cell = tblNotification.dequeueReusableCell(withIdentifier: identifie, for: indexPath) as! NotificationCell
    }
    let idStr = (dataArr[indexPath.row] as AnyObject).value(forKey: "id") as! String
   if idStr.characters.first == "a"{
    cell.lblMessageText.text = (dataArr[indexPath.row] as AnyObject).value(forKey: "body") as? String
    cell.lblStatusText.text = (dataArr[indexPath.row] as AnyObject).value(forKey: "status") as? String
  }
    else{
        cell.lblMessageText.text = (dataArr[indexPath.row] as AnyObject).value(forKey: "message") as? String
    }
    return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        tblNotification.estimatedRowHeight = 40
        return UITableViewAutomaticDimension
    }
}
