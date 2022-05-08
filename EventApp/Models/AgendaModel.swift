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

struct AgendaDetailModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [AgendaDetailContentModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct AgendaDetailContentModel : Mappable {
    var agenda_id : String?
    var agenda_category : String?
    var agenda_date : String?
    var agenda_address : String?
    var agenda_description : String?
    var http_url : String?
    var agenda_image : String?
    var banner_img : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        agenda_id <- map["agenda_id"]
        agenda_category <- map["agenda_category"]
        agenda_date <- map["agenda_date"]
        agenda_address <- map["agenda_address"]
        agenda_description <- map["agenda_description"]
        http_url <- map["http_url"]
        agenda_image <- map["agenda_image"]
        banner_img <- map["banner_img"]
    }

}

struct SessionsModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [SessionsContentModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct SessionsContentModel : Mappable {
    var session_id : String?
    var agenda_id : String?
    var session_title : String?
    var session_time : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        session_id <- map["session_id"]
        agenda_id <- map["agenda_id"]
        session_title <- map["session_title"]
        session_time <- map["session_time"]
    }

}
