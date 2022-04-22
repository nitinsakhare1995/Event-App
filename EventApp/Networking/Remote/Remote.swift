//
//  Remote.swift
//  EventApp
//
//  Created by Nitin Sakhare on 22/04/22.
//

import Foundation
import Alamofire
import ObjectMapper

class Remote {
    
    static let shared = Remote()
    
    private init(){}
    
    func getData(){}
    
    //    func getUserMapple(completionHandler: @escaping (_ userData: UserMappable) -> ()) {
    //
    //            guard let urlString = URL(string: userUrl) else { return }
    //
    //        AF.request(APIRequest.getProjectList).responseJSON { (responce) in
    //
    //                switch responce.result {
    //                case .success(let value):
    //                    guard let castingValue = value as? [String: Any] else { return }
    //                    guard let userData = Mapper<UserMappable>().map(JSON: castingValue) else { return }
    //                completionHandler(userData)
    //                case .failure(let error):
    //                    print(error.localizedDescription)
    //                }
    //            }
    //      }
    //
    //
    //        func getUserMapple(completionHandler: @escaping (_ dotaData: [DotaModelMapable]) -> ()) {
    //
    //            guard let urlString = URL(string: dotaUrl) else { return }
    //
    //            AF.request(urlString).responseJSON { response in
    //
    //                switch response.result {
    //                case .success(let value):
    //                    guard let dotaData = Mapper<DotaModelMapable>().mapArray(JSONObject: value) else { return }
    //                    completionHandler(dotaData)
    //                case .failure(let error):
    //                    print(error.localizedDescription)
    //                }
    //            }
    //      }
    
}
