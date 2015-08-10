//
//  UITest_Message.swift
//  GreenDoctor
//
//  Created by 沙庭宇 on 15/7/3.
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
        sleep(3)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //判断控件是否存在
    func canOperateElement(element: XCUIElement?) -> Bool {
        if element != nil {
            if element!.exists {
                return true
            }
        }
        return false
    }
    //查看系统消息
    func test00_checkSysMsg() {
        let app = XCUIApplication()
        app.tables.staticTexts["系统消息"].tap()
        app.swipeDown()
        app.navigationBars.textViews["系统消息"]
    }
    
    //搜索消息
    func test01_searchMsg() {
        let app = XCUIApplication()
        app.swipeDown()
        let table = app.tables
        table.searchFields["Search"].tap()
        table.searchFields["Search"].typeText("青苹果")
        app.keyboards.buttons["search"].tap()
        app.tables["Empty list"].childrenMatchingType(.Cell).elementAtIndex(1).staticTexts["青苹果客服"].tap()
        app.navigationBars["ChatView"].buttons["消息"].tap()
        
    }
    
    //搜索患者
    func test02_searchPat() {
        let app = XCUIApplication()
        app.swipeDown()
        let table = app.tables
        table.searchFields["Search"].tap()
        table.searchFields["Search"].typeText("青苹果")
        app.keyboards.buttons["search"].tap()
        app.tables["Empty list"].childrenMatchingType(.Cell).elementAtIndex(0).staticTexts["青苹果客服"].tap()
        app.navigationBars["ChatView"].buttons["消息"].tap()
        
    }
    
    //发送文本
    func test03_sendText() {
        let app = XCUIApplication()
        app.tables.staticTexts["熟悉患者A"].tap()
        
        let textView = app.childrenMatchingType(.Window).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(3).childrenMatchingType(.Unknown).elementAtIndex(2).childrenMatchingType(.TextView).elementAtIndex(0)
        textView.tap()
        textView.typeText("你好")
        app.buttons["Send"].tap()
    }
    
    //发送语音
    func test04_sendVoice() {
        let app = XCUIApplication()
        app.tables.staticTexts["熟悉患者A"].tap()
        app.buttons["input rec"].tap()
        app.staticTexts["按住说话"].pressForDuration(5)
        sleep(1)
        
    }
    //修改免费通过手机号
    func test05_editFreePhoneNum() {
        let app = XCUIApplication()
        app.tables.staticTexts["熟悉患者A"].tap()
        app.buttons["input attach"].tap()
        
        let element = app.descendantsMatchingType(.Unknown)
        element.buttons["more freecall"].tap()
        element.buttons["修改》"].tap()
        
        let textField = app.textFields["请输入手机号码..."]
        textField.typeText("17000000019")
        
        app.buttons["修改"].tap()
        XCTAssert(self.canOperateElement(element.staticTexts["17000000019"]), "修改手机号失败")
    app.navigationBars["免费通话"].childrenMatchingType(.Button).matchingIdentifier("Back").elementAtIndex(0).tap()
        
    }
    //发送常用语
    func test06_sendTemplate() {
        let app = XCUIApplication()
        app.tables.staticTexts["熟悉患者A"].tap()
        app.buttons["input attach"].tap()
        app.descendantsMatchingType(.Unknown).buttons["more template"].tap()
        app.tables.staticTexts["你提供的资料还不够完整，请上传更多检查材料"].tap()
        app.childrenMatchingType(.Window).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(3).childrenMatchingType(.Unknown).elementAtIndex(2).childrenMatchingType(.TextView).elementAtIndex(0).typeText("\n")
        app.buttons["Send"].tap()
        
    }
    
    //新增常用语
    func test07_newTemplate() {
        let app = XCUIApplication()
        app.tables.staticTexts["你提供的资料还不够完整，请上传更多检查材料"].tap()
        app.buttons["input attach"].tap()
        app.descendantsMatchingType(.Unknown).buttons["more template"].tap()
        app.buttons["新增常用语"].tap()
        app.typeText("常来")
        app.navigationBars["新建常用语"].buttons["保存"].tap()
        
    }
    
    //修改常用语
    func test08_editTemplate() {
        let app = XCUIApplication()
        app.tables.staticTexts["你提供的资料还不够完整，请上传更多检查材料"].tap()
        app.buttons["input attach"].tap()
        app.descendantsMatchingType(.Unknown).buttons["more template"].tap()
        
        let navigationBar = app.navigationBars["我的常用语"]
        navigationBar.buttons["Edit"].tap()
        app.tables.staticTexts["常来"].pressForDuration(1)
        app.typeText("玩")
        app.navigationBars["编辑常用语"].buttons["保存"].tap()
        navigationBar.buttons["Done"].tap()
        
    }
    //删除常用语
    func test09_delectTemplate() {
        let app = XCUIApplication()
        app.tables.staticTexts["女20岁"].tap()
        app.buttons["input attach"].tap()
        app.descendantsMatchingType(.Unknown).buttons["more template"].tap()
        
        let navigationBar = app.navigationBars["我的常用语"]
        navigationBar.buttons["Edit"].tap()
        app.tables.buttons["Delete 常来玩"].tap()
        app.tables.childrenMatchingType(.Cell).elementAtIndex(0).childrenMatchingType(.Button).matchingIdentifier("Delete").elementAtIndex(0).tap()
        navigationBar.buttons["Done"].tap()
       
    }
    
    //群发通知
    func test10_sendNotification() {
        let app = XCUIApplication()
        app.navigationBars["消息"].buttons["群发"].tap()
        app.buttons["新建群发"].tap()
        app.tables.childrenMatchingType(.Cell).elementAtIndex(0).childrenMatchingType(.TextView).elementAtIndex(0).tap()
        app.typeText("通知大家")
        app.typeText("\n")
        app.tables.buttons["发送"].tap()
        app.tables.staticTexts["全部 (3人)"].tap()
        app.alerts["确定发送给所有患者(3人)吗？"].collectionViews.buttons["确定"].tap()
        sleep(3)
        app.navigationBars["群发"].buttons["消息"].tap()
        
    }
        
    //群发文章
    func test11_sendAcitel() {
        let app = XCUIApplication()
        app.navigationBars["消息"].buttons["群发"].tap()
        app.buttons["新建群发"].tap()
        app.buttons["文章"].tap()
        
        let textField = app.tables.textFields["请输入标题"]
        textField.tap()
        textField.typeText("新文章标题")
        app.keyboards.buttons["done"].tap()
        let textField2 = app.tables.childrenMatchingType(.Cell).elementAtIndex(2).childrenMatchingType(.TextView).elementAtIndex(0)
        textField2.tap()
        textField2.typeText("新文章内容")
        app.typeText("\n")
        app.tables.buttons["保存/预览"].tap()
        app.buttons["发布"].tap()
        app.alerts["确定发送文章给所有患者（3人）吗？"].collectionViews.buttons["发送"].tap()
        sleep(3)
        app.navigationBars["群发"].buttons["消息"].tap()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的文章"].tap()
        app.tables.staticTexts["新文章标题"].tap()
        app.navigationBars["新文章标题"].buttons["我的文章"].tap()
        let cell = app.tables.childrenMatchingType(.Cell).elementAtIndex(0)
        cell.buttons["article more"].tap()
        cell.buttons[" 删除"].tap()
        app.alerts["确定删除吗?"].buttons["删除"].tap()
        
        
    }
    
    //保存草稿
    func test12_saveDraft() {
        let app = XCUIApplication()
        app.navigationBars["消息"].buttons["群发"].tap()
        app.buttons["新建群发"].tap()
        app.buttons["文章"].tap()
        let textField = app.tables.textFields["请输入标题"]
        textField.tap()
        textField.typeText("群发文章标题")
        app.typeText("\n")
        let textField2 = app.tables.childrenMatchingType(.Cell).elementAtIndex(2).childrenMatchingType(.TextView).elementAtIndex(0)
        textField2.tap()
        textField2.typeText("群发文章内容")
        app.typeText("\n")
        app.buttons["保存/预览"].tap()
        app.navigationBars["文章预览"].buttons["新建群发"].tap()
        app.navigationBars["新建群发"].buttons["取消"].tap()
        app.navigationBars["群发"].buttons["消息"].tap()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的文章"].tap()
        app.buttons["草稿箱"].tap()
        app.tables.staticTexts["群发文章标题"].tap()
        app.navigationBars["群发文章"].buttons["取消"].tap()
        app.sheets.buttons["放弃编辑"].tap()
        app.tables.childrenMatchingType(.Cell).elementAtIndex(0).buttons["article draft delete"].tap()
        app.alerts["确定删除吗?"].buttons["删除"].tap()
        
    }
    
    //编辑草稿并发送
    func test13_editDraftAndSend() {
        let app = XCUIApplication()
        app.navigationBars["消息"].buttons["群发"].tap()
        app.buttons["新建群发"].tap()
        app.buttons["文章"].tap()
        let textField = app.tables.textFields["请输入标题"]
        textField.tap()
        textField.typeText("新建草稿并发送")
        let textField2 = app.tables.childrenMatchingType(.Cell).elementAtIndex(2).childrenMatchingType(.TextView).elementAtIndex(0)
        textField2.tap()
        textField2.typeText("新建文章内容")
        app.buttons["保存/预览"].tap()
        app.navigationBars["文章预览"].buttons["新建群发"].tap()
        app.navigationBars["新建群发"].buttons["取消"].tap()

        app.navigationBars["群发"].buttons["消息"].tap()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的文章"].tap()
        app.buttons["草稿箱"].tap()
        app.tables.staticTexts["新建草稿并发送"].tap()
        app.navigationBars["群发文章"].buttons["预览"].tap()
        app.buttons["发布"].tap()
        app.alerts["确定发送文章给所有患者（3人）吗？"].buttons["发送"].tap()
        sleep(3)
        app.buttons["已发布"].tap()
        app.tables.staticTexts["新建草稿并发送"].tap()
        app.navigationBars["新建草稿并发送"].buttons["我的文章"].tap()
        let cell = app.tables.childrenMatchingType(.Cell).elementAtIndex(0)
        cell.buttons["article more"].tap()
        cell.buttons[" 删除"].tap()
        app.alerts["确定删除吗?"].buttons["删除"].tap()

    }
    
    
}
