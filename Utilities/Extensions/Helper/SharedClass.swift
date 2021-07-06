//
//  SharedClass.swift
//  HealthTotal
//
//  Created by Office on 23/05/16.
//  Copyright © 2016 Collabroo. All rights reserved.
//

import UIKit

class SharedClass: NSObject
{
  static let sharedInstance = SharedClass()
  var customerId : String = ""
    var totalAmountC : Double = 0.0

  private override init()
  {
  }

  func showOkAlertViewController(withTitle title: String, withMessage message: String, fromViewController viewController: UIViewController)
  {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    let okAction =  (UIAlertAction(title: kOk, style: .cancel, handler: nil))
    alert.addAction(okAction)
    viewController.present(alert, animated: true, completion: nil)
  }
  
  func getArray(_ array: Any?) -> [Any]
  {
    guard let arr = array as? [Any] else
    {
      return []
    }
    return arr
  }
  
  func getStringArray(_ array: Any?) -> [String]
  {
    guard let arr = array as? [String] else
    {
      return []
    }
    return arr
  }
  
  func getArray(withDictionary array: Any?) -> [Dictionary<String, Any>]
  {
    guard let arr = array as? [Dictionary<String, Any>] else
    {
      return []
    }
    return arr
  }
  
  func getDictionary(_ dictData: Any?) -> Dictionary<String, Any>
  {
    guard let dict = dictData as? Dictionary<String, Any> else
    {
      guard let arr = dictData as? [Any] else
      {
        return ["":""]
      }
      return getDictionary(arr.count > 0 ? arr[0] : ["":""])
    }
    return dict
  }
    
  func convertJSONToString(fromDict dict: Dictionary<String, Any>) -> String
  {
    do
    {
      let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
      return String.init(data: jsonData, encoding: .utf8) ?? ""
    }
    catch let error
    {
      print(error)
    }
    return ""
  }
    func getFutureDate() -> String
    {
        let monthsToAdd = 0
        let daysToAdd = 3
        let yearsToAdd = 0
        let currentDate = getCurrentDate()
        
        var dateComponent = DateComponents()
        
        dateComponent.month = monthsToAdd
        dateComponent.day = daysToAdd
        dateComponent.year = yearsToAdd
        
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let currentDate1 = dateFormatter.string(from: futureDate!)
        return currentDate1
    }
    func getCurrentDate()-> Date {
        var now = Date()
        var nowComponents = DateComponents()
        let calendar = Calendar.current
        nowComponents.year = Calendar.current.component(.year, from: now)
        nowComponents.month = Calendar.current.component(.month, from: now)
        nowComponents.day = Calendar.current.component(.day, from: now)
        nowComponents.hour = Calendar.current.component(.hour, from: now)
        nowComponents.minute = Calendar.current.component(.minute, from: now)
        nowComponents.second = Calendar.current.component(.second, from: now)
        nowComponents.timeZone = NSTimeZone.local
        now = calendar.date(from: nowComponents)!
        return now as Date
    }
  func convertStringToJSON(fromString strJSON: String) -> Dictionary<String, Any>
  {
    guard let data = strJSON.data(using: .utf8) else { return ["":""] }
    
    do
    {
      let dict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
      return getDictionary(dict)
    }
    catch let error
    {
      print(error)
    }
    return ["":""]
  }
    func setShadow(withSubView subView:UIView , cornerRedius : Int)
    {
        
       //
        subView.layer.shadowOpacity = 0.9
        subView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        
        subView.layer.shadowRadius = 3.0
        subView.layer.shadowColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0).cgColor
        subView.layer.cornerRadius = CGFloat(cornerRedius)
         subView.clipsToBounds = false
       // subView.layer.shadowColor = UIColor(red: 228.0/255.0, green: 235.0/255.0, blue: 251.0/255.0, alpha: 1.0).cgColor
       // subView.backgroundColor = UIColor.white
    }
    func changeTxtfieldPlaceholderColor(withTxtField txtField : UITextField , placeHolder : String)
    {
        //UIColor(red: 136.0/255.0, green: 150.0/255.0, blue: 165.0/248.0, alpha: 1.0)
        txtField.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
    }
    func getUTCTime() -> String
    {
        let today = Date()
         let formatter = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
         let result = formatter.string(from: today)
         let currentDate = formatter.date(from:result)!
        let globalTime = currentDate.timeIntervalSince1970
         let globelLocatime = String.getString(globalTime).components(separatedBy: ".")
        return globelLocatime[0]
    }
    
    
     
    
    func getCurrentDate1() -> String
    {
        let today = Date()
         let formatter = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd"
         let result = formatter.string(from: today)
        let currentDate = formatter.date(from:result)!
        let globalTime = currentDate.timeIntervalSince1970
         let globelLocatime = String.getString(globalTime).components(separatedBy: ".")
        return globelLocatime[0]
        //return result
    }
    
    func getCurrentDateTime() -> String
    {
        let today = Date()
         let formatter = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
         let result = formatter.string(from: today)
        
        return result
    }
    //MARK: --imageOrientation--
    
    func imageOrientation(_ src:UIImage)->UIImage {
        if src.imageOrientation == UIImage.Orientation.up {
            return src
        }
        var transform: CGAffineTransform = CGAffineTransform.identity
        switch src.imageOrientation {
        case UIImage.Orientation.down, UIImage.Orientation.downMirrored:
            transform = transform.translatedBy(x: src.size.width, y: src.size.height)
            transform = transform.rotated(by: CGFloat(Double.pi))
            break
        case UIImage.Orientation.left, UIImage.Orientation.leftMirrored:
            transform = transform.translatedBy(x: src.size.width, y: 0)
            transform = transform.rotated(by: CGFloat(Double.pi))
            break
        case UIImage.Orientation.right, UIImage.Orientation.rightMirrored:
            transform = transform.translatedBy(x: 0, y: src.size.height)
            transform = transform.rotated(by: CGFloat(-Double.pi / 2))
            break
        case UIImage.Orientation.up, UIImage.Orientation.upMirrored:
            break
        }
        
        switch src.imageOrientation {
        case UIImage.Orientation.upMirrored, UIImage.Orientation.downMirrored:
            transform.translatedBy(x: src.size.width, y: 0)
            transform.scaledBy(x: -1, y: 1)
            break
        case UIImage.Orientation.leftMirrored, UIImage.Orientation.rightMirrored:
            transform.translatedBy(x: src.size.height, y: 0)
            transform.scaledBy(x: -1, y: 1)
        case UIImage.Orientation.up, UIImage.Orientation.down, UIImage.Orientation.left, UIImage.Orientation.right:
            break
        }
        
        let ctx:CGContext = CGContext(data: nil, width: Int(src.size.width), height: Int(src.size.height), bitsPerComponent: (src.cgImage)!.bitsPerComponent, bytesPerRow: 0, space: (src.cgImage)!.colorSpace!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        
        ctx.concatenate(transform)
        
        switch src.imageOrientation {
        case UIImage.Orientation.left, UIImage.Orientation.leftMirrored, UIImage.Orientation.right, UIImage.Orientation.rightMirrored:
            ctx.draw(src.cgImage!, in: CGRect(x: 0, y: 0, width: src.size.height, height: src.size.width))
            break
        default:
            ctx.draw(src.cgImage!, in: CGRect(x: 0, y: 0, width: src.size.width, height: src.size.height))
            break
        }
        
        let cgimg:CGImage = ctx.makeImage()!
        let img:UIImage = UIImage(cgImage: cgimg)
        
        return img
    }
    
}
