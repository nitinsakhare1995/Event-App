//
//  AgendaModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import Foundation
import ObjectMapper

struct AgendaModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [AgendaContentModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct AgendaContentModel : Mappable {
    var agenda_id : String?
    var agenda_category : String?
    var agenda_date : String?
    var http_url : String?
    var agenda_image : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        agenda_id <- map["agenda_id"]
        agenda_category <- map["agenda_category"]
        agenda_date <- map["agenda_date"]
        http_url <- map["http_url"]
        agenda_image <- map["agenda_image"]
    }

}
