//
//  BlogModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import Foundation
import ObjectMapper

struct BlogModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [BlogContentModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct BlogContentModel : Mappable {
    var blog_id : String?
    var blog_topic : String?
    var blog_category : String?
    var blog_date : String?
    var blog_time : String?
    var http_url : String?
    var blog_image : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        blog_id <- map["blog_id"]
        blog_topic <- map["blog_topic"]
        blog_category <- map["blog_category"]
        blog_date <- map["blog_date"]
        blog_time <- map["blog_time"]
        http_url <- map["http_url"]
        blog_image <- map["blog_image"]
    }

}

struct BlogDetailModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [BlogDetailContentModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct BlogDetailContentModel : Mappable {
    var blog_id : String?
    var blog_topic : String?
    var blog_author : String?
    var blog_category : String?
    var blog_date : String?
    var blog_time : String?
    var blog_intro : String?
    var blog_description : String?
    var http_url : String?
    var blog_image : String?
    var banner_img : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        blog_id <- map["blog_id"]
        blog_topic <- map["blog_topic"]
        blog_author <- map["blog_author"]
        blog_category <- map["blog_category"]
        blog_date <- map["blog_date"]
        blog_time <- map["blog_time"]
        blog_intro <- map["blog_intro"]
        blog_description <- map["blog_description"]
        http_url <- map["http_url"]
        blog_image <- map["blog_image"]
        banner_img <- map["banner_img"]
    }

}
