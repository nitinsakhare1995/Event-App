//
//  SessionsModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 31/05/22.
//

import Foundation
import ObjectMapper

struct SessionsReminderModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [SessionsReminderContentModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct SessionsReminderContentModel : Mappable {
    var userregid : String?
    var sessionid : String?
    var session_title : String?
    var session_time : String?
    var speakerid : String?
    var speaker_name : String?
    var speaker_designation : String?
    var profile_pic : String?
    var http_url : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        userregid <- map["userregid"]
        sessionid <- map["sessionid"]
        session_title <- map["session_title"]
        session_time <- map["session_time"]
        speakerid <- map["speakerid"]
        speaker_name <- map["speaker_name"]
        speaker_designation <- map["speaker_designation"]
        profile_pic <- map["profile_pic"]
        http_url <- map["http_url"]
    }

}
