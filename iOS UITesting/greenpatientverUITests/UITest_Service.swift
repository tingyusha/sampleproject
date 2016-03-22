//
//  UITest_Service.swift
//  greenpatient
//
//  Created by 沙庭宇 on 15/7/17.
//  Copyright © 2015年 kangkanghui. All rights reserved.
//

import Foundation
import XCTest

class UITest_Service: XCTestCase {
        
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
    
    //查看配药服务
    func test00_drugService() {
        let app = XCUIApplication()
        app.tabBars.buttons["我的服务"].tap()
        app.tables.elementBoundByIndex(0).childrenMatchingType(.Cell).elementBoundByIndex(1).tap()
        app.tables.childrenMatchingType(.Cell).elementBoundByIndex(1).tap()
        sleep(1)
        app.navigationBars.childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        app.tables.buttons["    联系客服"].tap()
        app.alerts["是否拨打客服电话: 400-063-0086"].collectionViews.buttons["取消"].pressForDuration(0.6);
        app.navigationBars["DrugOrderDetailTableView"].buttons["我的服务"].tap()
        
    }
    
    //查看电话咨询
    func test01_consulfPhone() {
        let app = XCUIApplication()
        app.tabBars.buttons["我的服务"].tap()
        app.buttons["电话"].tap()
        sleep(1)
        app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0).tap()
        app.tables.childrenMatchingType(.Cell).staticTexts["咨询原因"].tap()
        app.navigationBars["咨询原因"].buttons["沙医生-预约"].tap()
        app.navigationBars["沙医生-预约"].buttons["我的服务"].tap()
        
    }
    
    //查看预约加号
    func test02_appointmentPlusSign() {
        let app = XCUIApplication()
        app.tabBars.buttons["我的服务"].tap()
        app.buttons["加号"].tap()
        sleep(1)
        app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0).tap()
        app.tables.buttons["加快审核"].tap()
        app.navigationBars["预约电话咨询"].buttons["加号服务"].tap()
        app.navigationBars["加号服务"].buttons["我的服务"].tap()
        
    }
}
