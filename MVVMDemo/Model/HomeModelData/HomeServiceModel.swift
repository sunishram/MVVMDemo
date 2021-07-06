//
//  HomeModelData.swift
//  WemsRSA
//
//  Created by Sunish Ram on 22/05/21.
//  Copyright © 2021 Sunish Ram. All rights reserved.
//
//"id": "1",
//               "service_id": "1000000001",
//               "service_name": "Tires",
//               "service_slug": "tires",
//               "shortdesc": "We connect you with reliable tire fixers, or as they are popularly known \\\"Vulcanizers\\\"; providing you with expedient service, be it a tire change or fix.",
//               "mobile_icon": "https://res.cloudinary.com/wemsrsa/image/upload/v1616754909/ogpmvi3siyjbmcsvyvra.png",
//               "service_image": "https://res.cloudinary.com/wemsrsa/image/upload/v1616754878/ndca8dqjzmyub3xkcu8z.png",
//               "image_alt"

import Foundation
import Foundation
import UIKit
import SwiftyJSON



class HomeServiceModel
{
    var id              : String = ""
    var service_id      : String = ""
    var service_name    : String = ""
    var shortdesc       : String = ""
    var mobile_icon     : String = ""
    var user_image      : String = ""
    var service_image   : String = ""
    var image_alt       : String = ""
    init(){
    }
    init(initWitDictData dictData : Dictionary<String,Any>){
        self.id            =  String.getString(dictData["id"])
        self.service_id    =  String.getString(dictData["service_id"])
        self.service_name  =  String.getString(dictData["service_name"])
        self.shortdesc     =  String.getString(dictData["shortdesc"])
        self.mobile_icon   =  String.getString(dictData["mobile_icon"])
        self.user_image    =  String.getString(dictData["user_image"])
        self.service_image =  String.getString(dictData["service_image"])
        self.image_alt     =  String.getString(dictData["image_alt"])
       }
}


//#MARK: ------using JSONSwifty ----------
struct JsonModel{
    
    var id              : String = ""
    var service_id      : String = ""
    var service_name    : String = ""
    var shortdesc       : String = ""
    var mobile_icon     : String = ""
    var user_image      : String = ""
    var service_image   : String = ""
    var image_alt       : String = ""
 
    init(){
        
    }
    
    init(json:JSON){
        id               = json["id"].stringValue
        shortdesc        = json["shortdesc"].stringValue
        mobile_icon      = json["mobile_icon"].stringValue
        service_name     = json["service_name"].stringValue
        service_id       = json["service_id"].stringValue
        user_image       = json["user_image"].stringValue
        service_image    = json["service_image"].stringValue
        image_alt        = json["shortdesc"].stringValue
    }

}
