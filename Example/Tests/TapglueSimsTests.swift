//
//  simsTestTests.swift
//  simsTestTests
//
//  Created by John Nilsen on 5/16/16.
//  Copyright © 2016 John Nilsen. All rights reserved.
//

import XCTest
@testable import TapglueSims

class simsTestTests: XCTestCase {
    
    let appToken = "appToken"
    let url = "https://api.tapglue.com"
    let mockApi = MockSimsApi()
    
    //SUT
    var sims: TapglueSims!
    
    override func setUp() {
        super.setUp()
        sims = TapglueSims(appToken: appToken, url:url)
        sims.api = mockApi
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSettingSessionTokenDoesNotRegisterDevice() {
        sims.sessionTokenSet("someToken")
        
        XCTAssertFalse(mockApi.didRegister)
    }
    
    func testSettingDeviceTokenDoesNotRegisterDevice() {
        let deviceToken = "someToken"
        let data = deviceToken.dataUsingEncoding(NSUTF8StringEncoding)!
        sims.registerDeviceToken(data)
        
        XCTAssertFalse(mockApi.didRegister)
    }
    
    func testSettingSessionAndDeviceTokenRegistersDevice() {
        sims.sessionTokenSet("sessionToken")
        let deviceToken = "deviceToken"
        let data = deviceToken.dataUsingEncoding(NSUTF8StringEncoding)!
        sims.registerDeviceToken(data)
        
        XCTAssertTrue(mockApi.didRegister)
    }
}
