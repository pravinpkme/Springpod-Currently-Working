//
//  RadioVCMain.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 17/05/22.
//

import UIKit
class RadioViewControllerMain: UIViewController{
 
    @IBOutlet weak var RadioTableview: UITableView!
    let RadioData = ["One More", "M Radio"]
    
    @IBOutlet weak var RadioBannerimage: UIImageView!
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var backButtonImage = UIImage(named: "Group 65-6")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
        
        
        if let tabBarItem1 = self.tabBarController?.tabBar.items?[0] {
            tabBarItem1.title = "Radio"
            tabBarItem1.image = UIImage(named :"radio-unselected")
            tabBarItem1.selectedImage = UIImage(named : "radio-selected")

        }
        if let tabBarItem2 = self.tabBarController?.tabBar.items?[1] {
            tabBarItem2.title = "Community"
            tabBarItem2.image = UIImage(named : "tour-unselected")
            tabBarItem2.selectedImage = UIImage(named : "tour-selected")
        }
        if let tabBarItem3 = self.tabBarController?.tabBar.items?[2] {
            tabBarItem3.title = "Suites"
            tabBarItem3.image = UIImage(named : "vod-unselected")
            tabBarItem3.selectedImage = UIImage(named : "vod-selected")
        }
        
        





        RadioBannerimage.layer.cornerRadius = 15
        RadioBannerimage.layer.masksToBounds = true
        RadioTableview.delegate = self
        RadioTableview.dataSource = self
    }

    @IBAction func homepressed(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)

    }
}
extension RadioViewControllerMain : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RadioData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RadioTableview.dequeueReusableCell(withIdentifier: "RadioTableViewCell") as! RadioTableViewCell
        
        cell.RadioTitle.text = RadioData[indexPath.row]
        cell.RadioBigview.layer.cornerRadius = 7.0
        cell.RadioBigview.layer.masksToBounds = true
        cell.radioImageLogo.layer.cornerRadius = 7.0
        cell.radioImageLogo.layer.masksToBounds = true
        cell.RadioSmallview.dropShadow()

        return cell
    }
    

    
}



