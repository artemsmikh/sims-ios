//
//  DefaultSimsApi.swift
//  simsTest
//
//  Created by John Nilsen on 5/19/16.
//  Copyright © 2016 John Nilsen. All rights reserved.
//

import Foundation
import Alamofire

class DefaultSimsApi: SimsApi {

    func registerDevice(appToken: String, deviceToken: String, sessionToken: String) {
        let authorizationToken = appToken + ":" + sessionToken
        let utf8authToken = authorizationToken.dataUsingEncoding(NSUTF8StringEncoding)
        let encodedAuthString = utf8authToken?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue:0))
        let language = NSLocale.preferredLanguages()[0] ?? "en-En"
        print(language)
        let headers = [
            "Authorization": "Basic " + encodedAuthString!,
            "Accept": "application/json"
        ]
        let parameters = ["token": deviceToken,
                          "platform": 1,
                          "language": language]
        
        let idfv = UIDevice.currentDevice().identifierForVendor?.UUIDString
        print(parameters)
        let request = Alamofire.request(.PUT, "https://api.tapglue.com/0.4/me/devices/" + idfv!, headers:headers, parameters: (parameters as! [String : AnyObject]), encoding: .JSON).responseJSON { response in
            debugPrint(response)
        }
    }
}
