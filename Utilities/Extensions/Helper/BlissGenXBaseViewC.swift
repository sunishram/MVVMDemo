//
//  MusicBaseViewC.swift
//  Music
//
//  Created by Amarendra Tiwary on 22/06/2020.
//  Copyright © 2020 Mobibi Solutions India pvt ltd. All rights reserved.
//

import UIKit
import MBProgressHUD


@available(iOS 13.0, *)
class BlissGenXBaseViewC: UIViewController
{
    //    private var customVideoPlayer: CustomVideoPlayerViewC? = nil
    var subscriptionStatusGet : String = ""
    //MARK:- ----------View Life Cycle Methods----------
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
   
    //MARK: - AlertView Controller
    func showOkAlert(withMessage message: String)
    {
        let alert = UIAlertController(title: kAppName, message: message, preferredStyle: .alert)
        let okAction =  (UIAlertAction(title: kOk, style: .cancel, handler: nil))
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showOkAlertWithTitle(withMessage message: String,title:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction =  (UIAlertAction(title: kOk, style: .cancel, handler: nil))
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showOkAlert(withMessage message: String, andHandler handler:@escaping () -> Void)
    {
        let alert = UIAlertController(title: kAppName, message: message, preferredStyle: .alert)
        let okAction =  UIAlertAction(title:"Ok", style: .default)
        { (action) -> Void in
            return handler()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func showOkAlert9(withMessage message: String, andHandler handler:@escaping () -> Void)
       {
           let alert = UIAlertController(title: kAppName, message: message, preferredStyle: .alert)
           let okAction =  UIAlertAction(title:"Get OTP", style: .default)
           { (action) -> Void in
               return handler()
           }
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
       }
    func showOkAndCancelAlert(withMessage message: String, andHandler handler:@escaping () -> Void)
    {
        let alert = UIAlertController(title: kAppName, message: message, preferredStyle: .alert)
        let okAction =  UIAlertAction(title: kYes, style: .default) { (action) -> Void in
            return handler()
        }
        let cancelAction = UIAlertAction(title: kNo, style: .cancel) { (action) -> Void in
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    func showActionSheetLogout(withTitle title: String?, withAlertMessage message: String?, withOptions options: [String], handler:@escaping (_ selectedIndex: Int) -> Void)
     {
       let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
       alert.view.tintColor = UIColor(red: 63.0/255.0, green: 76.0/255.0, blue: 117.0/255.0, alpha: 1.0)
      
       for strAction in options
       {
         let anyAction =  UIAlertAction(title: strAction, style: .destructive)
         { (action) -> Void in
           return handler(options.index(of: strAction)!)
         }
      
        alert.addAction(anyAction)
       }
       
       let cancelAction = UIAlertAction(title:kCancel, style: .cancel)
       { (action) -> Void in
       }
       
       alert.addAction(cancelAction)
       if let popoverController = alert.popoverPresentationController {
           popoverController.sourceView = self.view
       }
       present(alert, animated: true, completion: nil)
     }
    func showTextFieldAlert(withMessage message: String, withTextFieldText strText: String, andHandler handler:@escaping (_ strText: String) -> Void)
    {
        let alert = UIAlertController(title: kAppName, message: message, preferredStyle: .alert)
        
        alert.addTextField { (txtFieldOffer: UITextField) in
            txtFieldOffer.placeholder = "Enter message"
            txtFieldOffer.text = strText
        }
        let okAction =  UIAlertAction(title: kOk, style: .default) { (action) -> Void in
            guard let textField = alert.textFields?.first else { return }
            return handler(String.getString(textField.text))
        }
        let cancelAction = UIAlertAction(title: kCancel, style: .cancel) { (action) -> Void in
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    func showTextFieldAlert1(withMessage message: String, withTextFieldText strText: String, andHandler handler:@escaping (_ strText: String) -> Void)
    {
        let alert = UIAlertController(title: kAppName, message: message, preferredStyle: .alert)
        
        alert.addTextField { (txtFieldOffer: UITextField) in
            txtFieldOffer.placeholder = "Enter OTP"
            txtFieldOffer.text = strText
        }
        let okAction =  UIAlertAction(title: kOk, style: .default) { (action) -> Void in
            guard let textField = alert.textFields?.first else { return }
            return handler(String.getString(textField.text))
        }
        let cancelAction = UIAlertAction(title: kCancel, style: .cancel) { (action) -> Void in
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    func showActionSheet(withTitle title: String?, withAlertMessage message: String?, withOptions options: [String], handler:@escaping (_ selectedIndex: Int) -> Void)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for strAction in options
        {
            let anyAction =  UIAlertAction(title: strAction, style: .default)
            { (action) -> Void in
                return handler(options.index(of: strAction)!)
            }
            alert.addAction(anyAction)
        }
        
        let cancelAction = UIAlertAction(title:kCancel, style: .cancel)
        { (action) -> Void in
        }
        
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    func showIndicator(withTitle title: String, and Description:String , subView : UIView , isTrue : Bool) {
          let Indicator = MBProgressHUD.showAdded(to: subView, animated: isTrue)
          Indicator.label.text = title
          Indicator.isUserInteractionEnabled = false
          Indicator.detailsLabel.text = Description
          Indicator.show(animated: true)
       }
       func hideIndicator() {
          MBProgressHUD.hide(for: self.view, animated: true)
       }
    
    public func showVideoPlayer(withURL vidURL:URL, onController viewC: UIViewController? = nil) -> Void {
        
        //        if customVideoPlayer == nil {
        ////            customVideoPlayer = customVideoPlayer(withVideoURL: vidURL)
        //        }
        //
        //        self.present(customVideoPlayer!, animated: true, completion: nil)
        //        customVideoPlayer!.avplayerDismissClosure = { [weak self] in
        //            self?.customVideoPlayer = nil
        //        }
    }
    func pushViewCFromSWReveal(withStoryBoardName storyBoardName: String, andIdentifier identifier: String)
    {
        let storyB = UIStoryboard(name: storyBoardName, bundle: nil)
        let vc = storyB.instantiateViewController(withIdentifier: identifier)
        
        if #available(iOS 13.0, *) {
            guard (kSharedSceneDelegate.swRevealViewC.frontViewController as? UINavigationController) != nil else { return }
        } else {
            guard (kSharedAppDelegate.swRevealViewC.frontViewController as? UINavigationController) != nil else { return }
            // Fallback on earlier versions
        }
        // self.revealViewController().pushFrontViewController(vc, animated: true)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.setViewControllers([vc], animated:true)
        self.revealViewController().revealToggle(animated: true)
        self.revealViewController().pushFrontViewController(navController, animated: true)
        //navigationViewC.pushViewController(vc, animated: true)
    }
    let imgView = UIImageView()
    func setImageView(withSubView subView : UIView)
    {
        
        let x_axis = (kScreenWidth - 100)/2
        let y_axis = (kScreenHeight - 100)/2
        
        imgView.frame = CGRect(x: x_axis, y: y_axis, width: 100, height: 100)
        subView.addSubview(imgView)
//        imgView.loadGif(name: "real_astro_gif")
    }
//    func nextViewController(withViewName viewName : String , viewController : UIViewController)
//    {
//        let sb : UIStoryboard = UIStoryboard(name: viewName, bundle: nil)
//        let nv = sb.instantiateViewController(withIdentifier: viewController.storyboardId()) as! viewController
//        self.navigationController?.pushViewController(nv, animated: true)
//    }
    
    
   
    func transToHourMinSec(time: Float) -> String
    {
        var completeDuration : String = ""
        let allTime: Int = Int(time)
        var hours = 0
        var minutes = 0
        var seconds = 0
        var hoursText = ""
        var minutesText = ""
        var secondsText = ""
        
        hours = allTime / 3600
        hoursText = hours > 9 ? "\(hours)" : "0\(hours)"
        
        minutes = allTime % 3600 / 60
        minutesText = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        seconds = allTime % 3600 % 60
        secondsText = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        
        if hoursText != "00"
        {
            completeDuration = "\(hoursText)h : \(minutesText)m : \(secondsText)s"
        }else{
            completeDuration = "\(minutesText)m : \(secondsText)s"
        }
        
        
        return completeDuration
    }
   
    
    func filterHTMLData(withHTMLData htmlStrData : String) -> String
    {
        //let encodedString = "The Weeknd <em>&#8216;King Of The Fall&#8217;</em>"

        guard let data = htmlStrData.data(using: .utf8) else {
            return ""
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return ""
        }

        // The Weeknd ‘King Of The Fall’
        //let decodedString = attributedString.string
        
        return attributedString.string
    }
    
   
}
extension UIViewController
{
    static func getStotyboardId() -> String
    {
        return String(describing: self)
    }
}
extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
