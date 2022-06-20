//
//  Shopping MianView.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 18/05/22.
//


import UIKit
import AVFoundation
import AVKit
class ShoppingMainVIewController: UIViewController{
 
    
    
    var player : AVPlayer!
    var avpController =  AVPlayerViewController()
    
    
    
    @IBOutlet weak var ShoppingAFPlayerView: UIView!
    
    @IBOutlet weak var ShoppingMainTableview: UITableView!
    
    
    let ShoppingMainDataBig = ["Jasnas", "Estore"]
    
    let ShoppingMainDataSmall = ["European Meat and Dell","Buy upgrade" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        ShoppingMainTableview.delegate = self
        ShoppingMainTableview.dataSource = self
        
        startVideo()
        
        
        ShoppingAFPlayerView.layer.cornerRadius = 15
        ShoppingAFPlayerView.clipsToBounds = true
        

        
        
        
        var backButtonImage = UIImage(named: "Group 65-4")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
    }
    @IBAction func homeButtonPressed(_ sender: Any) {
        
        
        self.navigationController?.popToRootViewController(animated: true)

    }
    func startVideo(){
        
        let url = URL(string: "https://www.bloomberg.com/media-manifest/streams/eu.m3u8")
        
        player = AVPlayer(url: url!)
        avpController.player = player
        avpController.view.frame.size.height = ShoppingAFPlayerView.frame.size.height
        avpController.view.frame.size.width = ShoppingAFPlayerView.frame.size.width
        self.ShoppingAFPlayerView.addSubview(avpController.view)
        player.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      player.pause()
      
    }
    
    
    
}
extension ShoppingMainVIewController : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingMainDataBig.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ShoppingMainTableview.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell") as! ShoppingTableViewCell
        
        cell.shoppingimage.cgdropShadow()
        cell.shoppingBigTitle.text = ShoppingMainDataBig[indexPath.row]
        cell.shoppingSmallTitle.text = ShoppingMainDataSmall[indexPath.row]
        cell.shoppingOuterview.layer.cornerRadius = 7.0
        cell.shoppingOuterview.layer.masksToBounds = true
        cell.shoppingInnerView.dropShadow()
       
        return cell
    }
    

    
}
