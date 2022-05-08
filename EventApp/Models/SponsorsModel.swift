//
//  SponsorsModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import Foundation
import ObjectMapper

struct SponsorsModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [SponsorsContentModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct SponsorsContentModel : Mappable {
    var sponsor_id : String?
    var name : String?
    var company_name : String?
    var sponsor_phone : String?
    var sponsor_mobile : String?
    var sponsor_email : String?
    var designation : String?
    var websitelink : String?
    var http_url : String?
    var sponsor_logo : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        sponsor_id <- map["sponsor_id"]
        name <- map["name"]
        company_name <- map["company_name"]
        sponsor_phone <- map["sponsor_phone"]
        sponsor_mobile <- map["sponsor_mobile"]
        sponsor_email <- map["sponsor_email"]
        designation <- map["designation"]
        websitelink <- map["websitelink"]
        http_url <- map["http_url"]
        sponsor_logo <- map["sponsor_logo"]
    }

}
