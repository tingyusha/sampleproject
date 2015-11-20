//
//  UITest_Login.swift
//  greenpatient
//
//  Created by 沙庭宇 on 15/7/17.
//  Copyright © 2015年 kangkanghui. All rights reserved.
//

import Foundation
import XCTest

class UITest_Login: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //查看用户协议
    func test00_checkTreaty() {
        let app = XCUIApplication()
        app.buttons["用户协议"].tap()
        for i in 1..<3 {
            app.swipeUp()
            app.swipeUp()
            app.swipeDown()
            print("第\(i)次循环")
        }
        
        app.navigationBars["用户协议"].buttons["手机登录"].tap()
        
    }
    
    //密码错误，登录失败
    func test01_loginFail() {
        let app = XCUIApplication()
        app.textFields["输入手机号码"].tap()
        app.typeText("17000000010")
        app.textFields["4位验证码"].tap()
        app.typeText("0839")
        app.buttons["登录"].tap()
        app.alerts["手机或验证码不正确"].collectionViews.buttons["好的"].tap()
        
    }
    //登录成功
    func test01_loginSucceed() {
        let app = XCUIApplication()
        app.textFields["输入手机号码"].tap()
        app.typeText("17000000010")
        app.textFields["4位验证码"].tap()
        app.typeText("0000")
        app.buttons["登录"].tap()
        sleep(3)
        app.tabBars.buttons["找医生"]
    }
    
}
