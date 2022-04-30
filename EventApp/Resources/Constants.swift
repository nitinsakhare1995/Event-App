//
//  Constants.swift
//  EventApp
//
//  Created by Nitin Sakhare on 22/04/22.
//

import Foundation

enum VideoType: Int {
    case featuredVideos = 1
    case sessionVideo = 2
    case speakerVideo = 3
}

struct Constants {
    
    static let baseURL = "http://unifytrack.com/runtime_events/webservices.php"
    static let successMsg = "Success"
    static let failureMsg = "Failed"
}
