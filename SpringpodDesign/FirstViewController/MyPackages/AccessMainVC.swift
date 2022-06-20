//
//  AccessMainVC.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 18/05/22.
//

import UIKit
class AccessMainVIewController: UIViewController{
 
    
    
    @IBOutlet weak var AccessMainTableview: UITableView!
    
    @IBOutlet weak var AccessBannerImage: UIImageView!
    
    let AccessMainDataBig = ["Main Room", "+","+","+"]
    
    let AccessMainDataSmall = ["lock","","","" ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AccessMainTableview.delegate = self
        AccessMainTableview.dataSource = self
        
        
        
        
        AccessBannerImage.clipsToBounds = true
        AccessBannerImage.layer.cornerRadius = 15
        
        
        var backButtonImage = UIImage(named: "Group 65-3")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
        




    }

}
extension AccessMainVIewController : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AccessMainDataBig.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AccessMainTableview.dequeueReusableCell(withIdentifier: "AccessTableViewCell") as! AccessTableViewCell
        
        cell.accessimageview.cgdropShadow()
        cell.accessBigLabel.text = AccessMainDataBig[indexPath.row]
        cell.acccessSmallLabel.text = AccessMainDataSmall[indexPath.row]
        cell.accessbigview.layer.cornerRadius = 7.0
        cell.accessbigview.layer.masksToBounds = true
        cell.accesssmallview.dropShadow()
       
        return cell
    }
    

    
}
