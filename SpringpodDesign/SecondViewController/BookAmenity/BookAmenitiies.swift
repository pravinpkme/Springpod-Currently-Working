//
//  BookAmenitiies.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 18/05/22.
//

import UIKit
import AVKit
import AVFoundation

class BookAmenitiesViewController: UIViewController{
    
    @IBOutlet weak var BookAnemityAvPlayer: UIView!
    
    @IBOutlet weak var BookAmenitiesCollectionview: UICollectionView!
    
    var player : AVPlayer!
    var avpController =  AVPlayerViewController()

    
    let BookAmenitiesimage = [#imageLiteral(resourceName: "istockphoto-1213615970-612x612") , #imageLiteral(resourceName: "How to Create the Ultimate Guest Suite in Your Home") , #imageLiteral(resourceName: "SALA-POLIVALENTE_KM429_HD_Davide-Galli-Photogrpher_001") , #imageLiteral(resourceName: "Screen-Shot-2019-03-07-at-4.01.10-PM")  , #imageLiteral(resourceName: "b697b337caa2e19e7646d0aa73e1bb06")]
    
    let BookAmenitiesDatatitle = ["Gym","Guest Suite","Multi Purpose hall", "Dog Wash Station", "BBQ Area"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BookAmenitiesCollectionview.delegate = self
        BookAmenitiesCollectionview.dataSource = self
        startVideo()
        BookAnemityAvPlayer.layer.cornerRadius = 15
        BookAnemityAvPlayer.clipsToBounds = true
        
        
        
        var backButtonImage = UIImage(named: "Group 65-4")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)

        
        
        
        
    }

    
    func startVideo(){
        
        let url = URL(string: "http://barraonqueen.sprngpod.com/barravideos/waterloo/index.m3u8")
        
        player = AVPlayer(url: url!)
        avpController.player = player
        avpController.view.frame.size.height = BookAnemityAvPlayer.frame.size.height
        avpController.view.frame.size.width = BookAnemityAvPlayer.frame.size.width
        self.BookAnemityAvPlayer.addSubview(avpController.view)
        player.play()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
      player.pause()
      
    }
    
    @IBAction func homeButtonPressed(_ sender: Any) {
        
        
        self.navigationController?.popToRootViewController(animated: true)

    }
}
extension BookAmenitiesViewController : UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            
        return 5
        }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = BookAmenitiesCollectionview.dequeueReusableCell(withReuseIdentifier: "BookAmenitiesCollectionViewCell", for: indexPath) as! BookAmenitiesCollectionViewCell
        
        cell.borderView.dropShadowBW()
        cell.imageview.image = BookAmenitiesimage[indexPath.row]
        cell.imageview.layer.cornerRadius = 7.0
        cell.imageview.layer.masksToBounds = true
        cell.label.text = BookAmenitiesDatatitle[indexPath.row]
        
        return cell
    }
    

  
    
 
}
extension UIView {
    func dropShadowBW(scale: Bool = true) {
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.01
        layer.shadowRadius = 3.0
    }
}
