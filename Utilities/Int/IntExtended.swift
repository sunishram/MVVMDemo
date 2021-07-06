//
//  IntExtended.swift
//  TheBeaconApp
//
//  Created by Ruchin Singhal on 21/12/16.
//  Copyright © 2016 finoit. All rights reserved.
//

import Foundation

extension Int
{
  static func getInt(_ value: Any?) -> Int
  {
    guard let intValue = value as? Int else
    {
      let strInt = String.getString(value)
      guard let intValueOfString = Int(strInt) else { return 0 }
      
      return intValueOfString
    }
    return intValue
  }
}
