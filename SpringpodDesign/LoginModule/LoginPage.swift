//
//  LoginPage.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 23/05/22.
//

import UIKit
import SPPermissions


class LoginPage: UIViewController{
    
    
    
    var iconClick = true
    
    
    @IBOutlet weak var fbimage: UIImageView!
    @IBOutlet weak var registerPressed: UILabel!
    @IBOutlet weak var loginPressed: UILabel!
    @IBOutlet weak var UsernameTextField: UITextField!  {
        didSet {
            let whitePlaceholderText = NSAttributedString(string: "Username",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            UsernameTextField.attributedPlaceholder = whitePlaceholderText
        }
    }
    @IBOutlet weak var PasswordTextField: UITextField!  {
        didSet {
            let whitePlaceholderText = NSAttributedString(string: "Password",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            PasswordTextField.attributedPlaceholder = whitePlaceholderText
        }
    }
    
    
    
    
    
    @IBAction func iconAction(_ sender: Any) {
        
        PasswordTextField.enablePasswordToggle()
    }
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        permissionManger()
        
        
        UsernameTextField.MakeSemiTransparent()
        PasswordTextField.MakeSemiTransparent()
        registerPressed.MakeLableSemiTransaprent()
        loginPressed.MakeLableSemiTransaprent()
        PasswordTextField.enablePasswordToggle()
        
    }
    
    
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        postRequest()
        
    }
    
    
    func permissionManger(){
        let controller = SPPermissions.native([.camera, .locationWhenInUse, .microphone, .bluetooth])
        controller.present(on: self)
        
    }
    
    
    func postRequest() {
       
        
        guard let email = self.UsernameTextField.text else {return}
        guard let password = self.PasswordTextField.text else {return}
        
        
        var device_Type = ""
        if UIDevice.current.userInterfaceIdiom == .phone{
            device_Type = "Tablet"
        }else{
            device_Type = "Tablet"
        }
        
        
        
        let url = URL(string: "http://barraonqueen.sprngpod.com:8080/indexbarraonqueen.php/newNormalLogin1")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")//
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "loginName": email,
            "password": password,
            "platform": "iOS",
            "deviceId": UIDevice.current.identifierForVendor?.uuidString ?? "",
            "osVersion": UIDevice.current.systemVersion,
            "MAC": "default",
            "SCID": "default",
            "serialNumber": "default",
            "deviceModel": UIDevice.current.model,
            "deviceType": device_Type,
            "layout": "default",
            "deviceToken": UIDevice.current.identifierForVendor!,
            "appVersion": "4.10.0"
        ]
        print("Login Params -> \(parameters)")
        let session = URLSession.shared
        request.httpBody = parameters.percentEncoded()
        
        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                return
            }
            
            // ensure there is valid response code returned from this HTTP response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
                print("Invalid Response received from the server")
                return
            }
            
            // ensure there is data returned
            guard let responseData = data else {
                print("nil Data received from the server")
                return
            }
            
            do {
                // create json object from data or use JSONDecoder to convert to Model stuct
                if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String:Any] {
                    
                    
                    print(jsonResponse)
                    let value = jsonResponse.array("root")
                    
                    
                    let status = value[0].string("status")
                    
                    print(status)
                    
                    let firstName = value[0].string("firstName")
                    let lastName = value[0].string("lastName")
                    let emailID = value[0].string("emailId")
                    let loginName = value[0].string("loginName")
                    let mobileNo = value[0].string("mobileNo")
                    let Country = value[0].string("country")
                    let CustomerID  = value[0].string("customerId")
                    let ipAddress = value[0].string("ipAddress")
                    let uniqueDeviceId = value[0].string("uniqueDeviceId")
                    let language = value[0].string("language")
                    let PIN = value[0].string("PIN")
                    let areaCode = value[0].string("areaCode")
                    let streetName = value[0].string("streetName")
                    let city = value[0].string("city")
                    let postalCode = value[0].string("postalCode")
                    let province = value [0].string("province")
                    let roomNumber = value[0].string("roomNumber")
                    let checkInDate = value[0].string("checkInDate")
                    let checkOutDate = value[0].string("checkOutdate")
                    let branchId = value [0].string("branchId")
                    let numberOfDevices = value[0].string("numberOfDevices")
                    let lastSeenChannelId = value[0].string("lastSeenChannelId")
                    let lastSeenChannelTime = value[0].string("lastSeenChannelTime")
                    
                    
                    
        
                    
                    
                    
                    
                    
                    
                    if status == "Active"{
                        self.EnterLoginPage()
                        return
                    }else{
                        DispatchQueue.main.async {
                            self.showAlertMSG(msg: status)
                        }}
                    
                    
                    
                } else {
                    throw URLError(.badServerResponse)
                }
            } catch let error {
                print(error.localizedDescription)
                
            }
            
            
            
        }
        task.resume()
    }
    
    func showAlertMSG(msg:String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func EnterLoginPage(){
        DispatchQueue.main.async {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainTabbarcontroller")
            self.present(nextViewController, animated:true, completion:nil)
            
        }
    }
    
    
    
    
    
    
    
    
}



let button = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToggle(){
        
        button.setImage(UIImage(named: "eye.slash.fill"), for: .normal)
        button.setImage(UIImage(named: "eye.fill"), for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = button
        rightViewMode = .always
        button.alpha = 0.4
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        button.isSelected.toggle()
    }
}




typealias JSON = [String:Any]



