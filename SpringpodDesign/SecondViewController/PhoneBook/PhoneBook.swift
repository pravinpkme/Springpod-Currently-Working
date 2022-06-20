//
//  PhoneBook.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 17/05/22.
//


import UIKit

class PhoneBookmainVC: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var contactSearchBar: UISearchBar!
    
    @IBOutlet weak var PhoneTablevIew: UITableView!
    let mydata = ["Tiara D' Souza", "Reena D'Souza", "Joe Frank", "Simon Sinek", "Frieda Jane", "JamesBay", "Darla Sanchez"]
    var FilteredData: [String]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactSearchBar.delegate = self
        PhoneTablevIew.delegate = self
        PhoneTablevIew.dataSource = self
        
        
        FilteredData = mydata
        
        var backButtonImage = UIImage(named: "Group 65-1")
        backButtonImage = backButtonImage?.stretchableImage(withLeftCapWidth: 15, topCapHeight: 30)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
    }
   
   
    @IBAction func homeButtonPressed(_ sender: Any) {
        
        
        self.navigationController?.popToRootViewController(animated: true)

    }
}
    
extension PhoneBookmainVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        FilteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PhoneTablevIew.dequeueReusableCell(withIdentifier: "PhoneTableViewCell") as! PhoneTableViewCell
        
        cell.phoneContactName.text = FilteredData[indexPath.row]
        cell.phoneOuterView.layer.cornerRadius = 10.0
        cell.phoneOuterView.layer.masksToBounds = true
        cell.PhoneInnerView.dropShadow()
        
        
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        FilteredData = []
        if searchText == ""
        {
            FilteredData = mydata
        }else {
            for x in mydata {
                if x.lowercased().contains(searchText.lowercased()){
                    FilteredData.append(x)
                }
            }
        }
        self.PhoneTablevIew.reloadData()
    }
    
}
extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.01
        layer.shadowRadius = 3.0
    }
}
