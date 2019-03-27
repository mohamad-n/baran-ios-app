//
//  Base Provider.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//


import Foundation
import Moya
import SwiftyJSON

import Alamofire

class DefaultAlamofireManager: Alamofire.SessionManager {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 5 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 5 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}


open class BaseProvider<Target>: MoyaProvider<Target> where Target: TargetType {
    
    override open func request(_ target: Target, callbackQueue: DispatchQueue? = .none, progress: Moya.ProgressBlock? = .none, completion: @escaping Moya.Completion) -> Cancellable {
        
        //        AlertManager.activateLoader(status: true)
        
        let loader_view = LoaderView()
        loader_view.show()
        
        return super.request(target){ result in
            
            switch result {
            case .success(let response):print(response)
            
            loader_view.dismiss()
            
            
            switch JSON(response.data)["status"].bool {
            case false :
                
                completion(result)
            case true :
                
                completion(result)
                
            default :
                
                AlertManager.ErrorAlert(title: "اشکال", subtitle: "اشکال در اتصال", button: "متوجه شدم")
                
                print(result)
                
                }
                
            case .failure(let error):print(error)
            loader_view.dismiss()
            
            AlertManager.ErrorAlert(title: "اشکال", subtitle: "اشکال در اتصال", button: "متوجه شدم")
            print("error in connection moya")
                
            default :
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
                    loader_view.dismiss()
                })
            }
        }
        
    }
    
    
}

