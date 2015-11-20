//
//  UITest_Setting.swift
//  GreenDoctor
//
//  Created by 沙庭宇 on 15/7/2.
//  Copyright © 2015年 kangkanghui. All rights reserved.
//

import Foundation
import XCTest

class UITest_Setting: XCTestCase {
        
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
    
    //关闭、开启图文咨询
    func test00_switchMsg() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()

        app.tables.staticTexts["图文咨询"].tap()
        
        let msgSwitch = app.tables.switches["是否开启图文咨询"]
        msgSwitch.tap()
        msgSwitch.tap()

        app.navigationBars["图文咨询"].buttons[" 返回"].tap()
    }
    
    //设置陌生患者收费价格“免费”
    func test01_setDoorsill() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["图文咨询"].tap()
        app.tables.staticTexts["陌生患者收费价格"].tap()
        app.tables.staticTexts["免费"].tap()
        app.navigationBars["陌生患者收费价格"].buttons["返回"].tap()
        app.navigationBars["图文咨询"].buttons[" 返回"].tap()
        
    }
    
    //关闭、开启电话咨询
    func test02_switchPhone() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["电话咨询"].tap()
        
        let phoneSwitch = app.tables.switches["是否开启电话咨询"]
        phoneSwitch.tap()
        phoneSwitch.tap()
        app.navigationBars["电话咨询"].buttons[" 返回"].tap()
        
    }
    
    //关闭、开启配药服务
    func test03_switchDosage() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["配药服务"].tap()
        
        let dosageSwitch = app.tables.switches["是否开启配药服务"]
        dosageSwitch.tap()
        dosageSwitch.tap()
        app.navigationBars["配药服务"].buttons[" 返回"].tap()
        
    }
    
    //关闭、开启预约加号
    func test04_switchAdd() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["预约加号"].tap()
        
        let addSwitch = app.tables.switches["是否开启预约加号"]
        addSwitch.tap()
        addSwitch.tap()
        app.navigationBars["加号时段"].buttons["返回"].tap()
        app.navigationBars["预约加号"].buttons[" 返回"].tap()
        
    }
    
    //关闭、开启患者转诊
    func test05_switchTransfer() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["患者转诊"].tap()
        
        let transferSwitch = app.tables.switches["接收转诊"]
        transferSwitch.tap()
        transferSwitch.tap()
        app.navigationBars["患者转诊"].buttons["返回"].tap()
        
    }
    
    //新建患者标签
    /**

    func test06_newPatientTag() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["患者标签"].tap()
        app.tables.staticTexts["新建标签"].tap()
        app.typeText("ganmao")
        app.buttons["感冒"].tap()
        app.tables.staticTexts["小儿感冒"].tap()
        app.navigationBars["新建标签"].buttons["确定"].tap()
        
        sleep(3)
        app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).tap()
        app.tables.staticTexts["从陌生患者导入（1人）"].tap()
        
        
        
        let table = app.tables
        table.cells.childrenMatchingType(.Button).elementBoundByIndex(0).tap()
        
        let navigationBar = app.navigationBars["添加患者"]
        navigationBar.buttons["添加患者"].tap()
        navigationBar.buttons["确定(1)"].tap()
        app.navigationBars["标签编辑"].buttons["标签"].tap()
        app.navigationBars["标签"].buttons["设置"].tap()
        
    }
    
    //修改患者标签
    func test07_editPatientTag() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["患者标签"].tap()
        app.tables.staticTexts["小儿感冒"].tap()
        app.tables.staticTexts["陌生患者A"].tap()
        app.navigationBars["添加患者"].buttons["标签编辑"].tap()

        app.tables.staticTexts["陌生患者A"].tap()
        app.tables.buttons["delete"].tap()
        
        XCUIApplication().tables.buttons["delete"].tap()
        
        app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).tap()
        
        let table = app.tables
        table.childrenMatchingType(.Cell).elementBoundByIndex(1).childrenMatchingType(.Button).elementBoundByIndex(0).tap()
        app.navigationBars["添加患者"].buttons["确定(1)"].tap()
        app.navigationBars["标签编辑"].buttons["标签"].tap()
        
    }
    
    //删除患者标签
    func test08_deletePatientTag() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["患者标签"].tap()
        app.tables.staticTexts["小儿感冒"].tap()
        app.tables.staticTexts["删除标签"].tap()
        app.alerts["该标签已有患者添加，确定删除？"].collectionViews.buttons["删除"].tap()
        app.navigationBars["标签"].buttons["设置"].tap()
        
    }
    
**/
    //查看APP客服
    func test09_checkAppCSE() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["联系客服"].tap()
        app.sheets.collectionViews.buttons["APP客服"].tap()
        app.navigationBars["ChatView"].buttons["设置"].tap()
        
    }
    
    //查看微信客服
    func test10_checkWechatCSE() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["联系客服"].tap()
        app.sheets.collectionViews.buttons["微信客服"].tap()
        app.alerts["青苹果健康微信客服号：qpgjk01，添加成为好友随时咨询。"].collectionViews.buttons["好的"].tap()
        
    }
    
    //更多--移除、加入黑名单患者
    func test11_removeBlackPatient() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.swipeUp()
        app.tables.staticTexts["更多"].tap()
        app.tables.staticTexts["患者黑名单"].tap()
        app.tables.staticTexts["黑名单患者A"].tap()
        
        let navigationBar = app.navigationBars["患者资料"]
        navigationBar.buttons["more new"].tap()
        app.tables.switches["加入黑名单"].tap()
        app.navigationBars["患者设置"].buttons["患者资料"].tap()
        app.tables.buttons["发送消息"].tap()
        app.navigationBars["ChatView"].buttons["患者资料"].tap()
        navigationBar.buttons["患者黑名单"].tap()
        app.navigationBars["患者黑名单"].buttons["更多"].tap()
        app.navigationBars["更多"].buttons["设置"].tap()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["4"].tap()
        app.tables.staticTexts["陌生患者 (2人)"].tap()
        
        let aStaticText = app.tables.staticTexts["黑名单患者A"]
        aStaticText.tap()
        
        let navigationBar2 = app.navigationBars["患者资料"]
        navigationBar2.buttons["more new"].tap()
        app.tables.switches["加入黑名单"].tap()
        app.alerts["加入黑名单，您将不再收到患者的消息。您可在设置里更改黑名单状态"].collectionViews.buttons["确定"].tap()
        app.navigationBars["患者设置"].buttons["患者资料"].tap()
        navigationBar2.buttons["陌生患者"].tap()
        app.navigationBars["陌生患者"].buttons["患者(4人)"].tap()
        app.navigationBars["患者(3人)"].buttons["我"].tap()
        app.tabBars.buttons["设置"].tap()
        app.swipeUp()
        app.tables.staticTexts["更多"].tap()
        app.tables.staticTexts["患者黑名单"].tap()
        aStaticText.tap()
        
    }
    
    //查看新功能介绍
    func test13_checkNewFunctionIntroduction() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.swipeUp()
        app.tables.staticTexts["更多"].tap()
        app.tables.staticTexts["新功能介绍"].tap()
        
        app.staticTexts["自定义欢迎语"].tap()

        
        app.navigationBars["新功能介绍"].buttons["更多"].pressForDuration(3)
        
    }
    
    //查看常见问题
    func test14_checkQuestions() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.swipeUp()
        app.tables.staticTexts["更多"].tap()
        app.tables.staticTexts["常见问题"].tap()
        sleep(3)
        app.staticTexts["找不到我所在的医院怎么办？"].tap()
        app.staticTexts["为什么看不到任何内容？"].tap()
        app.staticTexts["电话咨询如何收费？"].tap()
        app.staticTexts["图文咨询是免费的吗？"].tap()
        app.navigationBars["常见问题"].buttons["更多"].tap()
        app.navigationBars["更多"].buttons["设置"].tap()
        
    }
    
    //查看关于我们
    func test15_checkAbout() {
    
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.swipeUp()
        app.tables.staticTexts["更多"].tap()
        app.tables.staticTexts["关于我们"].tap()
        app.tables.staticTexts["给个好评"].tap()
        app.alerts["亲，喜欢就给个五星好评吧^_^"].collectionViews.buttons["残忍地拒绝"].tap()
        app.tables.staticTexts["免责声明"].tap()
        app.navigationBars["免责声明"].buttons["关于我们"].tap()
        app.navigationBars["关于我们"].buttons["更多"].tap()
    }
    
    //查看新消息推送
    func test16_checkNotification() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.swipeUp()
        app.tables.staticTexts["更多"].tap()
        app.tables.staticTexts["新消息推送"].tap()
        app.alerts["推送设置"].collectionViews.buttons["好的"].tap()
        app.navigationBars["更多"].buttons["设置"].tap()
        
    }
    
    //下载聊天记录
    func test17_downloadMsg() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.swipeUp()
        app.tables.staticTexts["更多"].tap()
        app.tables.staticTexts["下载聊天记录"].tap()
        app.alerts["是否下载聊天记录？"].collectionViews.buttons["下载"].tap()
        sleep(5)
        app.navigationBars["更多"].buttons["设置"].tap()
        
    }
    
    //退出登录
    func test18_logOut() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.swipeUp()
        app.tables.staticTexts["更多"].tap()
        app.tables.buttons["退出登录"].tap()
        app.sheets["确定退出吗?"].collectionViews.buttons["退出"].tap()
        app.buttons["用户协议"].tap()
        app.navigationBars["用户协议"].buttons["登录"].tap()
        
    }
    
    //设置自定义文本欢迎语
    func test19_setCustomTextIntroduction() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["图文咨询"].tap()
        app.tables.staticTexts["我的欢迎语"].tap()
        app.tables.textViews["感谢您的关注，我会利用空闲时间，在专业范围内尽量回答您的提问。"].tap()
        app.tables.textViews["感谢您的关注，我会利用空闲时间，在专业范围内尽量回答您的提问。"].typeText("新增欢迎语")
        app.keyboards.buttons["done"].tap()
        app.swipeDown()
        app.navigationBars["我的欢迎语"].buttons["返回"].tap()
        app.tables.staticTexts["我的欢迎语"].tap()
        app.tables.textViews["新增欢迎语感谢您的关注，我会利用空闲时间，在专业范围内尽量回答您的提问。"].pressForDuration(1)
        app.menuItems["Select All"].tap()
        app.keys["Delete"].tap()
        app.typeText("感谢您的关注，我会利用空闲时间，在专业范围内尽量回答您的提问。")
        app.keyboards.buttons["done"].tap()
        app.navigationBars["我的欢迎语"].buttons["返回"].tap()
    }

//    设置自定义语音欢迎语
//    Disable原因：语音删除有bug，导致无法运行该case
    func test20_setCustomVoidIntroduction() {
        let app = XCUIApplication()
        app.tabBars.buttons["设置"].tap()
        app.tables.staticTexts["图文咨询"].tap()
        app.tables.staticTexts["我的欢迎语"].tap()
        app.tables.staticTexts["语音"].tap()
        app.tables.staticTexts["按住录音"].pressForDuration(5)
        let goback = app.navigationBars["我的欢迎语"].buttons["返回"]
        goback.tap()
        sleep(1)
        app.tables.staticTexts["我的欢迎语，语音"].tap()
        app.buttons["删除重录"].tap()
        app.alerts["确定删除吗？"].buttons["删除"].tap()
        goback.tap()
        app.alerts["您忘记录制语音啦~"].buttons["好的"].tap()
        app.tables.staticTexts["文字"].tap()
        goback.tap()
        sleep(1)
    }
    
}
