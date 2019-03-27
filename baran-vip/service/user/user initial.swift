//
//  user initial.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//



import Foundation
import Moya
import DefaultsKit






enum user_Service {
    
    
    //    case getAll(user_id:Int,uuid:String,os:String,os_version:String,app_version:String,model:String,fcm_token:String,app_type:String)
    case register(phone_number:String)
    case verify(phone_number:String,code:String)
    case update_info(full_name:String?,device_type:String,ios_version:String,app_version:String,receive_notifications:Bool?,birthday:String?,notification_token:String?)
    case getinfo()
    case get_user_purchased_apps()
    case get_user_favorite_apps()
    
    
}


extension user_Service: TargetType {
    var baseURL: URL {
        return URL(string: AppSetting.sharedInstance.BaseUrl)!
    }
    
    var path: String {
        switch self {
        case .register:
            return "/user/signup"
        case .verify:
            return "/user/verify"
        case .update_info:
            return "/user/"
        case .getinfo:
            return "/user/userinfo"
        case .get_user_purchased_apps:
            return "/user/get_user_purchased_apps"
        case .get_user_favorite_apps:
            return "/user/get_user_favorite_apps"
            
            
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .register(_):
            return .post
        case .verify(_):
            return .post
        case .update_info(_):
            return .post
        case .getinfo(_):
            return .get
        case .get_user_purchased_apps(_):
            return .get
        case .get_user_favorite_apps(_):
            return .get
            
            
            
            
            
            
            
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .register(let phone_number):
            
            var Parameters =  Dictionary<String, AnyObject>()
            Parameters["phone_number"] = phone_number as AnyObject
            
            return .requestParameters(parameters: Parameters , encoding: URLEncoding.default)
            
        case .verify(let phone_number,let code):
            
            var Parameters =  Dictionary<String, AnyObject>()
            Parameters["phone_number"] = phone_number as AnyObject
            Parameters["verification_code"] = code as AnyObject
            print(Parameters)
            return .requestParameters(parameters: Parameters , encoding: URLEncoding.default)
            
        case .update_info(let full_name,let device_type,let ios_version,let app_version,let receive_notifications,let birthday,let notification_token):
            
            var Parameters =  Dictionary<String, AnyObject>()
            Parameters["full_name"] = full_name as AnyObject
            Parameters["device_model"] = device_type as AnyObject
            Parameters["ios_version"] = ios_version as AnyObject
            Parameters["app_version"] = app_version as AnyObject
            
            
            Parameters["full_name"] = full_name as AnyObject

            
            
           // let full_name_data = MultipartFormData(provider: .data(full_name!.data(using: .utf8)!), name: "full_name")
           // let device_type_data = MultipartFormData(provider: .data(device_type.data(using: .utf8)!), name: "device_model")
           // let ios_version_data = MultipartFormData(provider: .data(ios_version.data(using: .utf8)!), name: "ios_version")
            //let app_version_data = MultipartFormData(provider: .data(app_version.data(using: .utf8)!), name: "app_version")
            
            
            
            
            
            
            //var multipartData  = [full_name_data,device_type_data,ios_version_data,app_version_data]
            
            
           
            if(birthday != ""){
                
                Parameters["birthday"] = birthday as AnyObject

               
            }
            if(notification_token != ""){
                
                Parameters["push_token"] = notification_token as AnyObject

            }
            
            
            if let _receive_notifications = receive_notifications {
                Parameters["receive_notifications"] = _receive_notifications as AnyObject

            }
            return .requestParameters(parameters: Parameters , encoding: URLEncoding.default)

            
            
        case .getinfo():
            
            var Parameters =  Dictionary<String, AnyObject>()
            return .requestParameters(parameters: Parameters , encoding: URLEncoding.default)
            
        case .get_user_purchased_apps():
            
            var Parameters =  Dictionary<String, AnyObject>()
            return .requestParameters(parameters: Parameters , encoding: URLEncoding.default)
            
        case .get_user_favorite_apps():
            
            var Parameters =  Dictionary<String, AnyObject>()
            return .requestParameters(parameters: Parameters , encoding: URLEncoding.default)
            
            
        }
        
    }
    
    var headers: [String : String]? {
        switch self {
        case .register(_),.verify(_):
            
            return ["Content-Type":"application/x-www-form-urlencoded"]
        default:
            return ["Authorization": Defaults.shared.get(for: AppProperty.shared.token)!]
        }
    }
    
    
    
    
}


