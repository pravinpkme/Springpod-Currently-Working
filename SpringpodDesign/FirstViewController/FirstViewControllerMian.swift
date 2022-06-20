//
//  ViewController.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 17/05/22.
//

import UIKit


class FirstViewController: UIViewController {
    
    var delegate: DataDelegate?
    
    
    
    
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var Hi_Label: UILabel!
    @IBOutlet weak var GreetingLabel: UILabel!
    
    
    @IBOutlet weak var FVBannerImage: UIImageView!
    
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

       swipeRecognizer()
    ViewDropShadow()
        greetingLogic()
        FVBannerImage.clipsToBounds = true
        FVBannerImage.layer.cornerRadius = 15
        delegate?.printThisString(String: "What the fuck")
    
        
        
    }
    
    
    
    
    
    func greetingLogic() -> String {
      let hour = Calendar.current.component(.hour, from: Date())
      
     
        
      let NEW_DAY = 0
      let NOON = 12
      let SUNSET = 18
      let MIDNIGHT = 24
      
      var greetingText = "Hello" // Default greeting text
      switch hour {
      case NEW_DAY..<NOON:
          GreetingLabel.text = "Good Morning "
      case NOON..<SUNSET:
          GreetingLabel.text = "Good Afternoon"
      case SUNSET..<MIDNIGHT:
          GreetingLabel.text = "Good Evening"
      default:
          _ = "Hello"
      }
      
      return greetingText
    }
    
    
    
    
    func ViewDropShadow(){
        view1.fvdropShadow()
        view2.fvdropShadow()
        view3.fvdropShadow()
        view4.fvdropShadow()
        view5.fvdropShadow()
        view6.fvdropShadow()
    }
    
    func swipeRecognizer(){
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

extension UIView {
    func fvdropShadow(scale: Bool = true) {
        layer.cornerRadius = 8
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.05
        layer.shadowRadius = 3.0
    }
    
    
}



