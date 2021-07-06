//
//  ToyConstant.swift
//  Toy
//
//  Created by Fluper on 10/08/17.
//  Copyright © 2017 Fluper. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

import UIKit


//MARK: ---------Color Constants---------
let kWhiteColor               = UIColor.white
let APP_THEME_UP = UIColor.init(red: 252/255, green: 184/255, blue: 37/255, alpha: 1)
let APP_THEME_DOWN = UIColor.init(red: 251/255, green: 136/255, blue: 51/255, alpha: 1)
let LOCATION_COLOR = UIColor.init(red: 35/255, green: 187/255, blue: 212/255, alpha: 1)
let APP_BACKGROUND_THEME = UIColor.init(red: 237/255, green: 238/255, blue: 238/255, alpha: 1)
//let APP_StatusBarColor = UIColor.init(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha: 1)
//let APP_StatusBarColor = UIColor.init(red: 247.0/255, green: 80.0/255, blue: 32.0/255, alpha: 1)
let APP_StatusBarColor = UIColor.init(red: 0.0/255.0, green: 19.0/255.0, blue: 52.0/255.0, alpha: 1)
let APP_Navigation_Bar_Color = UIColor.white
    
//    UIColor.init(red: 0.0/255.0, green: 19.0/255.0, blue: 52.0/255.0, alpha: 1)
let BUTTON_BACKGROUND_THEME = UIColor.init(red: 226/255, green: 1888/255, blue: 157/255, alpha: 1)
let BUTTON_BACKGROUND_THEME1 = UIColor.init(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1)

let kAppBlueColourCode          = UIColor(red: 3.0/255.0, green: 147.0/255.0, blue: 288.0/255.0, alpha: 1.0)
let kAppYellowColourCode        = UIColor(red: 253.0/255.0, green: 216.0/255.0, blue: 53.0/255.0, alpha: 1.0)
let kAppPinkColourCode        = UIColor(red: 190.0/255.0, green: 51.0/255.0, blue: 115.0/255.0, alpha: 1.0)


//MARK: ---------UIFont Constants---------


//MARK: ---------Method Constants---------
@available(iOS 13.0, *)
let kSharedAppDelegate          = UIApplication.shared.delegate as! AppDelegate
@available(iOS 13.0, *)
let kSharedSceneDelegate          = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate

let kSharedInstance             = SharedClass.sharedInstance
let kSharedUserDefaults         = UserDefaults.standard
let kScreenWidth                = UIScreen.main.bounds.size.width
let kScreenHeight               = UIScreen.main.bounds.size.height








func isInternetAvailable() -> Bool
{
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
            SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
        }
    }
    
    var flags = SCNetworkReachabilityFlags()
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
        return false
    }
    let isReachable = flags.contains(.reachable)
    let needsConnection = flags.contains(.connectionRequired)
    return (isReachable && !needsConnection)
}




func print_debug(items: Any)
{
  print(items)
}

func print_debug_fake(items: Any)
{
  
}
//MARK: ---------Enums---------
enum HomeOptions: Int
{
    case homeCell1 = 0
    case homeCell2
    case homeCell3
//    case recentRequest
//    case categoryfour
    static let count = 3
}
enum GetReportFormType: Int
{
    case firstName = 0
    case lastName
    case gender
    case countryCode
    case mobileNumber
    case dateOfBirth
    case timeOfBirth
    case placeOfBirthCity
    case placeofBirthCountry
    case meritalStatus
    case employmentIn
    case selectLanguage
    static let count = 12

    func getPlaceHolder() -> String
    {
        switch self
        {
        case .firstName:
            return "First Name"
       
        case .lastName:
            return "Last Name"
        case .gender:
             return "Gender"
        case .countryCode:
            return "Country Code"
        case .mobileNumber:
             return "Mobile Number"
        case .dateOfBirth:
             return "Date of Birth"
        case .timeOfBirth:
             return "Time of Birth"
        case .placeOfBirthCity:
            return "Place of Birth"
        case .placeofBirthCountry:
            return "Country of Birth"
        case .meritalStatus:
             return "Merrital Status"
        case .employmentIn:
             return "Employment In"
        case .selectLanguage:
             return "Select Language"
        default:
            return ""
        }
    }
}
enum GetPartnerReportFormType: Int
{
    case partnerName = 0
    case partnerDateOfBirth
    case partnerTimeOfBirth
    case partnerPlaceOfBirthCity
    case partnerPlaceofBirthCountry
    case comments
    static let count = 6

    func getPlaceHolder() -> String
    {
        switch self
        {
        case .partnerName:
            return "Partner Name"
        case .partnerDateOfBirth:
             return "Partner Date of Birth"
        case .partnerTimeOfBirth:
             return "Partner Time of Birth"
        case .partnerPlaceOfBirthCity:
            return "Partner Place of Birth"
        case .partnerPlaceofBirthCountry:
            return "Partner Country of Birth"
        case .comments:
             return "Comments"
        default:
            return ""
        }
    }
}
enum LoginCellType: Int
{
    case userEmailMobile = 0
    case password
    static let count = 2

    func getPlaceHolder() -> String
    {
        switch self
        {
        case .userEmailMobile:
            return "Email Id/Mobile No."
       
        case .password:
            return "Password"
        default:
            return ""
        }
    }
}
enum UpdateAccountCellType: Int //["Account Number","Account Type","IFSC Code","Acoount Holder Name","Bank Name"]
{
    case accountNo = 0
    case accountType
    case ifscCode
    case holderName
    case bankName
    static let count = 5

    func getPlaceHolder() -> String
    {
        switch self
        {
        case .accountNo:
            return "Account Number"
        case .accountType:
            return "Account Type"
        case .ifscCode:
            return "IFSC Code"
        case .holderName:
            return "Acoount Holder Name"
        case .bankName:
            return "Bank Name"
        default:
            return ""
        }
    }
}
enum EditAboutMeCellType: Int
{
    case shortDecsEnglish = 0
    case shortDecsHindi
    case longDecsEnglish
    case longDecsHindi
    case videoLink
    static let count = 4
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .shortDecsEnglish:
            return "Short Description (In English)"
        case .shortDecsHindi:
            return "संक्षिप्त वर्णन(हिंदी में)"
        case .longDecsEnglish:
            return "Long Description (In English)"
        case .longDecsHindi:
            return "लंबा वर्णन(हिंदी में)"
        case .videoLink:
            return "Enter video link"
        default:
            return ""
        }
    }
}
enum HomeScreenCellType: Int
{
    case top = 0
    case center
    case bottom
    static let count = 3
}

enum EditDocumentsCellType: Int
{
    case pancardNumber = 0
    case pancardImg
    case aadharcardNumber
    case aadharcardImg
    case addressProof
    case addressImg
    static let count = 6
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .pancardNumber:
            return "Pan Card Number"
        case .pancardImg:
            return "Pan Card Image"
        case .aadharcardNumber:
            return "Aadhar Card Number"
        case .aadharcardImg:
            return "Aadhar Card Imgage"
        case .addressProof:
            return "Address Proof"
        case .addressImg:
           return "Address Proof Imgage"
        default:
            return ""
        }
    }
}

enum EditMyProfileCellType: Int
{
    case name = 0
    case hindiName
    case gender
    case dob
    case mobileCode
    case mobileNumber
    case altMobileCode
    case altMobileNumber
    case email
    case consultantType
    case callRate
    case chatRate
    case reportRate
    case videoLink
    static let count = 14
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .name:
            return "Name"
        case .hindiName:
            return "नाम"
        case .gender:
            return "Gender"
        case .dob:
            return "Date of Birth"
        case .mobileCode:
            return "Mobile Code"
        case .mobileNumber:
            return "Mobile Number"
        case .altMobileCode:
           return "Alternate Mobile Code"
        case .altMobileNumber:
           return "Alternate Mobile Number"
        case .email:
           return "Email"
        case .consultantType:
           return "Consultant Type"
        case .callRate:
           return "Call Rate in ₹"
        case .chatRate:
           return "Chat Rate in ₹"
        case .reportRate:
          return "Report Rate in ₹"
       
        default:
            return ""
        }
    }
}
enum EditExperienceCellType: Int
{
    case expertise = 0
    case language
    case experience
    case onlinePortal
    static let count = 4
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .expertise:
            return "Expertise"
        case .language:
            return "Language"
        case .experience:
            return "Experience in years"
        case .onlinePortal:
            return "Are you working on any online portal?"
        default:
            return ""
        }
    }
}
enum SignUpCellType: Int
{
    case fullName = 0
    case mobile
    case emailId
    case countryName
    case password
    case confirmPassword
    static let count = 6
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .fullName:
            return "Full Name"
        case .mobile:
            return "Mobile"
        case .emailId:
            return "Email"
        case .countryName:
            return "Country Name"
        case .password:
            return "Password"
        case .confirmPassword:
            return "Confirm Password"
        default:
            return ""
        }
    }
}
enum ResetPassCellType: Int
{
    case otp = 0
    case password
    case confirmPassword
    static let count = 3
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .otp:
            return "Otp"
        case .password:
            return "New Password"
        case .confirmPassword:
            return "Confirm Password"
        default:
            return ""
        }
    }
}
enum ForgotCellType: Int
{
    case userName = 0
    case button

    static let count = 2
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .userName:
            return "E-mail identificativo utente"
        default:
            return ""
        }
    }
}
enum SideMenuOptionsWithoutLogin: Int
{
    case singIn_SignUp = 0
    static let count = 1
}
enum EditProfileOptions: Int
{
    case artistName = 0
    case email
    case mobile
    case location
    case threeField
    case about
    case twoButton
    case music_equipment
    case rate_per_hour
    case social_profile

    static let count = 10
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .artistName:
            return "Enter Artist Name"
        case .email:
            return "Enter Email"
        case .mobile:
            return "Enter Mobile"
        case .music_equipment:
            return "Enter Music Equipment"
        case .rate_per_hour:
            return "Enter Rate(Per Hour)"
        default:
            return ""
        }
    }
}
enum EditProfileOptions1: Int
{
    case artistName = 0
    case email
    case mobile
    case location
    case threeField
    case about
    case twoButton
    case rate_per_hour
    case social_profile

    static let count = 9
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .artistName:
            return "Enter Artist Name"
        case .email:
            return "Enter Email"
        case .mobile:
            return "Enter Mobile"
        case .rate_per_hour:
            return "Enter Rate(Per Hour)"
        default:
            return ""
        }
    }
}
//enum SideMenuOptions: Int
//{
//    case booking = 0
//    case logout
//
//    static let count = 2
//
//    static func getCellNameAndImage(forIndexPath indexPath: IndexPath) -> (String, UIImage)
//    {
//        switch indexPath.row
//        {
//        case SideMenuOptions.booking.rawValue:
//            return ("Your Booking", #imageLiteral(resourceName: "icons8-activity-history-96"))
//        case SideMenuOptions.logout.rawValue:
//            return ("Logout", #imageLiteral(resourceName: "icons8-export-40"))
//
//        default:
//            return ("", UIImage())
//        }
//    }
//}
enum SideMenuOptions: Int
{
    case home    = 0
    case myAccount
    case services
    case reportSection
    case report
    case paymentHistorySec
    case callHistory
    case reportHistory
    case chatHistory
    case accountSettings
    case notification
    case aboutUs
    case termsConditions
    case privacyPolicy

    static let count = 14
    
    
  
}
enum SideMenuVenueOptions: Int
{
    case booking = 0
    case pendingPayment

    case logout

    static let count = 3
    
    static func getCellNameAndImage(forIndexPath indexPath: IndexPath) -> (String, UIImage)
    {
        switch indexPath.row
        {
        case SideMenuVenueOptions.booking.rawValue:
            return ("Your Booking", #imageLiteral(resourceName: "icons8-activity-history-96"))
        case SideMenuVenueOptions.pendingPayment.rawValue:
        return ("Pending Payments", #imageLiteral(resourceName: "credit-card-outline"))
        case SideMenuVenueOptions.logout.rawValue:
            return ("Logout", #imageLiteral(resourceName: "icons8-export-40"))
            
        default:
            return ("", UIImage())
        }
    }
}
enum VenueProfileCell: Int
{
    case booking = 0
    case socialApp
    case rate_Per_hr
    case full_name
    case email
    case location
    case contact_no
    case about
    case genres
    case band
    case music_equipment

    static let count = 11
    
    
}
enum VenueProfileCell1: Int
{
    case booking = 0
    case socialApp
    case full_name
    case email
    case location
    case contact_no
    case about
    case genres
    case rate_Per_hr

    static let count = 9
    
    
}
enum VenueProfileCell2: Int
{
    case booking = 0
    case full_name
    case email
    case location
    case contact_no
    case about
    

    static let count = 6
    
    
}
enum VenueMusicCell: Int
{
    case booking = 0
   case viewMore 

    static let count = 2
    
    
}
enum VenueMusicCell1: Int
{
    case booking = 0
   case viewMore

    static let count = 2
    
    
}
enum VenueGroupCell: Int
{
    case booking = 0
    case blank
    

    static let count = 2
    
    
}
enum SideMenuOptionsLogin: Int
{
    case casa = 0
    case cronologia
    case login
    case registration
    case notifica
    case communicate
    case condividere
    case appTariffaria
    
    static let count = 8
    
    static func getCellNameAndImage(forIndexPath indexPath: IndexPath) -> (String, UIImage)
    {
        switch indexPath.row
        {
        case SideMenuOptionsLogin.casa.rawValue:
            return ("Casa", #imageLiteral(resourceName: "home"))
        case SideMenuOptionsLogin.cronologia.rawValue:
            return ("Cronologia delle prenotazioni", #imageLiteral(resourceName: "restore-clock"))
        case SideMenuOptionsLogin.login.rawValue:
            return ("Accesso", #imageLiteral(resourceName: "lock-open-outline"))
        case SideMenuOptionsLogin.registration.rawValue:
            return ("Registrare", #imageLiteral(resourceName: "account-plus"))
        case SideMenuOptionsLogin.notifica.rawValue:
            return ("Notifica", #imageLiteral(resourceName: "bell"))
        case SideMenuOptionsLogin.condividere.rawValue:
            return ("Condividere", #imageLiteral(resourceName: "share-variant"))
        case SideMenuOptionsLogin.appTariffaria.rawValue:
            return ("App tariffaria", #imageLiteral(resourceName: "message-draw"))
        default:
            return ("", UIImage())
        }
    }
}
enum OwnPostCellType: Int
{
    
    case button = 0
    static let count = 1
    
}


enum UserPostVCCellType: Int
{
    case titletext = 0
    case textcontents
    case button
    static let count = 3
    
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .titletext:
            return "Enter Title"
        case .textcontents:
            return "Post description..."
            
        default:
            return ""
        }
    }
}


enum ResetPassworCellType: Int
{
    
    case password
    case confirmPassword
    case button
    static let count = 3
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        
        case .password:
            return "Enter New Password"
        case .confirmPassword:
            return "Enter Confirm Password"
            
        default:
            return ""
        }
    }
}
enum WalletTypeCell: Int
{
    case button = 0
    static let count = 1
}

enum ConnectionCellType: Int
{
    
    case button = 0
    static let count = 1
 
}

enum SideMenuCellType: Int
{
    case home = 0
    case profile
    case wallet
    case connections
    case tranjections
    case privacypolicy
    case termsandCondition
    case contactUs
    case button
    static let count = 9
 
}

//MARK: ---------Enums---------
enum SocialType: Int
{
    case facebook = 1
    case gmail
    case email
}

enum EditProfileCellType: Int
{
    case name = 0
    case last_name
    case email
    static let count = 3
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .name:
            return "First Name"
            
            
            
            
        case .last_name:
            return "Last Name"
            
      
        case .email:
      
            return ""
            
       
      
        default:
            return ""
        }
    }
}




//enum SignUpCellType: Int
//{
//  case name = 0
//  case lastName
//  case gender
//  case email
//  case password
//  case confirmPassword
//  case button
//  static let count = 7
//
//  func getPlaceHolder() -> String
//  {
//    switch self
//    {
//    case .name:
//      return "First Name"
//    case .lastName:
//      return "Last Name"
//    case .gender:
//        return ""
//    case .email:
//      return "Email Address"
//    case .password:
//      return "Password"
//    case .confirmPassword:
//      return "Confirm Password"
//    default:
//      return ""
//    }
//  }
//}

enum ForgotPassworCellType: Int
{
    case email = 0
    case button
    static let count = 2
    
    func getPlaceHolder() -> String
    {
        switch self
        {
        case .email:
            return "Email Address"
        
        default:
            return ""
        }
    }
}

//MARK: ---------String---------
let kUserDateFormate            = "dd-MM-yyyy"
let backendDateFormate          = "yyyy-MM-dd"
let kLoginModule                = "Login"
let kYes                        = "Yes"
let kNo                         = "No"
let kAppName                    = "Bliss GenX"
let kOk                         = "Ok"
let kCancel                     = "Cancel"
let kThisdevicehasNoCamera      = "This device has no Camera"
let kCameraNotFound             = "Camera Not Found"
let kChooseFromGaller           = "Choose image from Gallery"
let kChooseFile                 = "Documents"
let kImages                     = "Images"
let kChooseFromCamera           = "Choose image from Camera"
let kIsTutorialAlreadyShown     = "isTutorialAlreadyShown"
let kIsUserLoggedIn             = "isUserLoggedIn"
let kLoggedInUserDetails        = "loggedInUserDetails"
let kSavedAvailableTTDetails    = "savedAvailableTTDetails"
let kLoggedInUserId             = "loggedInUserId"
let kLatitude                   = "latitude"
let kLongitude                  = "longitude"
let kSelectGenderString         = "selectGender"
let kPleaseEnterFirstName       = "Please enter first name"
let kPleaseEnterLastName        = "Please enter last name"
let kEnterTitle                 = "Please enter title"
let kEnterCity                  = "Please enter city"
let kEnterCountry               = "Please enter country"
let kEnterIndustry              = "Please enter industry"
let kPleaseSelectPlaceofBirth   = "Please select place of birth"
let kEnterComents               = "Please enter comments"
let kPleaseSelectCountryofBirth = "Please select country of birth"
let kPleaseSelectMerritalStatus = "Please select merrital status"
let kPleaseSelectEmployment     = "Please select employment"
let kPleaseSelectLanguage       = "Please select language"
let kPleaseSelectGender         = "Please select gender"
let kPleaseSelectDay            = "Please select day" 
let kPleaseSelectStartTime      = "Please select start time"
let kPleaseSelectEndTime        = "Please select end time"
let kPleaseSelectStartDate      = "Please select start date"
let kEndDateGreater             = "End date should be greater than start date"
let kEndTimeGreater             = "End time should be greater than start time"
let kPleaseSelectEndDate        = "Please select end date"
let kPleaseSelectConsultantType = "Please select consultant type"
let kEnterReportRate            = "Report rate should be min ₹50 & max ₹3000"
let kEnterChatRate              = "Enter chat rate should be min ₹2 and max ₹200"
let kEnterCallRate              = "Enter call rate should be min ₹2 and max ₹200"
let kPleaseSelectPhoneCode      = "Please select phone code"
let kEnterFullName              = "Enter full name"
let kEnterOTP                   = "Please enter OTP"
let kEnterPancardNumber         = "Please enter Pan card number"
let kEnterAadharcardNumber      = "Please enter Aadhar card number"
let kEnterAddressProof          = "Please enter address proof"
let kEnterShortDecsEn           = "Please enter short descriptions in english"
let kEnterValidVideoURL         = "Enter valid video url"
let kSelectCountry              = "Please select country"
let kSelectLanguage             = "Please select language"
let kSelectTimeZone             = "Please select time zone"
let kEnterExperience            = "Please enter experience"
let kSelectWorkingPortal        = "Please select , are you working on online portal"
let kSelectAddress              = "Please select address"
let kSelectExpertised           = "Please select expertise"
let kPleaseEnterValidEmail      = "Please enter a valid email"
let kPleaseEnterValiduserName      = "Enter First Name"
let kPleaseEnterValiduserLastName  = "Enter Last Name"
let kEnterEmail                 = "Enter valid email"
let kPendingAdminApproval       = "Your bank account details approval is pending from admin."
let kEnterBankAccountNumber     = "Please enter bank account number"
let kEnterBankAccountType       = "Please select bank account type"
let kEnterBankIFSCCode          = "Please enter bank IFSC code"
let kEnterBankAccountHolderName = "Please enter bank account holder name"
let kEnterBankName              = "Please enter bank's name"

let kEnterPassword              = "Enter password should be minimum 6 digits"
let kEnterConfirmPassword       = "Enter confirm password should be minimum 6 digits"
let kPasswordNotMatch           = "Password do not match"
let kNetworkError               = "Network error. Check your network connections and try again."
let kLoginString                = "Login"
let kMaleStr                    = "Male"
let kFemaleStr                  = "Female"
let kEmailIdStr                 = "emailId"
let kEnterEmailMobile           = "Enter email id/Mobile no."
let kEnterMobileNo              = "Please Enter valid mobile number"
let kSelectDOB                  = "Please select date of birth"
let kSelectTOB                  = "Please select date of birth"
let kEnterMobileOtp             = "Enter mobile Otp"
let kEnterEmailOtp              = "Enter mobile Otp"
let kEnterMessage               = "Please enter message"

//MARK:- -----------Sting Constant Navigation -----------
let kMain                       = "Main"
let kGuest                      = "Guest"
let kVenues                     = "Venues"
let kArtists                    = "Artists"

let kLoginNavigation            = "LoginNavigation"
let kSignUpNavigation           = "SignUpNav"
let kSignUpNavigationNew        = "SignUpNavNew"
let kLogoutPlacehoderString     = "Are you sure you want to logout?"
// #MARK:--imageOrientationSet--
func imageOrientationSet(_ src:UIImage)->UIImage {
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



