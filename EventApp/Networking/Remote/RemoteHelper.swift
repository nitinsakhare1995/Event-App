//
//  RemoteHelper.swift
//  EventApp
//
//  Created by Nitin Sakhare on 22/04/22.
//

import Foundation
import Alamofire

public enum APIRequest: URLRequestConvertible {
    
    case login(email: String, password: String)
    case getSpeakersList
    case registerUser(userName: String, password: String, email: String)
    case verifyOtp(userId: String, otp: String)
    case getVideoList(id: Int)
    case forgotPassword(email: String)
    case resetPassword(password: String, userId: String)
    case getEventgDetails(eventId: Int)
    case getAgendaList(eventId: Int)
    case getBlogs
    case getBlogDetails(blogId: String)
    case getResources
    case getSponsors
    case getAgendaDetail(eventId: String, agendaId: String)
    case getSessions(agendaId: String)
    case getMapDetails(eventId: String, agendaId: String)
    case getSpeakerDetails(speakerId: String)
    case getEventList
    case getProfile(userId: String)
    case getNotifications
    case saveVideo(userId: String)
    case saveResource(userId: String)
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .login(let email, let password):
            return "?reqAction=login&userregid=2&email=\(email)&pass=\(password)"
        case .getSpeakersList:
            return "?reqAction=speakers"
        case .registerUser(let userName, let password, let email):
            return "?reqAction=signup&name=\(userName)&email_id=\(email)&password=\(password)"
        case .verifyOtp(let userId, let otp):
            return "?reqAction=userchkotp&userregid=\(userId)&otp=\(otp)"
        case .getVideoList(let id):
            return "?reqAction=videos&videotypeid=\(id)"
        case .forgotPassword(let email):
            return "?reqAction=forgotpwd&email=\(email)"
        case .resetPassword(let password, let userId):
            return "?reqAction=changepwd&userregid=\(userId)&oldpwd=\(password)&newpwd=\(password)"
        case .getEventgDetails(let eventId):
            return "?reqAction=eventdetail&eventid=\(eventId)"
        case .getAgendaList(let eventId):
            return "?reqAction=agendacat&eventid=\(eventId)"
        case .getBlogs:
            return "?reqAction=blogs"
        case .getBlogDetails(let blogId):
            return "?reqAction=blogdetail&blogid=\(blogId)"
        case .getResources:
            return "?reqAction=resources"
        case .getSponsors:
            return "?reqAction=sponsors"
        case .getAgendaDetail(let eventId, let agendaId):
            return "?reqAction=agendadetail&agendaid=\(agendaId)&eventid=\(eventId)"
        case .getSessions(let agendaId):
            return "?reqAction=agendasession&agendaid=\(agendaId)"
        case .getMapDetails(let eventId, let agendaId):
            return "?reqAction=agendanavigation&agendaid=\(agendaId)&eventid=\(eventId)"
        case .getSpeakerDetails(let speakerId):
            return "?reqAction=speakerdetail&speakerid=\(speakerId)"
        case .getEventList:
            return "?reqAction=events"
        case .getProfile(let userId):
            return "?reqAction=userprofile&userregid=\(userId)"
        case .getNotifications:
            return "?reqAction=notification"
        case .saveVideo(let userId):
            return "?reqAction=savedvideos&userregid=\(userId)"
        case .saveResource(let userId):
            return "?reqAction=savedresources&userregid=\(userId)"
        }
    }
    
    var parameters: Parameters {
        switch self {
        default:
            return [:]
        }
    }
    
    var headers: [String: String] {
        switch self {
        default:
            return [:]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL()
        var urlPath = url.appendingPathComponent(path).absoluteString.removingPercentEncoding ?? ""
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let str = URL(string: urlPath)
        var request = URLRequest(url: str!)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = TimeInterval(10 * 1000)
        print("URL Requested is \(request), Parameters are \(parameters) and Headers are \(headers)")
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
}
