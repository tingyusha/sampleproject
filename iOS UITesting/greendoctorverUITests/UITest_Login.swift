//
//  greendoctorver_UI_Tests.swift
//  greendoctorver UI Tests
//   
//  Created by 沙庭宇 on 15/7/2.
//  Copyright © 2015年 kangkanghui. All rights reserved.
//

import Foundation
import XCTest

class UITest_Login: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
//        super.tearDown()
    }
    
    //判断控件是否存在
    func canOperateElement(element: XCUIElement?) ->Bool {
        if element != nil {
            if element!.exists{
                return true
            }else {
                return false
            }
        }
        return false
    }
    // 查看用户协议
    func test01_login() {
        let app = XCUIApplication()
        let button = app.buttons["用户协议"]
        XCTAssert(self.canOperateElement(button), "controlled not find!")
        button.tap()
        app.navigationBars["用户协议"].buttons["登录"].tap()
        
    }
    
    //验证码错误登录
    func test02_login() {
        let app = XCUIApplication()
        if self.canOperateElement(app.buttons["登录"]) {
            let textField = app.textFields["输入手机号"]
            textField.tap()
            textField.typeText("18221891473")
            
            let textField2 = app.textFields["验证码"]
            textField2.tap()
            textField2.typeText("0010")
            app.buttons["登录"].tap()
            if app.alerts.count > 0 {
                app.alerts["验证码不正确"].collectionViews.buttons["好的"].tap()
            }else {
                XCTAssertFalse(false, "未弹出错误提示Alerts")
            }

        }
        
    }
    
    //登录成功
    func test03_login() {
        let app = XCUIApplication()
        let textField = app.textFields["输入手机号"]
        textField.tap()
        textField.typeText("17000000000")
        
        let textField2 = app.textFields["验证码"]
        textField2.tap()
        textField2.typeText("0000")
        app.buttons["登录"].tap()
        
        sleep(15)
        if self.canOperateElement(app.buttons["马上体验！"]) {
            app.buttons["马上体验！"].tap()
            sleep(2)
            if self.canOperateElement(app.buttons["notice dismiss"]) {
                app.buttons["notice dismiss"].tap()
            }
            app.navigationBars["福利"].buttons["消息"].tap()
        }
        app.navigationBars["消息"].buttons["群发"].tap()
        
    }
    
    
}
