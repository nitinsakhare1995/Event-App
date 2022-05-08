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
    case verifyOtp(userId: Int, otp: String)
    case getVideoList(id: Int)
    case forgotPassword(email: String)
    case resetPassword(password: String, userId: Int)
    case getEventgDetails(eventId: Int)
    case getAgendaList(eventId: Int)
    case getBlogs
    case getBlogDetails(blogId: String)
    case getResources
    
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
