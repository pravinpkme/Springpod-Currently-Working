//
//  LoginExtension.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 13/06/22.
//

import Foundation
import UIKit

extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}



extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

extension Dictionary where Dictionary == JSON {
    func array<T>(_ key : String) -> [T]{
        return self[key] as? [T] ?? [T]()
    }
    func array(_ key : String) -> [JSON]{
        return self[key] as? [JSON] ?? [JSON]()
    }
    func json(_ key : String) -> JSON{
        return self[key] as? JSON ?? JSON()
    }
     func string(_ key : String)-> String{
     // return self[key] as? String ?? String()
         let value = self[key]
         if let str = value as? String{
            return str
         }else if let int = value as? Int{
            return int.description
         }else if let double = value as? Double{
            return double.description
         }else{
            return String()
         }
     }
     func int(_ key : String)-> Int{
         //return self[key] as? Int ?? Int()
         let value = self[key]
         if let str = value as? String{
            return Int(str) ?? Int()
         }else if let int = value as? Int{
            return int
         }else if let double = value as? Double{
            return Int(double)
         }else{
            return Int()
         }
     }
     func double(_ key : String)-> Double{
     //return self[key] as? Double ?? Double()
         let value = self[key]
         if let str = value as? String{
            return Double(str) ?? Double()
         }else if let int = value as? Int{
            return Double(int)
         }else if let double = value as? Double{
            return double
         }else{
            return Double()
         }
     }
    
    func bool(_ key : String) -> Bool{
        let value = self[key]
        if let bool = value as? Bool{
            return bool
        }else if let int = value as? Int{
            return int == 1
        }else if let str = value as? String{
            return ["1","true"].contains(str)
        }else{
            return Bool()
        }
    }
    //        paramDict["location"] = "\(currentLat),\(currentLong)"
    //        paramDict["radius"] = radius
    //        paramDict["types"] = inputText
    //        paramDict["sensor"] = "true"
}

extension UITextField {
    
    func MakeSemiTransparent(){
        
        self.backgroundColor = UIColor.black
        self.alpha = 0.5
        
    }
}

extension UILabel{
    func MakeLableSemiTransaprent(){
        
        self.backgroundColor = UIColor.black
        self.alpha = 0.5
        
        
        
    }
    
}
