//
//  RemoteHelper.swift
//  EventApp
//
//  Created by Nitin Sakhare on 22/04/22.
//

import Foundation
import Alamofire

public enum APIRequest: URLRequestConvertible {
    
    case getProjectList
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getProjectList:
            return "project/v1/list/"
            
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
        let str = URL(string: url.appendingPathComponent(path).absoluteString.removingPercentEncoding ?? "")
        var request = URLRequest(url: str!)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = TimeInterval(10 * 1000)
        print("URL Requested is \(request), Parameters are \(parameters) and Headers are \(headers)")
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
}
