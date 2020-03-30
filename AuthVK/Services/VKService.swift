//
//  VKService.swift
//  AuthVK
//
//  Created by Фарид Гулиев on 26.03.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import Foundation
import SwiftyVK

class VKService {
    
    typealias completion = (Decodable?) -> ()
    let jsonService = JSONParser()
    
    //Auth
    func auth(completion: @escaping ([String: String]?, VKError?) -> ()) {
        VK.sessions.default.logIn(onSuccess: { completion($0, nil) }) { completion(nil, $0) }
    }
    
    //Get current user name
    func getUsers(completion: @escaping completion) {
        VK.API.Account.getProfileInfo(.empty)
            .onSuccess({ (data) in
                 completion(self.jsonService.parse(type: .user, data: data))
            })
            .onError { _ in completion(nil) }
        .send()
    }
    
    //Get 5 friends current user
    func getFriends(completion: @escaping completion) {
        let parameters: [Parameter: String] = [.order: "hints", .count: "5", .fields: "nickname"]
        VK.API.Friends.get(parameters)
            .onSuccess({ (data) in
                completion(self.jsonService.parse(type: .friends, data: data))
            })
            .onError { _ in completion(nil) }
        .send()
    }
}
