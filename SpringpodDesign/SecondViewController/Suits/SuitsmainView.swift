//
//  SuitsmainView.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 18/05/22.
//

import UIKit
import AVFoundation
import AVKit

class SuitsViewController: UIViewController{
    
    
    @IBOutlet weak var SuitsAVPlayerView: UIView!
    
    @IBOutlet weak var SuitsCollectionview: UICollectionView!
    
    let Suitsimage = [#imageLiteral(resourceName: "2") , #imageLiteral(resourceName: "1") , #imageLiteral(resourceName: "3") , #imageLiteral(resourceName: "4") ]
    
    let SuitsDatatitle = ["Free", "Free", "Free", "Free"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SuitsCollectionview.delegate = self
        SuitsCollectionview.dataSource = self
        
        startVideo()
        
        
        SuitsAVPlayerView.layer.cornerRadius = 15
        SuitsAVPlayerView.clipsToBounds = true
        
        var backButtonImage = UIImage(named: "Group 65-6")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
    }
    
    
    
    
    
    
   

    @IBAction func homebuttonPressed(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)

    }
    func startVideo(){
        
        let url = URL(string: "http://barraonqueen.sprngpod.com/barravideos/waterloo/index.m3u8")
        
        player = AVPlayer(url: url!)
        avpController.player = player
        avpController.view.frame.size.height = SuitsAVPlayerView.frame.size.height
        avpController.view.frame.size.width = SuitsAVPlayerView.frame.size.width
        self.SuitsAVPlayerView.addSubview(avpController.view)
        player.play()
    }
    override func viewWillDisappear(_ animated: Bool) {
      player.pause()
      
    }
    
    
    
}
extension SuitsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            
        return SuitsDatatitle.count
        }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = SuitsCollectionview.dequeueReusableCell(withReuseIdentifier: "SuitsCollectionViewCell", for: indexPath) as! SuitsCollectionViewCell
        
        cell.SuitsouterView.dropShadowBW()
        cell.suitsimageview.image = Suitsimage[indexPath.row]
        cell.suitsimageview.layer.cornerRadius = 7.0
        cell.suitsimageview.layer.masksToBounds = true
        cell.suitslabel.text = SuitsDatatitle[indexPath.row]
        
        return cell
    }
    

  
    
 
}
