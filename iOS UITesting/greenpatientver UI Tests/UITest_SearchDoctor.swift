//
//  UITest_SearchDoctor.swift
//  greenpatient
//
//  Created by 沙庭宇 on 15/7/17.
//  Copyright © 2015年 kangkanghui. All rights reserved.
//

import Foundation
import XCTest

class UITest_SearchDoctor: XCTestCase {
        
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
    
    //按医院查找医生
    func test00_checkHospitalToDoctor() {
        let app = XCUIApplication()
        app.navigationBars["找医生"].buttons["更多医生"].tap()
        app.childrenMatchingType(.Window).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Table).elementAtIndex(1).childrenMatchingType(.Cell).elementAtIndex(3).staticTexts["上海瑞金"].tap()
        app.tables.staticTexts["心内科"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.navigationBars["医生主页"].buttons["医生列表"].tap()
        
    }
    
    //按疾病搜索医生
    func test00_searchDiseaseToDoctor() {
        let app = XCUIApplication()
        app.tables.textFields["搜索疾病、医生、医院、科室等"].tap()
        app.typeText("小儿感冒")
        let searcher = app.buttons["Search"]
        searcher.doubleTap()
        app.tables.staticTexts["沙医生"].tap()
        app.navigationBars["医生主页"].buttons["搜索结果"].tap()
        
    }
    
    //按医生名称搜索医生
    func test01_searchNameToDoctor() {
        let app = XCUIApplication()
        let textField = app.tables.textFields["搜索疾病、医生、医院、科室等"]
        textField.tap()
        textField.typeText("沙医生")
        
        let searcher = app.buttons["Search"]
        searcher.doubleTap()
        app.tables.staticTexts["沙医生"].tap()
        app.navigationBars["医生主页"].buttons["搜索结果"].tap()
        
    }
    
    //按医院搜索医生
    func test02_searchHospitalToDoctor() {
        let app = XCUIApplication()
        let textField = app.tables.textFields["搜索疾病、医生、医院、科室等"]
        textField.tap()
        textField.typeText("上海瑞金医院")
        app.buttons["Search"].doubleTap()
        app.swipeUp()
        app.tables.staticTexts["沙医生"].tap()
        app.navigationBars["医生主页"].buttons["搜索结果"].tap()
        
    }
    
    //按科室搜索医生
    func test03_searchSectionToDoctor() {
        let app = XCUIApplication()
        let textField = app.tables.textFields["搜索疾病、医生、医院、科室等"]
        textField.tap()
        textField.typeText("心内科")
        app.buttons["Search"].doubleTap()
        for i in 0..<5 {
            app.swipeUp()
            print("滑动第\(i)次")
        }
        app.tables.staticTexts["沙医生"].tap()
        app.navigationBars["医生主页"].buttons["搜索结果"].tap()
    }
    
    //按热词搜索医生
    func test04_searchPopToDoctor() {
        let app = XCUIApplication()
        app.tables.staticTexts["瑞金医院"].tap()
        sleep(3)
        app.swipeUp()
        app.tables.staticTexts["沙医生"].tap()
        app.navigationBars["医生主页"].buttons["搜索结果"].tap()
    }
    
    //查看热门医生
    func test05_checkPopDoctor() {
        let app = XCUIApplication()
        app.tables.childrenMatchingType(.Cell).elementAtIndex(1).tap()
        app.navigationBars["医生主页"].buttons["找医生"].tap()
        
    }
    
    //关注医生
    func test05_attentionDoctor() {
        let app = XCUIApplication()
        let doctor = app.tables.childrenMatchingType(.Cell).elementAtIndex(1)
        doctor.tap()
        let nav = app.navigationBars["医生主页"]
        nav.buttons["+关注"].tap()
        nav.buttons["找医生"].tap()
        doctor.tap()
        app.tables.buttons["取消关注"].tap()
        app.alerts["取消关注后，您将不再收到医生的群发消息，医生也将从收藏医生界面删除"].buttons["取消关注"].tap()
        sleep(2)
        nav.buttons["找医生"].tap()
        
    }
    

}
