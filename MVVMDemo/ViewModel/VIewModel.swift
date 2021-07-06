//
//  VIewModel.swift
//  MVVMDemo
//
//  Created by Sunish Ram on 22/05/21.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class UserViewModel{
    
    weak var vc : ViewController?
    weak var vc2: ViewController2?
    weak var vc3: JSON4SfwiftyVC?
    
    var jsonModelDataArr   = [JsonModel]()
    var homeServiceDataArr = [HomeServiceModel]()
    var serviceDataArr     = [ServiceData]()
    
    let simpleClosure = {
        print("Hello, World!")
    }
    
    //#MARK:-----------callServicesWebService---------
    public func callServicesWebService(withDictParams dictParams : Dictionary<String,Any> , dictImg : [String : Any] , subView : UIView )
    {

        TANetworkManager.sharedInstance.requestMultiPart(withServiceName: kServices, subView: subView, requestMethod: .post, requestImages: [dictImg], withProgressHUD: true, withProgessHUDTitle: "Please Wait", requestVideos: [String:  Any](), requestData: dictParams, completionClosure: {[weak self] (response: Any?, error: Error?, errorType: ErrorType, statusCode: Int?) in
            guard let strongSelf = self else { return }
            if errorType == .requestSuccess
            {

                let dictResponse = kSharedInstance.getDictionary(response)

                if Int.getInt(dictResponse["success"]) == 1
                {
                    let result = kSharedInstance.getDictionary(dictResponse["result"])
                   
                    let serviceDataArr = kSharedInstance.getArray(result["serviceData"])
                   
                    
                    //serviceDataArr
                    
                    for dict in serviceDataArr
                    {
                        let dictData = kSharedInstance.getDictionary(dict)
                        strongSelf.serviceDataArr.append(ServiceData(dictionary: dictData as NSDictionary)!)
                    }
                    
                    //#MARK: ----- Model data of viewController ----
                    
                    for dict in serviceDataArr
                    {
                        let dictData = kSharedInstance.getDictionary(dict)
                        strongSelf.homeServiceDataArr.append(HomeServiceModel(initWitDictData: dictData))
                    }
             
                  //  print("strongSelf.dataDict:",strongSelf.dataDict)
             
                   // #MARK: ------- viewController2 model data -------
                    let json = JSON(response as Any)
                    
                    let results = json["result"]
                    let serviceDatas = results["serviceData"]
                    
                 //   print("serviceDatas_sss:\(serviceDatas)")
                    
                    for arr in serviceDatas.arrayValue{
                        strongSelf.jsonModelDataArr.append(JsonModel(json: arr))
                    }
                    
                    DispatchQueue.main.async{
                        strongSelf.vc?.tblHome.reloadData()
                        strongSelf.vc2?.tblService.reloadData()
                        strongSelf.vc3?.tblJson.reloadData()
                    }
   
                  
                }else{
                    strongSelf.vc?.showOkAlert(withMessage: String.getString(dictResponse[kMessage]))
                }
            }
            else if errorType == .requestFailed
            {
                UIApplication.shared.endIgnoringInteractionEvents()
            }
            else
            {
            }
        })
    }
   
}
