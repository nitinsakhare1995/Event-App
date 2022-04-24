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
    
    func login(email: String, password: String, completionHandler: @escaping (_ userData: LoginModel) -> ()) {
        showLoader()
        AF.request(APIRequest.login(email: email, password: password)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<LoginModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
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
