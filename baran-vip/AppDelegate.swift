//
//  AppDelegate.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//

import UIKit
import DefaultsKit
import IQKeyboardManagerSwift
//import FLEX
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?

    override init() {
        super.init()
        UIFont.overrideInitialize()
    }

    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        
        
        
        Switcher.updateRootVC()
        
        if let font16 = UIFont(name: "IRANYekanMobile", size: 16) {
            //            let fontAttributes = [
            //            NSAttributedStringKey.foregroundColor: UIColor.black , NSAttributedStringKey.font: font]
            
            let fontAttributes = [NSAttributedStringKey.font: font16]
            
            UINavigationBar.appearance().titleTextAttributes = fontAttributes
            UIBarButtonItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
            //            UINavigationBar.appearance().tintColor = UIColor.white
            //            UINavigationBar.appearance().barTintColor = UIColor.themeColor
        }
        
        if let font12 = UIFont(name: "IRANYekanMobile", size: 12) {
            let fontAttributes = [NSAttributedStringKey.font: font12]
            UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        }
        
        //        #if DEBUG
        //        Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection10.bundle")?.load()
        //        FLEXManager.shared().showExplorer()
        //
        //        #endif
        //
        // Override point for customization after application launch.
        //        FLEXManager.shared().showExplorer()
        
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            center.requestAuthorization(options: [.sound,.badge,.alert ], completionHandler: { (granted, error) in
                
                //                print(granted)
                //                print(error)
                
                if (error == nil){
                    //                if (error == nil){
                    if Defaults.shared.get( for: AppProperty.shared.push_token ) == nil {
                        print("register it")
                        DispatchQueue.main.async(execute: {
                            UIApplication.shared.registerForRemoteNotifications()
                        })
                    }
                }
            })
        } else {
            let settings  = UIUserNotificationSettings(types: [UIUserNotificationType.alert , UIUserNotificationType.badge , UIUserNotificationType.sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            //            application.registerForRemoteNotifications()
        }
        
        
        
        
        
        
        return true
    }

    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("User Info === \(notification.request.content.userInfo)")
        // Handle code here.
        completionHandler([UNNotificationPresentationOptions.sound , UNNotificationPresentationOptions.alert , UNNotificationPresentationOptions.badge])
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("User Info === \(response.notification.request.content.userInfo)")
        completionHandler()
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        
        Defaults.shared.set(token, for: AppProperty.shared.push_token )
        print("token is",token)

        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print(userInfo)
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

