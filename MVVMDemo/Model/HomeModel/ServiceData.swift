/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ServiceData {
	public var id : String?
	public var service_id : String?
	public var service_name : String?
	public var service_slug : String?
	public var shortdesc : String?
	public var mobile_icon : String?
	public var service_image : String?
	public var image_alt : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let serviceData_list = ServiceData.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of ServiceData Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ServiceData]
    {
        var models:[ServiceData] = []
        for item in array
        {
            models.append(ServiceData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let serviceData = ServiceData(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: ServiceData Instance.
*/
	required public init?(dictionary: NSDictionary) {

		id = dictionary["id"] as? String
		service_id = dictionary["service_id"] as? String
		service_name = dictionary["service_name"] as? String
		service_slug = dictionary["service_slug"] as? String
		shortdesc = dictionary["shortdesc"] as? String
		mobile_icon = dictionary["mobile_icon"] as? String
		service_image = dictionary["service_image"] as? String
		image_alt = dictionary["image_alt"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.service_id, forKey: "service_id")
		dictionary.setValue(self.service_name, forKey: "service_name")
		dictionary.setValue(self.service_slug, forKey: "service_slug")
		dictionary.setValue(self.shortdesc, forKey: "shortdesc")
		dictionary.setValue(self.mobile_icon, forKey: "mobile_icon")
		dictionary.setValue(self.service_image, forKey: "service_image")
		dictionary.setValue(self.image_alt, forKey: "image_alt")

		return dictionary
	}

}