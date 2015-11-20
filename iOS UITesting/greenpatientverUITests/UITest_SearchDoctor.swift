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
        app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Table).elementBoundByIndex(1).childrenMatchingType(.Cell).elementBoundByIndex(3).staticTexts["上海瑞金"].tap()
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
        var temp = true
        let app = XCUIApplication()
        let textField = app.tables.textFields["搜索疾病、医生、医院、科室等"]
        textField.tap()
        textField.typeText("上海瑞金医院")
        app.buttons["Search"].doubleTap()
        while temp {
            if app.tables.staticTexts["沙医生"].exists{
                app.tables.staticTexts["沙医生"].tap()
                temp = false
                break
            }
            app.swipeUp()
        }
        app.navigationBars["医生主页"].buttons["搜索结果"].tap()
        
    }
    
    //按科室搜索医生
    func test03_searchSpecialtyToDoctor() {
        var temp = true
        let app = XCUIApplication()
        let textField = app.tables.textFields["搜索疾病、医生、医院、科室等"]
        textField.tap()
        textField.typeText("心内科")
        app.buttons["Search"].doubleTap()
        while temp {
            if app.tables.staticTexts["沙医生"].exists{
                app.tables.staticTexts["沙医生"].tap()
                temp = false
                break
            }
            app.swipeUp()
        }
        app.tables.staticTexts["沙医生"].tap()
        app.navigationBars["医生主页"].buttons["搜索结果"].tap()
    }
    
    //按热词搜索医生
    func test04_searchPopToDoctor() {
        var temp = true
        let app = XCUIApplication()
        app.tables.staticTexts["瑞金医院"].tap()
        sleep(5)
        while temp {
            if app.tables.staticTexts["沙医生"].exists{
                app.tables.staticTexts["沙医生"].tap()
                temp = false
            }
            app.swipeUp()
        }
        app.navigationBars["医生主页"].buttons["搜索结果"].tap()
    }
    
    //查看热门医生
    func test05_checkPopDoctor() {
        let app = XCUIApplication()
        app.tables.childrenMatchingType(.Cell).elementBoundByIndex(1).tap()
        app.navigationBars["医生主页"].buttons["找医生"].tap()
        
    }
    
    //关注医生
    func test05_attentionDoctor() {
        let app = XCUIApplication()
        let doctor = app.tables.childrenMatchingType(.Cell).elementBoundByIndex(1)
        doctor.tap()
        let nav = app.navigationBars["医生主页"]
        nav.buttons["+关注"].tap()
        nav.buttons["找医生"].tap()
        doctor.tap()
        for _ in 0..<2 {
            app.swipeUp()
        }
        app.tables.buttons["取消关注"].tap()
        app.alerts.buttons["取消关注"].tap()
        sleep(2)
        nav.buttons["找医生"].tap()
        
    }
    

}
