//
//  user model.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//



import Foundation
import ObjectMapper


class userModel : Mappable {
    
    var full_name:String?
    var _id:String?
    var phone_number:String?
    var device_type:String?
    var notification_token:String?
    var credit:String?
    var token:String?
    var birthday:String?
    
    var created_at:String?
    var receive_notifications:Bool?
    
    init() {}
    required convenience init?(_ map: Map) { self.init() }
    
    required init?(map: Map) { }
    
    
    func mapping(map: Map) {
        
        full_name <- map["full_name"]
        _id <- map["_id"]
        phone_number <- map["phone_number"]
        device_type <- map["device_type"]
        notification_token <- map["notification_token"]
        credit <- map["credit"]
        receive_notifications <- map["receive_notifications"]
        birthday <- map["birthday"]
        token <- map["token"]
        created_at <- map["created_at"]
        
        
    }
}
