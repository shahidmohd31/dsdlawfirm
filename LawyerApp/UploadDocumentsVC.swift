//
//  UploadDocumentsVC.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 13/07/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import Alamofire
import OpalImagePicker

class UploadDocumentsVC: UIViewController,OpalImagePickerControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
var pickerImg = UIImagePickerController()   
    @IBOutlet var imgDocuments: UIImageView!
    
    @IBOutlet weak var alienNumberFromUser: UITextField!
    
    var path:NSString?
    var alienStr:String?
    var imageStrings:[String] = []
    var allSelectedImaged:[UIImage]?
   // myImageView.image?.accessibilityIdentifier = "add-image"
    override func viewDidLoad() {
        super.viewDidLoad()
//         let alien_number = defaults.object(forKey: "alien_number") as? String
//        alienStr = alien_number
//        alienNumberFromUser.text = alienStr
navigationItem.title = "Upload Documents"
       navigationController?.navigationBar.topItem?.title = ""
        //imgDocuments.image?.accessibilityIdentifier = "upload-1"
    }
  
    func uploadImage() {
        let defaults = UserDefaults.standard
        let client_id = defaults.string(forKey: "userId")
        let upload_parameter:[String: Any] = ["alien_number":self.alienStr!,"images": self.imageStrings,"client_id":client_id]
        print(upload_parameter)
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in upload_parameter {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
        }, to:"http://rohit.winklix.com/lawyer/app/upload_documents.php")
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    //self.delegate?.showSuccessAlert()
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                    //                        self.showSuccesAlert()
                    //self.removeImage("frame", fileExtension: "txt")
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                        self.view.makeToast("Upload your documents successfully", duration: 2.0, position: .center)
                        SwiftLoader.hide()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                }
                
            case .failure(let encodingError):
                //self.delegate?.showFailAlert()
                print(encodingError)
            }
            
        }
        
    }
    
    
    @IBAction func uploadDocumentsClicked(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Alert!", message: "Check your documents is Uploaded Properly or not", preferredStyle: UIAlertControllerStyle.alert)
        let no = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) { UIAlertAction in
            
            self.alienStr = self.alienNumberFromUser.text!
            if self.alienStr != nil {
                SwiftLoader.show(title: "Uploading...", animated: true)

                self.uploadImage()
            }
            else{
                SwiftLoader.hide()
                Profile.invokeAlertMethod(strTitle: "Alert", strBody: "Please update your Profile First", delegate: nil)
                
            }
        }
        
        let yes = UIAlertAction(title: "No", style: UIAlertActionStyle.cancel) { UIAlertAction in
            
        }
        alert.addAction(no)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func attachDocumentsClicked(_ sender: Any) {
        
        pickerImg.delegate = self
        let alert: UIAlertController = UIAlertController(title: "Choose images", message: nil, preferredStyle:UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) {
            
            UIAlertAction in self.camera()
            
        }
        let cancel = UIAlertAction(title: "Cancel", style:UIAlertActionStyle.default){ UIAlertAction in
              self.dismiss(animated: true, completion: nil)
        }
        let galleryAction = UIAlertAction(title: "Photo Gallery", style: UIAlertActionStyle.default) { UIAlertAction in
            self.gallery()
        }
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancel)
        
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.height/2, y: self.view.bounds.height - 150, width: 1.0, height: 1.0)
        
        self.present(alert, animated: true)
    }
    func camera() {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            
            pickerImg.sourceType = UIImagePickerControllerSourceType.camera
            present(pickerImg, animated: true, completion: nil)
        }
        else{ gallery()}
        
    }
    
    func imagePickerDidCancel(_ picker: OpalImagePickerController) {
        //Cancel action?
    }
    
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]) {
        //Save Images, update UI
        print(images)
        allSelectedImaged = images
        for image in images {

            let imageStr = ConvertImageToBase64String(img: image)
            imageStrings.append(imageStr)
//            print(imageStr)
        }
        //Dismiss Controller
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    func ConvertImageToBase64String (img: UIImage) -> String {
        let imageData:NSData = UIImageJPEGRepresentation(img, 0.50)! as NSData //UIImagePNGRepresentation(img)
        let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
        return imgString
    }
    func gallery(){
        
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            let imagePicker = OpalImagePickerController()
            imagePicker.imagePickerDelegate = self
            imagePicker.maximumSelectionsAllowed = 10
            present(imagePicker, animated: true, completion: nil)
            
        
        }
        
        }
        
//    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])  {
    
        
        var selectImgPicker: UIImage?
        if let editImg = info["UIImagePickerControllerEditedImage"] as? UIImage
        {
            selectImgPicker  = editImg
            
        }
         if let originalImg = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectImgPicker = originalImg
            
        }
         if let selectImage = selectImgPicker{
            imgDocuments.image = selectImage
        }
        dismiss(animated: true, completion:nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerImg = UIImagePickerController()
        dismiss(animated: true, completion: nil)
        
    }


}
extension UIImageView
{
    func getFileName() -> String? {
        // First set accessibilityIdentifier of image before calling.
        let imgName = self.image?.accessibilityIdentifier
        print("imgName=", imgName!)
        return imgName
    }
}
