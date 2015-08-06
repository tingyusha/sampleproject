//
//  UITest_DoctorCircle.swift
//  GreenDoctor
//
//  Created by 沙庭宇 on 15/7/2.
//  Copyright © 2015年 kangkanghui. All rights reserved.
//

import Foundation
import XCTest

class UITest_DoctorCircle: XCTestCase {
        
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
 
    //按医生名搜索医生
    func test00_searchDoctorName() {
        let app = XCUIApplication()
        app.tabBars.buttons["医生圈"].tap()
        app.navigationBars["医生圈"].buttons["找医生"].tap()
        app.tables.textFields["搜索医生"].tap()
        app.textFields["搜索医生"].typeText("吴坚炯")
        app.buttons["done"].tap()
        sleep(3)
        app.tables.staticTexts["副主任医师"].tap()
        sleep(2)
        app.navigationBars["医生详情"].buttons["找医生"].tap()
        
    }
    //按通讯录匹配
    func test01_searchAddress() {
        let app = XCUIApplication()
        app.tabBars.buttons["医生圈"].tap()
        app.navigationBars["医生圈"].buttons["找医生"].tap()
        app.staticTexts["从通讯录匹配"].tap()
        app.buttons["开始匹配"].tap()
        if app.alerts.count>0 {
            app.alerts["“青苹果医生版” Would Like to Access Your Contacts"].collectionViews.buttons["OK"].tap()
        }
        app.navigationBars["医生列表"].buttons["通讯录匹配"].tap()
        app.navigationBars["通讯录匹配"].buttons["找医生"].tap()
    
    }
    
    //按医院查找医生
    func test02_searchHospital() {
        let app = XCUIApplication()
        app.tabBars.buttons["医生圈"].tap()
        app.navigationBars["医生圈"].buttons["找医生"].tap()
        app.tables.staticTexts["按医院科室找"].tap()
        app.childrenMatchingType(.Window).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Table).elementAtIndex(1).childrenMatchingType(.Cell).elementAtIndex(3).staticTexts["上海瑞金"].tap()
        app.tables.staticTexts["心内科"].tap()
        app.tables.staticTexts["陆国平"].tap()
        
    }
    //换一批可能认识的人
    func test03_renewalFriend() {
        let app = XCUIApplication()
        app.tabBars.buttons["医生圈"].tap()
        app.tables.buttons["换一批"].tap()
    }
    
    //查看排行榜医生详情
    func test04_checkRankingDoctorDetail() {
        let app = XCUIApplication()
        app.tabBars.buttons["医生圈"].tap()
        app.tables.childrenMatchingType(.Cell).elementAtIndex(0).childrenMatchingType(.StaticText).matchingIdentifier("全国专家礼物榜").elementAtIndex(0).tap()
        app.tables.staticTexts["4"].tap()
        app.navigationBars["医生详情"].childrenMatchingType(.Button).matchingIdentifier("Back").elementAtIndex(0).tap()
        
    }
    
    //查看我赞过的、赞过我的
    func test05_fromMeAndToMe() {
        let app = XCUIApplication()
        app.tabBars.buttons["医生圈"].tap()
        app.tables.staticTexts["赞过我的"].tap()
        
        let navigationBar = app.navigationBars["赞过我的"]
        navigationBar.buttons["我赞过的"].tap()
        app.navigationBars["我赞过的"].buttons["赞过我的"].tap()
        navigationBar.buttons["医生圈"].tap()
        
    }
    
    //赞“我可能认识的人”后查看“我赞过的人”
    func test06_favourRenewalFriend() {
        let app = XCUIApplication()
        app.tabBars.buttons["医生圈"].tap()
        app.tables.childrenMatchingType(.Cell).elementAtIndex(3).buttons[" 赞"].tap()
        app.tables.buttons[" 已赞"].tap()
        app.navigationBars.buttons["医生圈"].tap()
        app.tables.staticTexts["赞过我的"].tap()
        
        let navigationBar = app.navigationBars["赞过我的"]
        navigationBar.buttons["我赞过的"].tap()
        app.navigationBars["我赞过的"].buttons["赞过我的"].tap()
        navigationBar.buttons["医生圈"].tap()
        
    }
    
}
