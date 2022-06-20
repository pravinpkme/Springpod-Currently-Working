//
//  LoginPage.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 23/05/22.
//

import UIKit
import CoreLocation
///just checking
var tulet : String
class LoginPage: UIViewController{
 
let locationManager = CLLocationManager()
    
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
            
        
        locationManager.requestWhenInUseAuthorization()
        
        
        UsernameTextField.MakeSemiTransparent()
        PasswordTextField.MakeSemiTransparent()
        registerPressed.MakeLableSemiTransaprent()
        loginPressed.MakeLableSemiTransaprent()
        PasswordTextField.enablePasswordToggle()

    }
    
    
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        
        postRequest()
        
    }
    
    

    func postRequest() {
     
        guard let email = self.UsernameTextField.text else {return}
        guard let password = self.PasswordTextField.text else {return}
        
        
        var device_Type = ""
        if UIDevice.current.userInterfaceIdiom == .phone{
            device_Type = "iPhone"
        }else{
            device_Type = "iPhone"
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

                DispatchQueue.main.async {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                      let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Tabbarcontroller")
                      self.present(nextViewController, animated:false, completion:nil)
                }
                 
               
              

                
                
                let value = jsonResponse.array("root")
                let status = value[0].string("status")
                print(status)
                if status == "Active"{
                    return
                }
               
                
               // Utilities.showAlertMessage(message: status, onView: self)

          } else {
              
              DispatchQueue.main.async {
                  func showAlert(title: String, message: String){
                      let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                      alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
                      self.present(alert, animated: true, completion: nil)
                  }
                  showAlert(title: "Enter a Valied Email!", message: "This is not a valied email format")
                print("data maybe corrupted or in wrong format")
              }
              
              
              
            throw URLError(.badServerResponse)
          }
        } catch let error {
          print(error.localizedDescription)
            
        }
      }
      // perform the task
      task.resume()
    }
    
 
        
//    self.registerPressed.text = "Register"
//        
//    self.loginPressed.text = "Login"
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



