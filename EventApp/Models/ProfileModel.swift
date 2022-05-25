//
//  ProfileModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 21/05/22.
//

import Foundation
import ObjectMapper

struct ProfileModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [ProfileContentModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }
    
}

struct ProfileContentModel : Mappable {
    var userregid : String?
    var fullname : String?
    var gender : String?
    var mobile : String?
    var email_id : String?
    var address : String?
    var http_url : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        userregid <- map["userregid"]
        fullname <- map["fullname"]
        gender <- map["gender"]
        mobile <- map["mobile"]
        email_id <- map["email_id"]
        address <- map["address"]
        http_url <- map["http_url"]
    }
    
}
