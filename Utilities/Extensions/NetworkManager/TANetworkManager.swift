//
//  TANetworkManager.swift
//  TANetworkingSwift
//
//  Created by Girijesh Kumar on 09/01/16.
//  Copyright © 2016 Girijesh Kumar. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftGifOrigin

public enum kHTTPMethod: String
{
  case GET, POST, PUT, PATCH, DELETE
}

public enum ErrorType: Error
{
  case noNetwork, requestSuccess, requestFailed, requestCancelled
}

public class TANetworkManager
{
    static var IMG_EXTENSION:String { return ".jpeg" }
    static var VID_EXTENSION:String { return ".mp4" }
    static var AUD_EXTENSION:String { return ".mp3" }
    static var IMG_MIMETYPE:String { return "image/jpeg" }
    static var VIDEO_MIMETYPE:String { return "video/mp4" }
    static var AUDIO_MIMETYPE:String { return "audio/mp3" }
    
    
    
  // MARK: - Properties
  
  /**
   A shared instance of `Manager`, used by top-level Alamofire request methods, and suitable for use directly
   for any ad hoc requests.
   */
  internal static let sharedInstance: TANetworkManager =
    {
      return TANetworkManager()
  }()
  
  
  //MARK:- Public Method
  /**
   *  Initiates HTTPS or HTTP request over |kHTTPMethod| method and returns call back in success and failure block.
   *
   *  @param serviceName  name of the service
   *  @param method       method type like Get and Post
   *  @param postData     parameters
   *  @param responeBlock call back in block
   */
    let imgView = UIImageView()
    func requestApi(withServiceName serviceName: String,subView : UIView,tokenStr : String, requestMethod method: kHTTPMethod, requestParameters postData: Dictionary<String, Any>, withProgressHUD showProgress: Bool, completionClosure:@escaping (_ result: Any?, _ error: Error?, _ errorType: ErrorType, _ statusCode: Int?) -> ()) -> Void
  {
    if NetworkReachabilityManager()?.isReachable == true
    {
      if showProgress
      {
        showProgressHUD(withTitle: "", subView: subView)
      }
      
      //let headers = getHeaderWithAPIName(serviceName: serviceName)
//        let headers : HTTPHeaders = [
//            .authorization(username: "Username", password: "Password"),
//            .accept("application/json")
//        ]
        let headers: HTTPHeaders = [
             "Content-Type"    : "application/json",
             kToken           : tokenStr
         ]
      print(headers)
      let serviceUrl = getServiceUrl(string: serviceName)
      
      let params  = getPrintableParamsFromJson(postData: postData)
      
        print_debug(items: "Connecting to Host with URL \(kBASEURL)\(serviceName) with parameters: \(params)")
     
      assert(method != .GET || method != .POST, "kHTTPMethod should be one of kHTTPMethodGET|kHTTPMethodPOST|kHTTPMethodPOSTMultiPart.");
      
      switch method
      {
      case .GET:
        AF.request(serviceUrl, method: .get, parameters: postData, encoding: URLEncoding.default, headers: headers).responseJSON(completionHandler:
          { (DataResponse) in
            SVProgressHUD.dismiss()
            self.imgView.removeFromSuperview()
//            print(DataResponse.data)
            print(DataResponse)
//            print(DataResponse.value)

            switch DataResponse.result
            {
            
            case .success(let JSON):
                print_debug_fake(items: "Success with JSON: \(JSON)")
                print_debug(items: "Success with status Code: \(String(describing: DataResponse.response?.statusCode))")
                let dict = kSharedInstance.getArray(DataResponse.value)
                print(dict)
                
//                let arr = kSharedInstance.getArray(DataResponse.value)
//                print(DataResponse.value)
//                let dict = kSharedInstance.getDictionary(arr[0])
//                kSharedUserDefaults.set(dict, forKey: "LoginData")
              let response = self.getResponseDataDictionaryFromData(data: DataResponse.data!)
                print(response)
            completionClosure(DataResponse.value, response.error, .requestSuccess, Int.getInt(DataResponse.response?.statusCode))
            case .failure(let error):
                print_debug(items: "json error: \(error.localizedDescription)")
              if error.localizedDescription == "cancelled"
              {
                completionClosure(nil, error, .requestCancelled, Int.getInt(DataResponse.response?.statusCode))
              }
              else
              {
                completionClosure(nil, error, .requestFailed, Int.getInt(DataResponse.response?.statusCode))
              }
            }
        })
      case .POST:
        
        AF.request(serviceUrl, method: .post, parameters: postData, encoding: JSONEncoding.`default`, headers: headers).responseJSON(completionHandler:
          { (DataResponse) in
            SVProgressHUD.dismiss()
            self.imgView.removeFromSuperview()
            switch DataResponse.result
            {
            case .success(let JSON):
                print(JSON)
                print_debug_fake(items: "Success with JSON: \(JSON)")
                print_debug(items: "Success with status Code: \(String(describing: DataResponse.response?.statusCode))")
              let response = self.getResponseDataDictionaryFromData(data: DataResponse.data!)
              completionClosure(response.responseData, response.error, .requestSuccess, Int.getInt(DataResponse.response?.statusCode))
            case .failure(let error):
                print_debug(items: "json error: \(error.localizedDescription)")
              completionClosure(nil, error, .requestFailed, Int.getInt(DataResponse.response?.statusCode))
            }
        })
      case .PUT:
        AF.request(serviceUrl, method: .put, parameters: postData, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler:
          { (DataResponse) in
            SVProgressHUD.dismiss()
            self.imgView.removeFromSuperview()
            switch DataResponse.result
            {
            case .success(let JSON):
                print_debug_fake(items: "Success with JSON: \(JSON)")
                print_debug(items: "Success with status Code: \(String(describing: DataResponse.response?.statusCode))")
              let response = self.getResponseDataDictionaryFromData(data: DataResponse.data!)
              completionClosure(response.responseData, response.error, .requestSuccess, Int.getInt(DataResponse.response?.statusCode))
            case .failure(let error):
                print_debug(items: "json error: \(error.localizedDescription)")
              completionClosure(nil, error, .requestFailed, Int.getInt(DataResponse.response?.statusCode))
            }
        })
      case .PATCH:
        AF.request(serviceUrl, method: .patch, parameters: postData, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler:
          { (DataResponse) in
            SVProgressHUD.dismiss()
            self.imgView.removeFromSuperview()
            switch DataResponse.result
            {
            case .success(let JSON):
                print_debug_fake(items: "Success with JSON: \(JSON)")
                print_debug(items: "Success with status Code: \(String(describing: DataResponse.response?.statusCode))")
              let response = self.getResponseDataDictionaryFromData(data: DataResponse.data!)
              completionClosure(response.responseData, response.error, .requestSuccess, Int.getInt(DataResponse.response?.statusCode))
            case .failure(let error):
                print_debug(items: "json error: \(error.localizedDescription)")
              completionClosure(nil, error, .requestFailed, Int.getInt(DataResponse.response?.statusCode))
            }
        })
      case .DELETE:
        AF.request(serviceUrl, method: .delete, parameters: postData, encoding: URLEncoding.default, headers: headers).responseJSON(completionHandler:
          { (DataResponse) in
            SVProgressHUD.dismiss()
            self.imgView.removeFromSuperview()
            switch DataResponse.result
            {
            case .success(let JSON):
                print_debug_fake(items: "Success with JSON: \(JSON)")
                print_debug(items: "Success with status Code: \(String(describing: DataResponse.response?.statusCode))")
              let response = self.getResponseDataDictionaryFromData(data: DataResponse.data!)
              completionClosure(response.responseData, response.error, .requestSuccess, Int.getInt(DataResponse.response?.statusCode))
            case .failure(let error):
                print_debug(items: "json error: \(error.localizedDescription)")
              completionClosure(nil, error, .requestFailed, Int.getInt(DataResponse.response?.statusCode))
            }
        })
      }
    }
    else
    {
      SVProgressHUD.dismiss()
        self.imgView.removeFromSuperview()
      completionClosure(nil, nil, .noNetwork, nil)
    }
  }
  
   
  /**
   *  Upload multiple images and videos via multipart
   *
   *  @param serviceName  name of the service
   *  @param imagesArray  array having images in NSData form
   *  @param videosArray  array having videos file path
   *  @param postData     parameters
   *  @param responeBlock call back in block
   */
    func requestMultiPart(withServiceName serviceName: String,subView : UIView, requestMethod method: HTTPMethod, requestImages arrImages: [Dictionary<String, Any>],withProgressHUD showProgress: Bool,withProgessHUDTitle:String, requestVideos arrVideos: Dictionary<String, Any>, requestData postData: Dictionary<String, Any>, completionClosure: @escaping (_ result: Any?, _ error: Error?, _ errorType: ErrorType, _ statusCode: Int?) -> ()) -> Void
      {
        if NetworkReachabilityManager()?.isReachable == true
        {
            if showProgress
            {
                showProgressHUD(withTitle: withProgessHUDTitle, subView: subView)
            }
          
            let serviceUrl = getServiceUrl(string: serviceName)
            let params  = getPrintableParamsFromJson(postData: postData)
           
            let headers: HTTPHeaders = [
                        kApiKey: kApiKeyValue, kApiDate: kApiDateValue,
                        "Content-Type": "application/json"
                ]

          print_debug(items: "Connecting to Host with URL \(kBASEURL)\(serviceName) with parameters: \(params)")

             //fixed here
              AF.upload(multipartFormData: { MultipartFormData in
                 do
                   {
                       for (key, value) in postData {
                           MultipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                       }
                   }
                   catch let error
                   {
                     print_debug(items: error)
                   }

                for dictImage in arrImages
                {
                  let validDict = kSharedInstance.getDictionary(dictImage)
                  if let image = validDict["image"] as? UIImage
                  {
                     
                    if let imageData: Data = image.jpegData(compressionQuality: 0.6)
                    {
                     let imageName = String.getString(validDict["imageName"])
                        MultipartFormData.append(imageData, withName: String.getString(validDict["imageName"]), fileName: String.getString(NSNumber.getNSNumber(message: self.getCurrentTimeStamp()).intValue) + "image\(imageName.last!).jpg", mimeType: "image/jpg")
                     print("imageDataSunish:\(imageData)")
                     print("imageDataName:\(String.getString(validDict["imageName"]))")
                    }
                  }
                }
                }, to: serviceUrl, method: .post, headers: headers)
               .responseJSON { (DataResponse) in
                debugPrint("SUCCESS RESPONSE: \(DataResponse.result)")
                 SVProgressHUD.dismiss()
                self.imgView.removeFromSuperview()
                 switch DataResponse.result {
                      case .success(let JSON):
                          print_debug_fake(items: "Success with JSON: \(JSON)")
                            print_debug(items: "Success with status Code: \(String(describing: DataResponse.response?.statusCode))")
                          let response = self.getResponseDataDictionaryFromData(data: DataResponse.data!)
                          completionClosure(response.responseData, response.error, .requestSuccess, Int.getInt(DataResponse.response?.statusCode))
                      case .failure(let error):
                           print_debug(items: "json error: \(error.localizedDescription)")
                            completionClosure(nil, error, .requestFailed, Int.getInt(DataResponse.response?.statusCode))
                      }
               }
        }
        else
        {
          SVProgressHUD.dismiss()
            self.imgView.removeFromSuperview()
          completionClosure(nil, nil, .noNetwork, nil)
        }
      }
      
    
  
  private func addImages(inFormData multipartFormData:MultipartFormData, imageList arrImages:[Dictionary<String, Any>], imageKey: String, imageNameKey: String, fileNameKey: String) -> Void {
       
       for dictImage in arrImages {
           
           if let image = dictImage[imageKey] as? UIImage {
               
            if let imageData:Data = image.jpegData(compressionQuality: 0.7) {
                   
                   var imgFileName = TANetworkManager.toString(dictImage[fileNameKey])
                   if imgFileName.isEmpty { imgFileName = TANetworkManager.createImageFileName()}
                   
                   print("imgFileName",imgFileName,"image Name",TANetworkManager.toString(dictImage[imageNameKey]))
                   
                   multipartFormData.append(imageData, withName: TANetworkManager.toString(dictImage[imageNameKey]), fileName: imgFileName, mimeType:TANetworkManager.IMG_MIMETYPE)
               }
           }
       }
   }
    private static func createImageFileName(withIdentifier identifier:String = "") -> String {
           return "\(TANetworkManager.toString((TANetworkManager.getCurrentTimeStamp())))\(identifier)\(TANetworkManager.IMG_EXTENSION)"
       }
    private static func getCurrentTimeStamp()-> TimeInterval {
        return NSDate().timeIntervalSince1970.rounded();
    }
    private func addBodyParameters(inFormData multipartFormData:MultipartFormData,params postData: Dictionary<String, Any>) -> Void {
        for (key, value) in postData {
            multipartFormData.append(self.toJSONString(value).data(using: String.Encoding.utf8)!, withName: key)
            
        }
    }
    func toJSONString(_ value: Any) -> String {
        
        if let val = value as? String {
            return val
        }
        
        if let objectData = try? JSONSerialization.data(withJSONObject: value, options: JSONSerialization.WritingOptions(rawValue: 0)) {
            let objectString = String(data: objectData, encoding: .utf8)
            return objectString ?? ""
        }
        return ""
    }
    class func toString(_ object:Any?) -> String {
        
        if var str = object as? String {
            
            str = String(format: "%@", str)
            return str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
        
        if let num = object as? NSNumber {
            
            let str = String(format: "%@", num)
            return str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
        
        return ""
    }
    func cancelAllRequests(completionHandler: @escaping () -> ())
  {
    let sessionManager = Session.default; sessionManager.session.getTasksWithCompletionHandler { (dataTask: [URLSessionDataTask], uploadTask: [URLSessionUploadTask], downloadTask: [URLSessionDownloadTask]) in
      dataTask.forEach({ (task: URLSessionDataTask) in task.cancel() })
      uploadTask.forEach({ (task: URLSessionUploadTask) in task.cancel() })
      downloadTask.forEach({ (task: URLSessionDownloadTask) in task.cancel() })
      completionHandler()
    }
  }
  
  
  //MARK:- Private Method
    private func showProgressHUD(withTitle title:String , subView : UIView)
     {
    
      let x_axis = (kScreenWidth - 100)/2
      let y_axis = (kScreenHeight - 240)/2
    
      imgView.frame = CGRect(x: x_axis, y: y_axis, width: 100, height: 100)
      subView.addSubview(imgView)
      imgView.loadGif(name: "logo_colored_gif")
        
        
       
       // self.view .addSubview(testClass)
       //SVProgressHUD.show(withStatus: "Please Wait")
      // SVProgressHUD.show(withStatus: title)
   //    SVProgressHUD.setBackgroundColor(UIColor(red: 241.0/255.0, green: 170.0/255.0, blue: 43.0/255.0, alpha: 1.0))
       
       
       //SVProgressHUD.setBackgroundColor(UIColor(red: 62.0/255.0, green: 162.0/255.0, blue: 215.0/255.0, alpha: 1.0))
       
      // SVProgressHUD.setRingThickness(3)
      // SVProgressHUD.setAnimationCurve(UIView.AnimationCurve.linear)
   //    SVProgressHUD.setForegroundColor(UIColor(red: 246.0/255.0, green: 65.0/255.0, blue: 46.0/255.0, alpha: 1.0))
      // SVProgressHUD.setForegroundColor(UIColor.white)
     }
  func getHeaderWithAPIName(serviceName: String) -> [String: Any]
  {
    // Add AES authentication ...........
//    let headers:[String:String] = ["Accept": "application/json", "Content-Type":"application/x-www-form-urlencoded"]
    let headers:[String: String] = ["Content-Type": "application/json"];
    if kSharedUserDefaults.isUserLoggedIn()
    {

    }
    return headers
  }
    func getHeaderWithAPIName1(serviceName: String) -> [String: String]
    {
   
            let headers:[String: String] = ["Content-Type": "application/json"];

        return headers
    }
  
  private func getServiceUrl(string: String) -> String
  {
    if string.contains("http")
    {
      return string
    }
    else
    {
      return kBASEURL + string
    }
  }
    private func getServiceUrl1(string: String) -> String
    {
        if string.contains("http")
        {
            return string
        }
        else
        {
            return kBASEURL + string
        }
    }
  
  private func getPrintableParamsFromJson(postData: Dictionary<String, Any>) -> String
  {
    do
    {
      let jsonData = try JSONSerialization.data(withJSONObject: postData, options:JSONSerialization.WritingOptions.prettyPrinted)
        
        print("jsonData:\(jsonData)")
        
      let theJSONText = String(data:jsonData, encoding:String.Encoding.ascii)
      return theJSONText ?? ""
    }
    catch let error as NSError
    {
        print_debug(items: error)
      return ""
    }
  }
  
  private func getResponseDataArrayFromData(data: Data) -> (responseData: [Any]?, error: NSError?)
  {
    do
    {//as! [String: Any]

        let responseData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [Any]
        
        print("Success with JSON: \(String(describing: responseData))")
      return (responseData, nil)
    }
    catch let error as NSError
    {
        print_debug(items: "json error: \(error.localizedDescription)")
      return (nil, error)
    }
  }
  
  private func getResponseDataDictionaryFromData(data: Data) -> (responseData: Dictionary<String, Any>?, error: Error?)
  {
    do
    {
      let responseData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String, Any>
        print("Success with JSON: \(String(describing: responseData))")
      return (responseData, nil)
    }
    catch let error
    {
        print_debug(items: "json error: \(error.localizedDescription)")
      return (nil, error)
    }
  }
  
//  private func printResponseDataForResponse(response: DataResponse<Any>)
//  {
//    print_debug(items: response.request)  // original URL request
//    print_debug(items: response.response) // URL response
//    print_debug(items: response.data)     // server data
//    print_debug(items: response.result)   // result of response serialization
//  }
  
  private func encryptRequestString(requestStr: String)-> String
  {
    //    let plainTextStr = requestStr+"_\(getCurrentTimeStamp())"
    //    let encyptedStrng = TAAESCrypt.encrypt(plainTextStr, password: kEncryptionKey)
    //    print("encyptedStrng: \(encyptedStrng)")
    return ""
  }
  
  private func getCurrentTimeStamp()-> TimeInterval
  {
    return NSDate().timeIntervalSince1970.rounded();
  }
}

