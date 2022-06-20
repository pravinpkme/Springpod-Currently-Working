//
//  MainTabbarController.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 20/06/22.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let tabBarItem1 = self.tabBarController?.tabBar.items?[0] {
            tabBarItem1.title = ""
            tabBarItem1.image = UIImage(named :"Group 38 (5)")
            tabBarItem1.selectedImage = UIImage(named : "Group 28")

        }
        if let tabBarItem2 = self.tabBarController?.tabBar.items?[1] {
            tabBarItem2.title = ""
            tabBarItem2.image = UIImage(named : "bell")
            tabBarItem2.selectedImage = UIImage(named : "Group 34")
        }
       
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
