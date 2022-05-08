//
//  MapDetailModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import Foundation
import ObjectMapper

struct MapDetailModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : MapDetailContentModel?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct MapDetailContentModel : Mappable {
    var map0 : MapDetail0Model?
    var galleryImages : [MapDetailGalleryImagesModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        map0 <- map["0"]
        galleryImages <- map["galleryImages"]
    }

}

struct MapDetail0Model : Mappable {
    var agenda_id : String?
    var agenda_category : String?
    var agenda_date : String?
    var agenda_address : String?
    var agenda_map : String?
    var agenda_phone : String?
    var agenda_websiteurl : String?
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
        agenda_map <- map["agenda_map"]
        agenda_phone <- map["agenda_phone"]
        agenda_websiteurl <- map["agenda_websiteurl"]
        agenda_description <- map["agenda_description"]
        http_url <- map["http_url"]
        agenda_image <- map["agenda_image"]
        banner_img <- map["banner_img"]
    }

}

struct MapDetailGalleryImagesModel : Mappable {
    var image_id : String?
    var image_description : String?
    var gallery_img : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        image_id <- map["image_id"]
        image_description <- map["image_description"]
        gallery_img <- map["gallery_img"]
    }

}
