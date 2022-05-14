//
//  SpeakersModel.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import Foundation
import ObjectMapper

struct SpeakerModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [SpeakerContentModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }
    
}

struct SpeakerContentModel : Mappable {
    var speaker_id : String?
    var name : String?
    var company_name : String?
    var speaker_phone : String?
    var speaker_mobile : String?
    var speaker_email : String?
    var designation : String?
    var profile_pic : String?
    var http_url : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        speaker_id <- map["speaker_id"]
        name <- map["name"]
        company_name <- map["company_name"]
        speaker_phone <- map["speaker_phone"]
        speaker_mobile <- map["speaker_mobile"]
        speaker_email <- map["speaker_email"]
        designation <- map["designation"]
        profile_pic <- map["profile_pic"]
        http_url <- map["http_url"]
    }
    
}

struct SpeakerDetailModel : Mappable {
    var requestStatus : String?
    var error : String?
    var content : [SpeakerDetailContentModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        requestStatus <- map["requestStatus"]
        error <- map["Error"]
        content <- map["Content"]
    }

}

struct SpeakerDetailContentModel : Mappable {
    var speaker_id : String?
    var name : String?
    var company_name : String?
    var speaker_gender : String?
    var speaker_phone : String?
    var speaker_mobile : String?
    var speaker_email : String?
    var speaker_profession : String?
    var speaker_address : String?
    var speaker_linkedin : String?
    var speaker_facebook : String?
    var speaker_twitter : String?
    var speaker_websitelink : String?
    var http_url : String?
    var profile_pic : String?
    var banner_img : String?
    var speaker_description : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        speaker_id <- map["speaker_id"]
        name <- map["name"]
        company_name <- map["company_name"]
        speaker_gender <- map["speaker_gender"]
        speaker_phone <- map["speaker_phone"]
        speaker_mobile <- map["speaker_mobile"]
        speaker_email <- map["speaker_email"]
        speaker_profession <- map["speaker_profession"]
        speaker_address <- map["speaker_address"]
        speaker_linkedin <- map["speaker_linkedin"]
        speaker_facebook <- map["speaker_facebook"]
        speaker_twitter <- map["speaker_twitter"]
        speaker_websitelink <- map["speaker_websitelink"]
        http_url <- map["http_url"]
        profile_pic <- map["profile_pic"]
        banner_img <- map["banner_img"]
        speaker_description <- map["speaker_description"]
    }

}
