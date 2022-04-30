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
    
    func getSpeakersList(completionHandler: @escaping (_ userData: SpeakerModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getSpeakersList).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<SpeakerModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func registerUser(userName: String, password: String, email: String, completionHandler: @escaping (_ userData: LoginModel) -> ()) {
        showLoader()
        AF.request(APIRequest.registerUser(userName: userName, password: password, email: email)).responseJSON { (response) in
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
    
    func verifyOtp(userId: Int, otp: String, completionHandler: @escaping (_ userData: LoginModel) -> ()) {
        showLoader()
        AF.request(APIRequest.verifyOtp(userId: userId, otp: otp)).responseJSON { (response) in
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
    
    func getVideoList(id: Int, completionHandler: @escaping (_ userData: VideoModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getVideoList(id: id)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<VideoModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func forgotPassword(email: String, completionHandler: @escaping (_ userData: LoginStrModel) -> ()) {
        showLoader()
        AF.request(APIRequest.forgotPassword(email: email)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<LoginStrModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func resetPassword(password: String, userId: Int, completionHandler: @escaping (_ userData: LoginStrModel) -> ()) {
        showLoader()
        AF.request(APIRequest.resetPassword(password: password, userId: userId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<LoginStrModel>().map(JSON: castingValue) else { return }
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
