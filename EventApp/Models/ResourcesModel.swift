//
//  ResourcesModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import Foundation
import ObjectMapper

struct ResourcesModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [ResourcesContentModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }
    
}

struct ResourcesContentModel : Mappable {
    var resource_id : String?
    var resource_title : String?
    var resource_subtitle : String?
    var http_url : String?
    var resource_pdf : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        resource_id <- map["resource_id"]
        resource_title <- map["resource_title"]
        resource_subtitle <- map["resource_subtitle"]
        http_url <- map["http_url"]
        resource_pdf <- map["resource_pdf"]
    }
    
}
