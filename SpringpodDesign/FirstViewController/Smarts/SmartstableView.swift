//
//  SmartstableView.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 17/05/22.
//
import UIKit
import AVKit
import AVFoundation
class SmartsTableview: UIViewController{
 
    var player : AVPlayer!
    var avpController =  AVPlayerViewController()
    
    @IBOutlet weak var SmartControlsTableView: UITableView!
    
    
    @IBOutlet weak var SamrtControlAVPlayerView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SmartControlsTableView.delegate = self
        SmartControlsTableView.dataSource = self
        
        startVideo()
        
        SamrtControlAVPlayerView.layer.cornerRadius = 15
        SamrtControlAVPlayerView.layer.masksToBounds = true
        
        
        if let tabBarItem1 = self.tabBarController?.tabBar.items?[0] {
            tabBarItem1.title = "On/Off"
            tabBarItem1.image = UIImage(named :"logout")?.withTintColor(.black)
            tabBarItem1.selectedImage = UIImage(named : "logout")?.withTintColor(.systemGreen)

        }
        
        

        
        var backButtonImage = UIImage(named: "Group 65-3")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)

    }

    @IBAction func homePressed(_ sender: Any) {
        
        _ = navigationController?.popToRootViewController(animated: true)

    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
      player.pause()
      
    }
    
    
    func startVideo(){
        
        let url = URL(string: "http://barraonqueen.sprngpod.com/barravideos/waterloo/index.m3u8")
        
        player = AVPlayer(url: url!)
        avpController.player = player
        avpController.view.frame.size.height = SamrtControlAVPlayerView.frame.size.height
        avpController.view.frame.size.width = SamrtControlAVPlayerView.frame.size.width
        self.SamrtControlAVPlayerView.addSubview(avpController.view)
        player.play()
    }
    
    
    
    
}
extension SmartsTableview : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SmartControlsTableView.dequeueReusableCell(withIdentifier: "SmartTableViewCell") as! SmartTableViewCell
        
        cell.smartBigview.layer.cornerRadius = 7.0
        cell.smartBigview.layer.masksToBounds = true
        cell.smartSmallview1.dropShadow()
        cell.smartimage1.SmartdropShadow()
        cell.smartimageview2.SmartdropShadow()
        cell.smartimageview3.SmartdropShadow()
        cell.smartImageView4.SmartdropShadow()
        return cell
    }
    

    
}



extension UIImageView {
    func SmartdropShadow(scale: Bool = true) {
        layer.cornerRadius = 7
        layer.masksToBounds = true

    }
}

    
    
    
    
    
    
    

