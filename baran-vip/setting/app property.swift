//
//  app property.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//

import Foundation
import UIKit
import DefaultsKit

struct AppProperty {
    static var shared = AppProperty()
    var defaults = UserDefaults.standard
    let loginStatus = Key<Bool>("loginStatus")
    let first_met = Key<Bool>("first_met")
    let isLoggedIn = Key<Bool>("isLoggedIn")
    let ignore_minor_update = Key<Bool>("ignore_minor_update")
    let token = Key<String>("token")
    let push_token = Key<String>("push_token")
    
    let download_link = Key<String>("download_link")
    let policy = Key<String>("policy")
    let user_has_credit = Key<Bool>("user_has_credit")
    let app_triple_cell_size = Key<CGFloat>("app_triple_cell_size")
    
    //    let id = Key<Int>("id")
    //    let name = Key<String>("name")
    //    let fcm = Key<String>("fcm")
    
}

struct AppSetting {
    static let sharedInstance = AppSetting()
    
    
//    let BaseUrl:String = "https://baran-vip.ir/api"
    let BaseUrl:String = "http://localhost:4020/api"

    
    
    
}

//struct productInCart {
//    static var shared = productInCart()
//    var product : [productModel] = []
//}
//
//struct currentUser {
//    static var shared = currentUser()
//    var user : UserModel?
//}
//
//struct currentOrder {
//    static var shared = currentOrder()
//    var order = OrderModel()
//}
//
//struct currentShop {
//    static var shared = currentShop()
//    var shop = shop_info()
//}
//
