//
//  SecondViewControllerMain.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 17/05/22.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var SVImageVIew: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ViewDropShadow()
        SwipeIndicator()
        
        SVImageVIew.clipsToBounds = true
        SVImageVIew.layer.cornerRadius = 15
        
        
    }
    
    
    func ViewDropShadow(){
        view1.fvdropShadow()
        view2.fvdropShadow()
        view3.fvdropShadow()
        view5.fvdropShadow()
        view6.fvdropShadow()
        view7.fvdropShadow()
        
    }
    
    
    func SwipeIndicator (){
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
            leftSwipe.direction = .left
            rightSwipe.direction = .right
            self.view.addGestureRecognizer(leftSwipe)
            self.view.addGestureRecognizer(rightSwipe)
        
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if sender.direction == .left {
            self.tabBarController!.selectedIndex += 1
        }
        if sender.direction == .right {
            self.tabBarController!.selectedIndex -= 1
        }
    }

}
