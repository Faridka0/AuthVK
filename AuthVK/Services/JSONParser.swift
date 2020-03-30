//
//  JSONParser.swift
//  AuthVK
//
//  Created by Фарид Гулиев on 26.03.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import Foundation



class JSONParser {
    
    enum JSONType {
        case user, friends
    }
    
    func parse(type: JSONType, data: Data) -> Decodable? {
        do {
            let decoder = JSONDecoder()
            if type == .user {
                return try decoder.decode(User.self, from: data)
            } else {
               return try decoder.decode(Friends.self, from: data)
            }
            
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
