//
//  NotificationModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 25/05/22.
//

import Foundation
import ObjectMapper

struct NotificationModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [NotificationContentModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct NotificationContentModel : Mappable {
    var notification_id : String?
    var notification_title : String?
    var notification_subtitle : String?
    var notification_section : String?
    var notification_sectionid : String?
    var start_date : String?
    var end_date : String?
    var start_time : String?
    var end_time : String?
    var time_ago : String?
    var notification_disable : String?
    var notification_remark : String?
    var http_url : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        notification_id <- map["notification_id"]
        notification_title <- map["notification_title"]
        notification_subtitle <- map["notification_subtitle"]
        notification_section <- map["notification_section"]
        notification_sectionid <- map["notification_sectionid"]
        start_date <- map["start_date"]
        end_date <- map["end_date"]
        start_time <- map["start_time"]
        end_time <- map["end_time"]
        time_ago <- map["time_ago"]
        notification_disable <- map["notification_disable"]
        notification_remark <- map["notification_remark"]
        http_url <- map["http_url"]
    }

}
