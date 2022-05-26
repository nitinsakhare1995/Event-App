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
    
    func verifyOtp(userId: String, otp: String, completionHandler: @escaping (_ userData: LoginModel) -> ()) {
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
    
    func resetPassword(password: String, userId: String, completionHandler: @escaping (_ userData: LoginStrModel) -> ()) {
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
    
    func getEventDetails(eventId: Int, completionHandler: @escaping (_ userData: EventDetailModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getEventgDetails(eventId: eventId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<EventDetailModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getAgendaList(eventId: Int, completionHandler: @escaping (_ userData: AgendaModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getAgendaList(eventId: eventId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<AgendaModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getBlogs(completionHandler: @escaping (_ userData: BlogModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getBlogs).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<BlogModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getBlogDetail(blogId: String, completionHandler: @escaping (_ userData: BlogDetailModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getBlogDetails(blogId: blogId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<BlogDetailModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getResources(completionHandler: @escaping (_ userData: ResourcesModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getResources).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<ResourcesModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getSponsors(completionHandler: @escaping (_ userData: SponsorsModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getSponsors).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<SponsorsModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getAgendaDetails(eventId: String, agendaId: String, completionHandler: @escaping (_ userData: AgendaDetailModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getAgendaDetail(eventId: eventId, agendaId: agendaId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<AgendaDetailModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getSessions(agendaId: String, completionHandler: @escaping (_ userData: SessionsModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getSessions(agendaId: agendaId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<SessionsModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getMapDetails(eventId: String, agendaId: String, completionHandler: @escaping (_ userData: MapDetailModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getMapDetails(eventId: eventId, agendaId: agendaId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<MapDetailModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getSpeakerDetails(speakerId: String, completionHandler: @escaping (_ userData: SpeakerDetailModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getSpeakerDetails(speakerId: speakerId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<SpeakerDetailModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getEventList(completionHandler: @escaping (_ userData: EventModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getEventList).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<EventModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getProfileData(userId: String, completionHandler: @escaping (_ userData: ProfileModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getProfile(userId: userId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<ProfileModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getNotifictions(completionHandler: @escaping (_ userData: NotificationModel) -> ()) {
        showLoader()
        AF.request(APIRequest.getNotifications).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<NotificationModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func saveVideo(userId: String, completionHandler: @escaping (_ userData: NotificationModel) -> ()) {
        showLoader()
        AF.request(APIRequest.saveVideo(userId: userId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<NotificationModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func saveResource(userId: String, completionHandler: @escaping (_ userData: NotificationModel) -> ()) {
        showLoader()
        AF.request(APIRequest.saveResource(userId: userId)).responseJSON { (response) in
            hideLoader()
            switch response.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let userData = Mapper<NotificationModel>().map(JSON: castingValue) else { return }
                completionHandler(userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
