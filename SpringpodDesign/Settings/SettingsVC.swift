//
//  SettingsVC.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 17/05/22.
//

import UIKit
class SettingsMainVc: UIViewController{
 
    
    
    @IBOutlet weak var SettingBannerimage: UIImageView!
    
    
    @IBOutlet weak var settingsTableView: UITableView!
    let Settingsdata = ["My Account", "Change DP", "My Service Request", "Residence Guide", "App Theme", "Subscription Detail", "Notification", "Device Information", "FAQs", "About Us", "Privacy", "Terms and Conditions", "Logout"]
    let SettingssImages = [#imageLiteral(resourceName: "profile-unselected") , #imageLiteral(resourceName: "profile-unselected") , #imageLiteral(resourceName: "faq") , #imageLiteral(resourceName: "aboutus") , #imageLiteral(resourceName: "faq") , #imageLiteral(resourceName: "subscription-detail") , #imageLiteral(resourceName: "notification") , #imageLiteral(resourceName: "device-information"), #imageLiteral(resourceName: "faq"), #imageLiteral(resourceName: "aboutus"), #imageLiteral(resourceName: "default-screen"), #imageLiteral(resourceName: "faq") , #imageLiteral(resourceName: "default-screen")]
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      

        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        SettingBannerimage.clipsToBounds = true
        SettingBannerimage.layer.cornerRadius = 15
        
        
    }
    @IBAction func homePressed(_ sender: Any) {
        
        
        _ = navigationController?.popToRootViewController(animated: true)

    }
    
}
extension SettingsMainVc : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Settingsdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "SettingsSubView") as! SettingsSubViewTableViewCell
        
        cell.settingsTitle.text = Settingsdata[indexPath.row]
        cell.SettingsBigView.layer.cornerRadius = 7.0
        cell.SettingsBigView.layer.masksToBounds = true
        cell.SettingsSmallView.dropShadow()
        cell.SettingsDpic.layer.cornerRadius = 7.0
        cell.SettingsDpic.layer.masksToBounds = true
        cell.settingsImage.image = SettingssImages[indexPath.row]

        return cell
    }
    

    
}



