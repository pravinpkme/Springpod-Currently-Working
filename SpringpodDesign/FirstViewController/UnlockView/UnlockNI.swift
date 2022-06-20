//
//  UnlockNI.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 16/06/22.
//

import UIKit

class UnlockNI: UINavigationItem {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var backButtonImage = UIImage(named: "Group 65-2")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)

}
}
