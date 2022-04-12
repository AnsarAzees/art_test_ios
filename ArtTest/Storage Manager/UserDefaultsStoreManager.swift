//
//  UserDefaultsStoreManager.swift
//  photoTune
//
//  Created by Vivek S N on 01/12/21.
//

import Foundation
class UserDefaultsStoreManager {
    
    private static var loggedIn = "LoggedIn"
    private static var userDetail = "UserDetail"

    static var userData :UserModel? {
        get {
            let decoder = JSONDecoder()
            if let user = UserDefaults.standard.data(forKey: userDetail)
            {
                let userDetail = try? decoder.decode(UserModel.self, from: user)
                return userDetail
            }else{
                return nil
            }
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: userDetail)
            }
        }
    }
    
    static var isUserLoggedin:Bool{
        get{
            if let status:Bool = UserDefaults.standard.value(forKey: loggedIn) as? Bool
            {
                return status
            }
            else{
                return false
            }
        }
        set{
            UserDefaults.standard.set(newValue, forKey: loggedIn)
        }
    }
    
    
    
    static func clearData(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        UserDefaults.standard.removeObject(forKey: loggedIn)
        UserDefaults.standard.removeObject(forKey: userDetail)
    }
    
    
}
