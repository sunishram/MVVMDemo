//
//  UserDefaultsExtended.swift
//  OneClickWash
//
//  Created by RUCHIN SINGHAL on 23/10/16.
//  Copyright © 2016 Appslure. All rights reserved.
//

import Foundation

extension UserDefaults
{
  func isTutorialShown() -> Bool
  {
    return self.bool(forKey: kIsTutorialAlreadyShown)
  }
  
  func setTutorialShownStatus(tutorialShown: Bool)
  {
    self.set(tutorialShown, forKey: kIsTutorialAlreadyShown)
    self.synchronize()
  }
  
  func isUserLoggedIn() -> Bool
  {
    return self.bool(forKey: kIsUserLoggedIn)
  }

  func setUserLoggedIn(userLoggedIn: Bool)
  {
    self.set(userLoggedIn, forKey: kIsUserLoggedIn)
    self.synchronize()
  }
  
  func getLoggedInUserId() -> String
  {
    return String.getString(self.string(forKey: kLoggedInUserId))
  }
  
  func setLoggedInUserId(loggedInUserId: String)
  {
    self.set(loggedInUserId, forKey: kLoggedInUserId)
    self.synchronize()
  }
  func setUserSelectedLocation(_ latitude: Double, _ longitude: Double)
  {
    self.set(latitude, forKey: kLatitude)
    self.set(longitude, forKey: kLongitude)
    self.synchronize()
  }
  
  func getSelectedLatitudeAndLongitude() -> (Double, Double)
  {
    return (Double.getDouble(self.double(forKey: kLatitude)), Double.getDouble(self.double(forKey: kLongitude)))
  }
  
  func updateUserPics(_ dict: Dictionary<String, Any>)
  {
    var dictUserData = getLoggedInUserDetails()
    var arrUserImages = kSharedInstance.getArray(dictUserData[kMediafiles])
    arrUserImages.append(dict)
    
    dictUserData[kMediafiles] = arrUserImages
    setLoggedInUserDetails(loggedInUserDetails: dictUserData)
  }
  
  func updateUserLocation(withLatitude latitude: Double, andLongitude longitude: Double)
  {
    var dictUserData = getLoggedInUserDetails()
    var dictLocation = kSharedInstance.getDictionary(dictUserData[kLocation])
    dictLocation[kLatitude] = latitude
    dictLocation[kLongitude] = longitude
    
    dictUserData[kLocation] = dictLocation
    setLoggedInUserDetails(loggedInUserDetails: dictUserData)
  }
  
  func deleteUserPic(atIndex index: Int)
  {
    var dictUserData = getLoggedInUserDetails()
    var arrUserImages = kSharedInstance.getArray(dictUserData[kMediafiles])
    
    var dictPic = kSharedInstance.getDictionary(arrUserImages[index])
    arrUserImages.remove(at: index)
    
    if NSNumber.getNSNumber(message: dictPic[kIsProfilePicture]).boolValue && arrUserImages.count > 0
    {
      var dictProfilePic = kSharedInstance.getDictionary(arrUserImages[0])
      dictProfilePic[kIsProfilePicture] = "1"
      dictUserData[kProfilePicture] = dictProfilePic[kMedia]
      
      arrUserImages.remove(at: 0)
      arrUserImages.insert(dictProfilePic, at: 0)
    }
    
    dictUserData[kMediafiles] = arrUserImages
    setLoggedInUserDetails(loggedInUserDetails: dictUserData)
  }
  
  func updateUserProfilePic(toIndex newProfilePicIndex: Int)
  {
    var dictUserData = getLoggedInUserDetails()
    var arrUserImages = kSharedInstance.getArray(dictUserData[kMediafiles])
    
    for i in 0..<arrUserImages.count
    {
      var dictPic = kSharedInstance.getDictionary(arrUserImages[i])
      
      if i == newProfilePicIndex
      {
        dictPic[kIsProfilePicture] = "1"
        dictUserData[kProfilePicture] = dictPic[kMedia]
      }
      else
      {
        dictPic[kIsProfilePicture] = "0"
      }
      arrUserImages.remove(at: i)
      arrUserImages.insert(dictPic, at: i)
    }
    
    dictUserData[kMediafiles] = arrUserImages
    setLoggedInUserDetails(loggedInUserDetails: dictUserData)
  }
  
  func updateLoggedInUserData(_ dict: Dictionary<String, Any>)
  {
    var dictUserData = getLoggedInUserDetails()
    for (key, value) in dict
    {
      dictUserData[key] = value
    }
    
    setLoggedInUserDetails(loggedInUserDetails: dictUserData)
  }
  
  func updateEmailVerifiedStatus()
  {
    var dictUserData = getLoggedInUserDetails()
    dictUserData[kIsEmailVerified] = NSNumber(value: true)
    
    setLoggedInUserDetails(loggedInUserDetails: dictUserData)
  }
  
  func getLoggedInUserDetails() -> Dictionary<String, Any>
  {
    guard let dataUser = self.object(forKey: kLoggedInUserDetails) else
    {
      return ["":""]
    }
    
    guard let userData = dataUser as? Data else
    {
      return ["":""]
    }
    
    let unarchiver = NSKeyedUnarchiver(forReadingWith: userData)
    guard let userLoggedInDetails = unarchiver.decodeObject(forKey: kLoggedInUserDetails) as? Dictionary <String, Any> else
    {
      unarchiver.finishDecoding()
      return ["":""]
    }
    
    unarchiver.finishDecoding()
    return userLoggedInDetails
  }
  
  func setLoggedInUserDetails(loggedInUserDetails: Dictionary<String, Any>)
  {
    if loggedInUserDetails.isEmpty
    {
      self.set(nil, forKey: kLoggedInUserDetails)
      self.synchronize()
      return
    }
    
    let userData = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWith: userData)
    archiver.encode(loggedInUserDetails, forKey: kLoggedInUserDetails)
    archiver.finishEncoding()
    self.set(userData, forKey: kLoggedInUserDetails)
    self.synchronize()
  }
    
    
    func setUserTokenDetails(userTokenDetails: Dictionary<String, Any>)
    {
      if userTokenDetails.isEmpty
      {
        self.set(nil, forKey: kSavedAvailableTTDetails)
        self.synchronize()
        return
      }
      
      let userData = NSMutableData()
      let archiver = NSKeyedArchiver(forWritingWith: userData)
      archiver.encode(userTokenDetails, forKey: kSavedAvailableTTDetails)
      archiver.finishEncoding()
      self.set(userData, forKey: kSavedAvailableTTDetails)
      self.synchronize()
    }
    
    func updateTokenData(_ dict: Dictionary<String, Any>)
    {
      var dictUserTokenData = getTokenDetails()
      for (key, value) in dict
      {
        dictUserTokenData[key] = value
      }
      
      setUserTokenDetails(userTokenDetails: dictUserTokenData)
    }
    
    
    func getTokenDetails() -> Dictionary<String, Any>
    {
      guard let dataTalkTime = self.object(forKey: kSavedAvailableTTDetails) else
      {
        return ["":""]
      }
      
      guard let userTalkData = dataTalkTime as? Data else
      {
        return ["":""]
      }
      
      let unarchiver = NSKeyedUnarchiver(forReadingWith: userTalkData)
      guard let availableTalkTimeDetails = unarchiver.decodeObject(forKey: kSavedAvailableTTDetails) as? Dictionary <String, Any> else
      {
        unarchiver.finishDecoding()
        return ["":""]
      }
      
      unarchiver.finishDecoding()
      return availableTalkTimeDetails
    }
}
