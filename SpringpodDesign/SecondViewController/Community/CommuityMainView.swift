//
//  CommuityMainView.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 18/05/22.
//

import UIKit
import AVKit
import AVFoundation

class CommunityMainVIewController: UIViewController{
 
    
    
    @IBOutlet weak var CommunityAvplayerView: UIView!
    @IBOutlet weak var CommunityMainTableview: UITableView!
    
    
    let CommunityMainDataBig = ["Light Rail Transit", "The Kitchener City Hall", "Victoria Park", "Oktoberfest", "Kitchener market", "Farmers market"]
    
    let CommunityMainDataSmall = ["Light Rail Transit(LSR) was short-listed as the technology for the new rapid transist system. The...","The Kitchener City Hall is enclosed on two sides by three-story wings, with the main building at...", "Victoria Park is oldest park in Kitchener, Ontario, Canada, situated downtown. The Park ...", "Kitechener-Waterloo Oktoberfest is an annual nine-day festival in the twin cities of Kitch...","The Kitchener Market is more than a building, it's a community. And it's been that way for over....", "The community of St.Jacobs is located in the southwest Ontario, just north of Waterloo in Woo..." ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CommunityMainTableview.delegate = self
        CommunityMainTableview.dataSource = self
        
        CommunityAvplayerView.layer.cornerRadius = 15
        CommunityAvplayerView.clipsToBounds = true
        
        
        
        startVideo()
        
        var backButtonImage = UIImage(named: "Group 65-6")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
    }

    @IBAction func homebuttoPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
      player.pause()
      
    }
    
    func startVideo(){
        
        let url = URL(string: "http://barraonqueen.sprngpod.com/barravideos/waterloo/index.m3u8")
        
        player = AVPlayer(url: url!)
        avpController.player = player
        avpController.view.frame.size.height = CommunityAvplayerView.frame.size.height
        avpController.view.frame.size.width = CommunityAvplayerView.frame.size.width
        self.CommunityAvplayerView.addSubview(avpController.view)
        player.play()
    }
    
}
extension CommunityMainVIewController : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CommunityMainDataBig.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CommunityMainTableview.dequeueReusableCell(withIdentifier: "CommunityTableViewCell") as! CommunityTableViewCell
        
        cell.communityImageView.cgdropShadow()
        cell.communityBigLabel.text = CommunityMainDataBig[indexPath.row]
        cell.communitySmallLabel.text = CommunityMainDataSmall[indexPath.row]
        cell.communityOuterView.layer.cornerRadius = 7.0
        cell.communityOuterView.layer.masksToBounds = true
        cell.communityInnerView.dropShadow()
       
        return cell
    }
    

    
}
