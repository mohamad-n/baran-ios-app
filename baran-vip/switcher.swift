//
//  switcher.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//



import Foundation
import UIKit
import DefaultsKit

class Switcher {
    
    static func updateRootVC(){
        
        
        
        //        let AppDefault = Defaults.shared
        //        Defaults.shared.set(false, for: AppProperty.shared.loginStatusKey )
        // let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
        let status = Defaults.shared.get( for: AppProperty.shared.isLoggedIn )//AppProperty.sharedInstance.defaults.bool(forKey: "loginStatus")
        // print(status)
        
//        if Defaults.shared.get( for: AppProperty.shared.ignore_minor_update) == nil {
//            Defaults.shared.set(false, for: AppProperty.shared.ignore_minor_update)
//        }
        
        if(status == true){
//            vitrinApi.check_version { (Response) in
//                if let Res = Response {
//
//                    switch(Res.version){
//                    case "vpn":
//                        rootVC = VPNErrorPage()
//
//                    default :
//                        Defaults.shared.set(Res.download_link!, for: AppProperty.shared.download_link)
//
//                        let remote_version_array =  Res.version!.components(separatedBy: ".")
//                        let app_version  :String = (Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String)!
//                        let current_version_array = app_version.components(separatedBy: ".")
//                        if(current_version_array[0] < remote_version_array[0]){
//                            rootVC = majorUpDateVC()
//                        }else if(current_version_array[1] < remote_version_array[1]){
//                            rootVC = majorUpDateVC()
//                        }else if((current_version_array[2] < remote_version_array[2]) && !(Defaults.shared.get( for: AppProperty.shared.ignore_minor_update )!)){
//                            rootVC = minorUpDateVC()
//
//                        }else{
//                            notif_Api.add_token(token: Defaults.shared.get( for: AppProperty.shared.push_token )!) { (Response) in
//                                print(Response?.message)
//
//                            }
//                            rootVC = mainView()
//                        }
//                    }
//
//                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                    appDelegate.window?.rootViewController = rootVC
//                }
//            }
            rootVC = mainView()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootVC
            //            print(status)
            //            rootVC = loginView()
            
            
            
            
            
        }else{
//            Defaults.shared.set(false, for: AppProperty.shared.user_has_credit)
//            let secret = "rD0?$kzBO^mK9e+@LJl4ERH2QbLDhd$bo^MAiDL31QR&!wS+ibjX!86MHIuJiHf__Sah0!4KihjQ6bcRtoL2*hS125!t^vi0J!!fj2XA%8lXr_1A79oUc-?ixXlc|4"
//            let jwt = JWT.encode(claims: ["user_type": "web_agent"], algorithm: .hs256(secret.data(using: .utf8)!))
//            Defaults.shared.set(jwt, for: AppProperty.shared.token )
//            
//            
             rootVC = UINavigationController(rootViewController:registerVC())
           
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootVC
        }
        
        
        
        
    }
    
}
