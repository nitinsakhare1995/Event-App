//
//  VideoModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 30/04/22.
//

import Foundation
import ObjectMapper

struct VideoModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [VideoContentModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct VideoContentModel : Mappable {
    var video_id : String?
    var video_type : String?
    var video_title : String?
    var video_url : String?
    var http_url : String?
    var video_thumbnail : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        video_id <- map["video_id"]
        video_type <- map["video_type"]
        video_title <- map["video_title"]
        video_url <- map["video_url"]
        http_url <- map["http_url"]
        video_thumbnail <- map["video_thumbnail"]
    }

}

