//
//  UnlockViewController.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 18/05/22.
//

import UIKit
import AVKit
import AVFoundation
class UnlockeMainView: UIViewController{
    var player : AVPlayer!
    var avpController =  AVPlayerViewController()
    
    @IBOutlet weak var UnlockTableview: UITableView!
    
    @IBOutlet weak var UnlockAVVideoPlayer: UIView!
    
    let UnlockDataBig = ["Main Door 1", "Main Door", "+" , "+"]
    
    let UnlockDataSmall = ["lock", "lock", "", "" ]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UnlockTableview.delegate = self
        UnlockTableview.dataSource = self
        
        startVideo()
        
        UnlockAVVideoPlayer.layer.cornerRadius = 15
        UnlockAVVideoPlayer.clipsToBounds = true

        
     
        
        
        var backButtonImage = UIImage(named: "Group 65-2")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
        
//        let button1 = UIBarButtonItem(image: UIImage(named: "Group 65-2"), style: .plain, target: self, action: #selector(onTapOfBack))
//        self.navigationController?.navigationBar.backItem?.leftBarButtonItem = button1
//        self.navigationItem.leftBarButtonItem  = button1
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
      player.pause()
      
    }

    
    
    
    func startVideo(){
        let url = URL(string: "http://barraonqueen.sprngpod.com/barravideos/waterloo/index.m3u8")
        player = AVPlayer(url: url!)
        avpController.player = player
        avpController.view.frame.size.height = UnlockAVVideoPlayer.frame.size.height
        avpController.view.frame.size.width = UnlockAVVideoPlayer.frame.size.width
        self.UnlockAVVideoPlayer.addSubview(avpController.view)
        player.play()
    }
    
    
    
    
    

}
extension UnlockeMainView : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return UnlockDataBig.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UnlockTableview.dequeueReusableCell(withIdentifier: "UnlockTableViewCell") as! UnlockTableViewCell
        
        cell.unlockimage.cgdropShadow()
        cell.unlockBigtitl.text = UnlockDataBig[indexPath.row]
        cell.unlockSmallTitle.text = UnlockDataSmall[indexPath.row]
        cell.outerview.layer.cornerRadius = 7.0
        cell.outerview.layer.masksToBounds = true
       
        return cell
    }
    

    
}



    
    
    
    
    
    
    

