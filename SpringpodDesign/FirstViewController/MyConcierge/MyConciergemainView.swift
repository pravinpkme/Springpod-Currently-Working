//
//  MyConciergemainView.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 17/05/22.
//

import UIKit
import AVKit
import AVFoundation



var player : AVPlayer!
var avpController =  AVPlayerViewController()

class MyConciergeMainView: UIViewController{
 
    
    
    @IBOutlet weak var MyConciergeTableview: UITableView!
    
    @IBOutlet weak var MyConciergeAVPlayerView: UIView!
    
    let MyConciergeDataBig = ["Handy Man", "Laundry", "Reservation","Pets and Plants", "Plumping Maintenance", "Appliance Maintenence", "Carpentry Maintenence"]
    
    let MyConciergeDataSmall = ["for your comfort and convenience","We can get your laundry done for you","movies, restaurants and more", "Your pets and plants are in safe hands", "For your comfort and convenience","For your comfort and convenience", "For your comfort and convenience" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyConciergeTableview.delegate = self
        MyConciergeTableview.dataSource = self
        
        startVideo()
        
        MyConciergeAVPlayerView.layer.cornerRadius = 15
        MyConciergeAVPlayerView.clipsToBounds = true

        
        var backButtonImage = UIImage(named: "Group 65-4")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)



    }
    override func viewWillDisappear(_ animated: Bool) {
      player.pause()
      
    }
    

    @IBAction func homePressed(_ sender: Any) {
        
        
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    
    
    func startVideo(){
        
        let url = URL(string: "http://barraonqueen.sprngpod.com/barravideos/waterloo/index.m3u8")
        
        player = AVPlayer(url: url!)
        avpController.player = player
        avpController.view.frame.size.height = MyConciergeAVPlayerView.frame.size.height
        avpController.view.frame.size.width = MyConciergeAVPlayerView.frame.size.width
        self.MyConciergeAVPlayerView.addSubview(avpController.view)
        player.play()
    }
    
    
    
    
    
    
    
}
extension MyConciergeMainView : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyConciergeTableview.dequeueReusableCell(withIdentifier: "MyConciergeTableViewCell") as! MyConciergeTableViewCell
        
        cell.myconciergeimage.cgdropShadow()
        cell.Myconciergebiglabel.text = MyConciergeDataBig[indexPath.row]
        cell.myconciergesmalllabel.text = MyConciergeDataSmall[indexPath.row]
        cell.Myconciergeview.layer.cornerRadius = 7.0
        cell.Myconciergeview.layer.masksToBounds = true
       
        return cell
    }
    

    
}
extension UIImageView {
    func cgdropShadow(scale: Bool = true) {
        layer.cornerRadius = 8
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.05
        layer.shadowRadius = 3.0
    }
}





    
    
    
    
    
    
    

