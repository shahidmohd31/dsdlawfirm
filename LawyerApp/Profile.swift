//
//  Profile.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 19/07/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit

class Profile: NSObject {
    
     class func getPath(fileName: String) -> String {
            
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            //let fileURL = documentsURL.URLByAppendingPathComponent(fileName)
            let fileURL = documentsURL.appendingPathComponent(fileName)
            print("filepath=", fileURL.path)
            return fileURL.path
        }
        
        class func copyFile(fileName: NSString) {
            let dbPath: String = getPath(fileName: fileName as String)
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: dbPath) {
                
                let documentsURL = Bundle.main.resourceURL
                let fromPath = documentsURL!.appendingPathComponent(fileName as String)
                
                var error : NSError?
                do {
                    try fileManager.copyItem(atPath: fromPath.path, toPath: dbPath)
                } catch let error1 as NSError {
                    error = error1
                }
                let alert: UIAlertView = UIAlertView()
                if (error != nil) {
                    alert.title = "Error Occured"
                    alert.message = error?.localizedDescription
                } else {
                    alert.title = "Successfully Copy"
                    alert.message = "Your database copy successfully"
                }
                alert.delegate = nil
                alert.addButton(withTitle: "Ok")
                alert.show()
            }
        }
        
        class func invokeAlertMethod(strTitle: NSString, strBody: NSString, delegate: AnyObject?) {
            let alert: UIAlertView = UIAlertView()
            alert.message = strBody as String
            alert.title = strTitle as String
            alert.delegate = delegate
            alert.addButton(withTitle: "Ok")
            alert.show()
        }


}
