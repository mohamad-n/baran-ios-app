//
//  user method.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//



import Foundation
import SwiftyJSON
import Moya
import Moya_ObjectMapper
import ObjectMapper


struct user_register_result {
    var status : Bool?
    var message : String?
}


class user_Api {
    
    static func register(phone_number:String, completionHandler : @escaping ((_ Response : user_register_result?) -> Void)) {
        
        
        let provider = BaseProvider<user_Service>()//(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.register(phone_number:phone_number), completion: { result in
            
            
            switch result {
            case let .success(response):
                do {
                    
                    var response_result = user_register_result()
                    
                    //                                                            print("method",JSON(response.data))
                    
                    //                    if(JSON(response.data)["status"].bool! == true){
                    //                        print("method",JSON(response.data)["status"].bool!)
                    response_result.status = JSON(response.data)["status"].boolValue
                    response_result.message = JSON(response.data)["message"].stringValue
                    
                    
                    
                    
                    
                    
                    
                    completionHandler(response_result)
                    
                }
                catch {
                    print("Error")
                }
            case let .failure(error):
                
                guard let error = error as? CustomStringConvertible else {
                    break
                }
                
            }
        })
    }
    
    struct code_verify_response {
        var user : userModel?
        var status : Bool?
        var message : String?
    }
    
    static func verify(phone_number:String,code:String, completionHandler : @escaping ((_ Response : code_verify_response?) -> Void)) {
        
        
        let provider = BaseProvider<user_Service>()
        provider.request(.verify(phone_number:phone_number,code:code), completion: { result in
            
            
            switch result {
            case let .success(response):
                do {
                    
                    var response_result = code_verify_response()
                    print("result",JSON(response.data))
                    
                    response_result.status = JSON(response.data)["status"].boolValue
                    response_result.message = JSON(response.data)["message"].stringValue
                    
                    if(JSON(response.data)["status"].bool! == true){
                        //                        print("method",JSON(response.data)["status"].bool!)
                        
                        let user_result = JSON(response.data)["result"]
                        
                        response_result.user = Mapper<userModel>().map(JSONString: user_result.rawString()!)!
                        
                        
                        
                        
                        
                        
                        completionHandler(response_result)
                    }else{
                        
                        completionHandler(response_result)
                    }
                }
                catch {
                    print("Error")
                }
            case let .failure(error):
                
                guard let error = error as? CustomStringConvertible else {
                    break
                }
                
            }
        })
    }
    
    static func getinfo( completionHandler : @escaping ((_ Response : userModel?) -> Void)) {
        
        
        let provider = BaseProvider<user_Service>()
        provider.request(.getinfo(), completion: { result in
            
            
            switch result {
            case let .success(response):
                do {
                    
                    var user = userModel()
                    print("result",JSON(response.data))
                    
                    if(JSON(response.data)["status"].bool! == true){
                        //                        print("method",JSON(response.data)["status"].bool!)
                        
                        let user_result = JSON(response.data)["result"]
                        
                        user = Mapper<userModel>().map(JSONString: user_result.rawString()!)!
                        
                        
                        
                        
                        
                        
                        completionHandler(user)
                    }else{
                        completionHandler(user)
                    }
                }
                catch {
                    print("Error")
                }
            case let .failure(error):
                
                guard let error = error as? CustomStringConvertible else {
                    break
                }
                
            }
        })
    }
    
    static func update_info(full_name:String?,device_type:String,ios_version:String,app_version:String,receive_notifications:Bool?,birthday:String?="",notification_token:String?="", completionHandler : @escaping ((_ Response : code_verify_response?) -> Void)) {
        
        
        let provider = BaseProvider<user_Service>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.update_info(full_name:full_name,device_type:device_type,ios_version:ios_version,app_version:app_version,receive_notifications:receive_notifications,birthday:birthday,notification_token:notification_token), completion: { result in
            
            
            switch result {
            case let .success(response):
                do {
                    
                    var response_result = code_verify_response()
                    print("result",JSON(response.data))
                    
                    response_result.status = JSON(response.data)["status"].boolValue
                    response_result.message = JSON(response.data)["message"].stringValue
                    
                    if(JSON(response.data)["status"].bool! == true){
                        //                        print("method",JSON(response.data)["status"].bool!)
                        let user_result = JSON(response.data)["result"]
                        response_result.user = Mapper<userModel>().map(JSONString: user_result.rawString()!)!
                        
                        completionHandler(response_result)
                    }else{
                        completionHandler(response_result)
                    }
                }
                catch {
                    print("Error")
                }
            case let .failure(error):
                
                guard let error = error as? CustomStringConvertible else {
                    break
                }
                
            }
        })
    }
    
    
    
    
    
    
    
    
    
    
    
}
