//
//  LoginModel.swift
//  SpringpodDesign
//
//  Created by Pravin Kumar on 13/06/22.
//

import Foundation
struct LoginModel : Encodable{
    let loginName : String
    let password : String
    
    
}

struct ResponseModel: Decodable {
    let root: [Root]
}

// MARK: - Root
struct Root: Decodable {
    let ipAddress, uniqueDeviceID, firstName, lastName: String
    let customerID, loginName, mobileNo, emailID: String
    let language, pin, areaCode, status: String
    let streetName, city, postalCode, country: String
    let province, roomNumber, checkInDate, checkOutDate: String
    let branchID: String
    let numberOfDevices: Int
    let lastSeenChannelID: String
    let lastSeenChannelTime: LastChannelTime
    let lastListenRadioChannelID, lastListenRadioChannelLanguage: String
    let lastListenRadioChannelTime: LastChannelTime
    let lastListenMalyalamRadioChannelID: String
    let lastListenMalyalamRadioChannelTime: LastChannelTime
    let lastListenEnglishRadioChannelID: String
    let lastListenEnglishRadioChannelTime: LastChannelTime
    let lastListenHindiRadioChannelID: String
    let lastListenHindiRadioChannelTime: LastChannelTime
    let token: String

    enum CodingKeys: String, CodingKey {
        case ipAddress
        case uniqueDeviceID = "uniqueDeviceId"
        case firstName, lastName
        case customerID = "customerId"
        case loginName, mobileNo
        case emailID = "emailId"
        case language
        case pin = "PIN"
        case areaCode, status, streetName, city, postalCode, country, province, roomNumber, checkInDate, checkOutDate
        case branchID = "branchId"
        case numberOfDevices
        case lastSeenChannelID = "lastSeenChannelId"
        case lastSeenChannelTime
        case lastListenRadioChannelID = "lastListenRadioChannelId"
        case lastListenRadioChannelLanguage, lastListenRadioChannelTime
        case lastListenMalyalamRadioChannelID = "lastListenMalyalamRadioChannelId"
        case lastListenMalyalamRadioChannelTime
        case lastListenEnglishRadioChannelID = "lastListenEnglishRadioChannelId"
        case lastListenEnglishRadioChannelTime
        case lastListenHindiRadioChannelID = "lastListenHindiRadioChannelId"
        case lastListenHindiRadioChannelTime, token
    }
}

// MARK: - LastChannelTime
struct LastChannelTime: Codable {
    let date: String
    let timezoneType: Int
    let timezone: String

    enum CodingKeys: String, CodingKey {
        case date
        case timezoneType = "timezone_type"
        case timezone
    }
}
