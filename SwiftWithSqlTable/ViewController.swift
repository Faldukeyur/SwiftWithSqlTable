//
//  ViewController.swift
//  SwiftWithSqlTable


import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toast

class ViewController: UIViewController {
    
    @IBOutlet var tfEmail : UITextField!
    @IBOutlet var tfPassword : UITextField!
    @IBOutlet var btnSave : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onButtonClick(sender: UIButton){
        
        self.apiLogin()
    }
}

extension ViewController {
    
    func isValidDataForUpdateProfile() -> Bool {
        
        guard tfEmail.text != nil && !(tfEmail.text?.isEmpty)! else {
            AppDelegate.mainWindow().makeToast("Please enter email address")
            return false
        }
        
        guard tfPassword.text != nil && !(tfPassword.text?.isEmpty)! else {
            AppDelegate.mainWindow().makeToast("Please enter password")
            return false
        }
        return true
    }
    
    func apiLogin(){
        
        if isValidDataForUpdateProfile() {
            
            let param:Parameters = ["userName":tfEmail.text ?? "",
                                    "password":tfPassword.text ?? ""]
            
            MBProgressHUD.showAdded(to: AppDelegate.mainWindow(), animated: true)
            
            let reqUrl = "URL"
            
            Alamofire.request(reqUrl, method: .post, parameters: param)
                .validate().responseJSON { response in
                    
                    debugPrint("Request: URL: \(String(describing: response.request?.url?.absoluteString)) Param: \(param)")
                    
                    MBProgressHUD.hide(for: AppDelegate.mainWindow(), animated: true)
                    
                    switch response.result {
                        
                    case .failure(let error):
                        debugPrint("ERROR on Request: \(error) || \(error.localizedDescription) || \(error.localizedDescription)")
                        AppDelegate.mainWindow().makeToast("Oops! Something went wrong. Plase try again.")
                    case .success:
                        
                        let json = JSON(response.result.value!)
                        
                        let status = json["Status"].string
                        
                        if status != "Success" {
                            
                            print("failed to fetch notifications")
                            return
                        }
                        self.saveTripList(responseJSON: json)
                    }
            }
        }
    }
    
    private func saveTripList(responseJSON:JSON?){
        
        guard let response = responseJSON else {
            AppDelegate.mainWindow().makeToast("Something went wrong, please wait a moment and try again later")
            return
        }
        
        guard let json = response["Data"].dictionary
            else {
                AppDelegate.mainWindow().makeToast("Something went wrong, please wait a moment and try again later")
                return
        }
        
        let objUser = User()
        _ = SQLiteDB.shared.execute(sql: "DELETE from users")
        
        objUser.Id = (json["Id"]?.intValue)!
        objUser.IsClient = (json["IsClient"]?.stringValue)!
        objUser.Name = (json["Name"]?.stringValue)!
        objUser.PhoneNumber = (json["PhoneNumber"]?.stringValue)!
        objUser.PositionId = (json["PositionId"]?.intValue)!
        objUser.PositionName = (json["PositionName"]?.stringValue)!
        objUser.ProfilePic = (json["ProfilePic"]?.stringValue)!
        objUser.Address = (json["Address"]?.stringValue)!
        objUser.ClientId = (json["ClientId"]?.intValue)!
        objUser.ClientLogo = (json["ClientLogo"]?.stringValue)!
        objUser.ClientName = (json["ClientName"]?.stringValue)!
        objUser.CountryId = (json["CountryId"]?.intValue)!
        objUser.CountryName = (json["CountryName"]?.stringValue)!
        objUser.EmailId = (json["EmailId"]?.stringValue)!
        objUser.FunctionColor = (json["FunctionColor"]?.stringValue)!
        objUser.FunctionId = (json["FunctionId"]?.intValue)!
        objUser.FunctionName = (json["FunctionName"]?.stringValue)!
        
        if objUser.save() == 0 {
            debugPrint("failed to save user")
        }
    }
}

extension ViewController {
    
//    func apiImagesUploadwithParam() {
//
//
//        let reqUrl = kApiBaseURL + kApiUpdateProfile
//
//        var data:Data? = nil
//
//        if let img = imgUser.image {
//            data = UIImageJPEGRepresentation(img,0.2)
//        }
//        let fileName = "\(Date().timeIntervalSince1970).jpg"
//
//        Alamofire.upload(multipartFormData: { (multipartFormData) in
//
//            for (key,value) in param {
//                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
//            }
//            multipartFormData.append(data!, withName: "profile_image", fileName: fileName, mimeType: "image/jpeg")
//            debugPrint("REQUEST:", reqUrl, "param", param)
//
//        }, usingThreshold: UInt64.init(), to: reqUrl, method: .post, encodingCompletion: { (encodingResult) in
//            MBProgressHUD.hide(for: AppDelegate.mainWindow(), animated: true)
//
//            switch encodingResult {
//            case .success(let upload, _, _):
//                upload.responseJSON(completionHandler: { (response) in
//                    debugPrint(response)
//
//                    let json = JSON(response.result.value!)
//
//                    let status = json["Status"].string
//
//                    if status != "Success" {
//
//                        print("failed to fetch notifications")
//                        return
//                    }
//                    self.saveTripList(responseJSON: json)
//                })
//            case .failure(let encodingError):
//                debugPrint(encodingError)
//            }
//        })
//    }
//   }
}
