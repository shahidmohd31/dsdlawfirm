//
//  ModelManager.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 19/07/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//


import Foundation
import UIKit
import FMDB


let sharedInstance = ModelManager()
class ModelManager: NSObject {
   
    var database: FMDatabase? = nil
    
    class func getInstance() -> ModelManager
{
    if(sharedInstance.database == nil)
    {
    sharedInstance.database = FMDatabase(path: Profile.getPath(fileName: "naiyer.sqlite"))
    }
    return sharedInstance
    }
    
// status notification data!!..
    func insertNotiFicationData(_ notify: Noti_info) {
        sharedInstance.database?.open()
        let createCaseTableQuery = "create table if not exists notifications (noti_id VARCHAR(255) not null, message text,appointment_message text, status text)"
        let result:FMResultSet = (sharedInstance.database?.executeQuery(createCaseTableQuery, withArgumentsIn: [0]))!
        if result.next(){
            
        
        _ = sharedInstance.database!.executeUpdate("INSERT INTO notifications (noti_id, message,appointment_message,status) values (? ,?,?, ?)", withArgumentsIn:[notify.noti_id!,notify.message!,notify.body!,notify.status! ])
        }
        sharedInstance.database?.close()
    }
    
    func insertData(_ clientInfo: ClientInfo){
    sharedInstance.database!.open()
        let defaults = UserDefaults.standard
        let get_id = defaults.object(forKey: "userId")
       
        let result:FMResultSet = (sharedInstance.database?.executeQuery("SELECT COUNT(*) FROM clientdetails where client_id = ?", withArgumentsIn: [get_id!]))!
        if result.next(){
            let count = result.int(forColumnIndex: 0)
            
 if count > 0{
             _ = sharedInstance.database!.executeUpdate("UPDATE clientdetails SET fullname = ?,client_dob = ?,alien_number = ?,email = ?,phone = ?,date_entry_usa = ?,date_entry_port = ?,visa_time_entry_usa = ?,family_name = ?,relation = ?,relative_dob = ?,visa_status = ?,date_of_entry = ?,port_of_entry = ?, visatime_entry = ?,current_address = ?,current_city = ?, current_state = ?, current_zip = ?,current_country = ?,phoneCode = ? WHERE  client_id = ?", withArgumentsIn:[clientInfo.fullname!,clientInfo.client_dob!,clientInfo.alien_number!,clientInfo.email!,clientInfo.phone!,clientInfo.date_entry_usa!, clientInfo.date_entry_port!, clientInfo.visa_time_entry_usa!,clientInfo.family_name!, clientInfo.relation!, clientInfo.relative_dob!, clientInfo.visa_status!,clientInfo.date_of_entry!,clientInfo.port_of_entry!,clientInfo.visatime_entry!, clientInfo.current_address!,clientInfo.current_city!,clientInfo.current_state!,clientInfo.current_zip!, clientInfo.current_country!,clientInfo.phoneCode!,clientInfo.client_id])

              
            }
            else{
                
                _ = sharedInstance.database!.executeUpdate("INSERT INTO clientdetails (client_id, fullname,client_dob,alien_number,email,phone,date_entry_usa,date_entry_port,visa_time_entry_usa,family_name,relation,relative_dob,visa_status,date_of_entry,port_of_entry, visatime_entry,current_address,current_city, current_state, current_zip,current_country, phoneCode) values (?, ?,?, ?,?, ?,?, ?,?, ?,?, ?,?, ?,?, ?,?,?,?,?,?,?)", withArgumentsIn:[clientInfo.client_id,clientInfo.fullname!,clientInfo.client_dob!,clientInfo.alien_number!,clientInfo.email!,clientInfo.phone!,clientInfo.date_entry_usa!, clientInfo.date_entry_port!, clientInfo.visa_time_entry_usa!,clientInfo.family_name!, clientInfo.relation!, clientInfo.relative_dob!, clientInfo.visa_status!,clientInfo.date_of_entry!,clientInfo.port_of_entry!,clientInfo.visatime_entry!, clientInfo.current_address!,clientInfo.current_city!,clientInfo.current_state!,clientInfo.current_zip!, clientInfo.current_country!,clientInfo.phoneCode!])
                
                         }
        
     
        }
         sharedInstance.database!.close()
    }
    
//    func getUserProfile() -> Dictionary<String, String> {
//        
//        sharedInstance.database!.open()
//        let strQuery = "select * from client_details  limit 1"
//        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery(strQuery, withArgumentsIn: [1])
//        var dict:Dictionary<String, String> = [:]
//        if (resultSet != nil) {
//            while resultSet.next() {
//                dict = resultSet.resultDictionary as! Dictionary<String, String>
//            }
//        }
//        return dict as Dictionary<String, String>
//    }
    
    
    func getAllData() -> NSMutableArray {
        sharedInstance.database?.open()
        
        let detail:ClientInfo = ClientInfo()
        let get_id = defaults.object(forKey: "userId")
    print("userID!!==", get_id!)
        let resultSet:FMResultSet = (sharedInstance.database?.executeQuery("SELECT* FROM clientdetails where client_id = ?", withArgumentsIn: [get_id!]))!
//        let resultSet:FMResultSet! = sharedInstance.database!.executeQuery("SELECT * from client_details WHERE client_id = ?", withArgumentsIn: [detail.client_id])
        let itemInfo:NSMutableArray = NSMutableArray()
        //if resultSet != nil{
            if resultSet.next() {
                
                detail.client_id = Int(resultSet.int(forColumn: "client_id"))
                detail.fullname = String(resultSet.string(forColumn: "fullname")!)
                detail.client_dob = String(resultSet.string(forColumn: "client_dob")!)
                detail.alien_number = String(resultSet.string(forColumn: "alien_number")!)
                detail.email = String(resultSet.string(forColumn: "email")!)
                detail.phone = String(resultSet.string(forColumn: "phone")!)
                detail.date_entry_usa = String(resultSet.string(forColumn: "date_entry_usa")!)
                detail.date_entry_port = String(resultSet.string(forColumn: "date_entry_port")!)
               // detail.visa_time_entry_usa = String(resultSet.string(forColumn: "visa_time_entry_usa")!)
                //........current_address,current_city, current_state, current_zip,current_country
                detail.current_address = String(resultSet.string(forColumn: "current_address")!)
                detail.current_city = String(resultSet.string(forColumn: "current_city")!)
                detail.current_state = String(resultSet.string(forColumn: "current_state")!)
                detail.current_zip = String(resultSet.string(forColumn: "current_zip")!)
                detail.current_country = String(resultSet.string(forColumn: "current_country")!)
                
                detail.family_name = String(resultSet.string(forColumn: "family_name")!)
                detail.relation = String(resultSet.string(forColumn: "relation")!)
                detail.relative_dob = String(resultSet.string(forColumn: "relative_dob")!)
//                detail.visa_status = String(resultSet.string(forColumn: "visa_status")!)
//                detail.date_of_entry = String(resultSet.string(forColumn: "date_of_entry")!)
//                detail.port_of_entry = String(resultSet.string(forColumn: "port_of_entry")!)
//                detail.visatime_entry = String(resultSet.string(forColumn: "visatime_entry")!)
//                detail.phoneCode = String(resultSet.string(forColumn:"phoneCode")!)
                detail.family_member = String(resultSet.string(forColumn:"family_member")!)
                detail.gender = String(resultSet.string(forColumn:"gender")!)
                detail.fam_mem_gender = String(resultSet.string(forColumn:"fam_mem_gender")!)
              
                detail.family_member1 = String(resultSet.string(forColumn:"family_member1")!)
                detail.family_name1 = String(resultSet.string(forColumn:"family_name1")!)
                detail.relation1 = String(resultSet.string(forColumn:"relation1")!)
                detail.relative_dob1 = String(resultSet.string(forColumn:"relative_dob1")!)
                detail.fam_mem_phone1 = String(resultSet.string(forColumn:"fam_mem_phone1")!)
                detail.fam_mem_email1 = String(resultSet.string(forColumn:"fam_mem_email1")!)
                detail.fam_mem_alien_no1 = String(resultSet.string(forColumn:"fam_mem_alien_no1")!)
                detail.fam_mem_gender1 = String(resultSet.string(forColumn:"fam_mem_gender1")!)
                
                detail.family_member2 = String(resultSet.string(forColumn:"family_member2")!)
                detail.family_name2 = String(resultSet.string(forColumn:"family_name2")!)
                detail.relation2 = String(resultSet.string(forColumn:"relation2")!) 
                detail.relative_dob2 = String(resultSet.string(forColumn:"relative_dob2")!)
                detail.fam_mem_phone2 = String(resultSet.string(forColumn:"fam_mem_phone2")!)
                detail.fam_mem_email2 = String(resultSet.string(forColumn:"fam_mem_email2")!)
                detail.fam_mem_alien_no2 = String(resultSet.string(forColumn:"fam_mem_alien_no2")!)
                detail.fam_mem_gender2 = String(resultSet.string(forColumn:"fam_mem_gender2")!)
                itemInfo.add(detail)
            }
                   //}
        print("itemsArr=", itemInfo)
        sharedInstance.database?.close()
        return itemInfo
    }

}
