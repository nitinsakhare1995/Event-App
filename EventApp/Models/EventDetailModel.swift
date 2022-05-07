//
//  EventDetailModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import Foundation
import ObjectMapper

struct EventDetailModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : EventDetailContentModel?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct EventDetailEventtabImagesModel : Mappable {
    var event1 : [EventDetail1Model]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        event1 <- map["1"]
    }

}

struct EventDetail1Model : Mappable {
    var eventtabimg_id : String?
    var eventtabimg_description : String?
    var eventgallery_pic : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        eventtabimg_id <- map["eventtabimg_id"]
        eventtabimg_description <- map["eventtabimg_description"]
        eventgallery_pic <- map["eventgallery_pic"]
    }

}

struct EventDetailEventtabsDataModel : Mappable {
    var eventtabs_id : String?
    var eventtabs_title : String?
    var eventtabs_getinvolved : String?
    var eventtabs_description : String?
    var eventtabs_pic : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        eventtabs_id <- map["eventtabs_id"]
        eventtabs_title <- map["eventtabs_title"]
        eventtabs_getinvolved <- map["eventtabs_getinvolved"]
        eventtabs_description <- map["eventtabs_description"]
        eventtabs_pic <- map["eventtabs_pic"]
    }

}

struct EventDetail0Model : Mappable {
    var event_id : String?
    var event_title : String?
    var event_conductname : String?
    var event_date : String?
    var event_location : String?
    var event_intro : String?
    var http_url : String?
    var event_time : String?
    var event_description : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        event_id <- map["event_id"]
        event_title <- map["event_title"]
        event_conductname <- map["event_conductname"]
        event_date <- map["event_date"]
        event_location <- map["event_location"]
        event_intro <- map["event_intro"]
        http_url <- map["http_url"]
        event_time <- map["event_time"]
        event_description <- map["event_description"]
    }

}

struct EventDetailContentModel : Mappable {
    var event0 : EventDetail0Model?
    var eventtabsData : [EventDetailEventtabsDataModel]?
    var eventtabImages : EventDetailEventtabImagesModel?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        event0 <- map["0"]
        eventtabsData <- map["eventtabsData"]
        eventtabImages <- map["eventtabImages"]
    }

}
