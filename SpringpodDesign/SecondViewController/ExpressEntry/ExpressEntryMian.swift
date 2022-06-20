//
//  ExpressEntryMian.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 18/05/22.
//

import UIKit
class ExpressEntryVIewController: UIViewController{
 
    
    @IBOutlet weak var ExpressEntryBAnnerImage: UIImageView!
    
    @IBOutlet weak var ExpressEntryTableView: UITableView!
    let ExpressEntryDataBig = ["East Gate", "GYM","East Gate","Garage Roshan"]
    
    let ExpressEntryDataSmall = ["lock","lock","lock","lock" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ExpressEntryBAnnerImage.clipsToBounds = true
        ExpressEntryBAnnerImage.layer.cornerRadius = 15

        ExpressEntryTableView.delegate = self
        ExpressEntryTableView.dataSource = self
    }

}
extension ExpressEntryVIewController : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExpressEntryDataBig.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ExpressEntryTableView.dequeueReusableCell(withIdentifier: "ExpressEntryTableViewCell") as! ExpressEntryTableViewCell
        
        cell.imageExpressEntry.cgdropShadow()
        cell.biglabelExpressEntry.text = ExpressEntryDataBig[indexPath.row]
        cell.smallLabelExpressEntry.text = ExpressEntryDataSmall[indexPath.row]
        cell.bigviewExpressEntry.layer.cornerRadius = 7.0
        cell.bigviewExpressEntry.layer.masksToBounds = true
        cell.samllviewExpressEntry.dropShadow()
       
        return cell
    }
    

    
}
