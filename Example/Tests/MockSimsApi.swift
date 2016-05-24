//
//  MockSimsApi.swift
//  simsTest
//
//  Created by John Nilsen on 5/19/16.
//  Copyright © 2016 John Nilsen. All rights reserved.
//

import Foundation
@testable import TapglueSims

class MockSimsApi: SimsApi {
    var didRegister = false
    var appToken: String?
    var deviceToken: String?
    var sessionToken: String?
    
    func registerDevice(appToken: String, deviceToken: String, sessionToken: String) {
        didRegister = true
        
        self.appToken = appToken
        self.deviceToken = deviceToken
        self.sessionToken = sessionToken
    }
}