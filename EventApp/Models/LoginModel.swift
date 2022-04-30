//
//  LoginModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import Foundation
import ObjectMapper

struct LoginModel : Mappable {
    var requestStatus : String?
    var msg : String?
    var error : String?
    var content : [LoginContentModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        requestStatus <- map["requestStatus"]
        msg <- map["msg"]
        error <- map["Error"]
        content <- map["Content"]
    }
    
}

struct LoginContentModel : Mappable {
    var userregid : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        userregid <- map["userregid"]
    }

}

struct LoginStrModel : Mappable {
    var requestStatus : String?
    var msg : String?
    var error : String?
    var content : [LoginStrContentModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        requestStatus <- map["requestStatus"]
        msg <- map["msg"]
        error <- map["Error"]
        content <- map["Content"]
    }
    
}

struct LoginStrContentModel : Mappable {
    var userregid : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        userregid <- map["userregid"]
    }

}


