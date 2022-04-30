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
