//
//  UITest_Message.swift
//  greenpatient
//
//  Created by 沙庭宇 on 15/7/17.
//  Copyright © 2015年 kangkanghui. All rights reserved.
//

import Foundation
import XCTest

class UITest_Message: XCTestCase {
        
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
    
    //判断控件是否存在
    func canOperateElement(element: XCUIElement?) ->Bool {
        if element != nil {
            if element!.exists {
                return true
            }else {
            return false
            }
        }else {
        return false
        }
    }
    
    //发送苹果
    func test00_checkDoctorDetail() {
        let app = XCUIApplication()
        app.tabBars.buttons["消息"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.buttons["input gift"].tap()
        
        let element = app.scrollViews.otherElements
        element.buttons["gift 1 s"].tap()
        app.buttons["知道了"].tap()
        element.buttons["gift 2 s"].tap()
        app.buttons["知道了"].tap()
        element.buttons["gift 3 s"].tap()
        app.buttons["知道了"].tap()
        element.buttons["gift 4 s"].tap()
        app.buttons["知道了"].tap()
        element.buttons["gift 5 s"].tap()
        app.buttons["知道了"].tap()
        element.buttons["gift 6 s"].tap()
        app.buttons["知道了"].tap()
        if app.alerts.count > 0 {
            app.buttons["接受"].tap()
            app.alerts["“患者测试版” Would Like to Send You Notifications"].collectionViews.buttons["OK"].tap()
        }
        app.navigationBars["ChatView"].buttons["返回"].tap()
        
    }
    
    
    //发送文本
    func test01_sendText() {
        let app = XCUIApplication()
        app.tabBars.buttons["消息"].tap()
        app.tables.staticTexts["沙医生"].tap()
        
        let textView = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(4).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.TextView).element
        textView.tap()
        app.typeText("你好呀")
        app.buttons["Send"].tap()
        app.navigationBars["ChatView"].buttons["返回"].tap()
        
    }
    

    //发送病例
    func test02_sendIllessCase() {
        let app = XCUIApplication()
        app.tabBars.buttons["消息"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.buttons["input more"].tap()
        app.descendantsMatchingType(.Other).buttons["more medhist"].tap()
        app.tables.buttons["小儿感冒"].tap()
        
        let navigationBar = app.navigationBars["填写资料"]
        navigationBar.buttons["下一步"].tap()
        app.tables.staticTexts["选择"].tap()
        app.tables.staticTexts["前天"].tap()
        navigationBar.buttons["提交"].tap()
        app.navigationBars["ChatView"].buttons["返回"].tap()
        
    }
    
    //发送病例不包含就诊日期和图片
    func test03_sendIllessCase() {
        let app = XCUIApplication()
        app.tabBars.buttons["消息"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.buttons["input more"].tap()
        app.descendantsMatchingType(.Other).buttons["more medhist"].tap()
        app.tables.buttons["小儿感冒"].tap()
        
        let navigationBar = app.navigationBars["填写资料"]
        navigationBar.buttons["下一步"].tap()
        navigationBar.buttons["跳过"].tap()
        app.navigationBars["ChatView"].buttons["返回"].tap()
    }
    
    //发送自定义疾病病例
    func test04_sendIllessCase() {
        let app = XCUIApplication()
        app.tabBars.buttons["消息"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.buttons["input more"].tap()
        app.descendantsMatchingType(.Other).buttons["more medhist"].tap()
        app.textFields["输入您的疾病"].tap()
        app.typeText("自定义疾病")
        
        let navigationBar = app.navigationBars["填写资料"]
        navigationBar.buttons["下一步"].tap()
        app.tables.staticTexts["选择"].tap()
        app.tables.staticTexts["前天"].tap()
        navigationBar.buttons["提交"].tap()
        app.navigationBars["ChatView"].buttons["返回"].tap()
    }
    
    //发送搜索疾病病例
    func test05_sendIllessCase() {
        let app = XCUIApplication()
        app.tabBars.buttons["消息"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.buttons["input more"].tap()
        app.descendantsMatchingType(.Other).buttons["more medhist"].tap()
        app.textFields["输入您的疾病"].tap()
        app.typeText("小儿感")
        app.tables.staticTexts["小儿感冒"].tap()
        
        let navigationBar = app.navigationBars["填写资料"]
        navigationBar.buttons["下一步"].tap()
        app.tables.staticTexts["选择"].tap()
        app.tables.staticTexts["前天"].tap()
        navigationBar.buttons["提交"].tap()
        app.navigationBars["ChatView"].buttons["返回"].tap()
    }
    //删除会话
    func test06_deleteTalk() {
        let app = XCUIApplication()
        app.tabBars.buttons["消息"].tap()
        app.tables.staticTexts["沙医生"].swipeLeft()
        app.tables.buttons["Delete"].tap()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.buttons["发消息"].tap()
        let textView = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(4).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.TextView).element
        textView.tap()
        app.typeText("你好呀")
        app.buttons["Send"].tap()
        app.navigationBars["ChatView"].buttons["返回"].tap()
    }
    
}
