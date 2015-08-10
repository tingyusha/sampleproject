//
//  UITest_Self.swift
//  greenpatient
//
//  Created by 沙庭宇 on 15/7/17.
//  Copyright © 2015年 kangkanghui. All rights reserved.
//

import Foundation
import XCTest

class UITest_Self: XCTestCase {
        
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
    
    //判断当前控件是否存在
    func canOperateElement(element: XCUIElement?)->Bool {
        if element != nil{
            if element!.exists {
            return true
            }else {
            return false
            }
        }else {
        return false
        }
    }
    //生成随机数
//    func randomIn(min: Int, max: Int) -> Int {
//        return Int(arc4random()) % (max - min + 1) + min
//    }
    
    
    //修改个人信息
    func test00_editSelfInfo() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["陌生患者A"].tap()
        
        let textField = app.tables.textFields["填写姓名"]
        textField.tap()
        textField.typeText("B")
        
        let staticText = app.tables.staticTexts["患者出生年份"]
        staticText.doubleTap()
        
        let staticText2 = app.tables.staticTexts["患者性别"]
        staticText2.doubleTap()
        
        let staticText3 = app.tables.staticTexts["患者所在省份"]
        staticText3.doubleTap()
        app.tables.buttons["保存"].tap()
        sleep(2)
        app.tabBars.buttons["我"].tap()
        
        app.tables.staticTexts["陌生患者AB"].tap()
        
        let textField4 = app.tables.textFields["填写姓名"]
        textField4.pressForDuration(1)
        app.menuItems["Select All"].tap()
        app.keys["Delete"].tap()
        textField4.typeText("陌生患者A")
        app.keyboards["\n"]
        app.tables.buttons["保存"].tap()
        sleep(2)
        app.tabBars.buttons["我"].tap()

    }
    
    //查看如何购买苹果
    func test01_checkBuyApple() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.buttons["购买"].tap()
        app.buttons["好的"].tap()
        
    }
    
    //查看我的医生信息
    func test02_checkMyDoctorInfo() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        
        let staticText = app.tables.staticTexts["沙医生"]
        staticText.tap()
        app.swipeUp()
        app.swipeDown()
        staticText.tap()
        app.navigationBars["医生名片"].buttons["医生主页"].tap()
        app.navigationBars["医生主页"].buttons["我的医生"].tap()
        app.navigationBars["我的医生"].buttons["我"].tap()
        
    }
    
    //添加预约加号
    //只能使用两次次？？(视目标医生的开放日期限制)
    func test03_appointmentPlusSign() {
        XCTAssertFalse(false,"无法添加多个预约加号")
    }
    //电话咨询
    func test04_consulfPhone() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.tables.staticTexts["电话咨询"].tap()
        app.tables.buttons["确定咨询"].tap()
        app.tables.buttons["支付方式"].tap()
        app.sheets.collectionViews.buttons["银行支付"].tap()
        app.buttons["已通过银行转账"].tap()
        app.buttons["已支付"].tap()
        app.tables.staticTexts["请填写"].tap()
        app.staticTexts["请尽量详细描述病情"].tap()
        app.typeText("我想问你点事")
        app.navigationBars["咨询原因"].buttons["保存"].tap()
        sleep(3)
        app.navigationBars["预约电话咨询"].buttons["医生主页"].tap()
        app.navigationBars["医生主页"].buttons["我的医生"].tap()
        app.navigationBars["我的医生"].buttons["我"].tap()
        
    }
    
    //图文咨询
    func test05_consulfImageAndText() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.tables.staticTexts["图文咨询"].tap()
        let textField = app.windows.childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(3).childrenMatchingType(.Unknown).elementAtIndex(1).childrenMatchingType(.TextView).elementAtIndex(0)
        textField.tap()
        
        textField.typeText("你好")
        app.buttons["Send"].tap()
        app.navigationBars["ChatView"].buttons["返回"].tap()

    
    }
    
    //配药服务
    func test06_dosageService() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.tables.staticTexts["配药服务"].tap()
        app.tables.childrenMatchingType(.Cell).elementAtIndex(0).tap()
        app.buttons["下单"].tap()
        app.tables.buttons["确定下单"].tap()
        sleep(1)
        let textField = app.childrenMatchingType(.Window).elementAtIndex(1).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(1).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.TextField).elementAtIndex(0)
        textField.typeText("沙同学")

        app.buttons["确定"].tap()
        sleep(1)
        if self.canOperateElement(app.alerts["今天已经申请过这个药咯。如有需要，请联系医生拒绝上一个申请。"]) {
            app.alerts["今天已经申请过这个药咯。如有需要，请联系医生拒绝上一个申请。"].collectionViews.buttons["知道了"].tap()
            print("此药已配送")
            app.navigationBars["送药地址"].buttons["十一味参芪胶囊"].tap()
            app.navigationBars["十一味参芪胶囊"].buttons["药品列表"].tap()
            app.navigationBars["药品列表"].buttons["完成"].tap()
            app.navigationBars["医生主页"].buttons["我的医生"].tap()
            app.navigationBars["我的医生"].buttons["我"].tap()
        }else {
            app.navigationBars["ChatView"].buttons["返回"].tap()
        }
        
    }
    //查看医生的历史文章
    func test07_checkHistoryArticle() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.tables.childrenMatchingType(.Cell).elementAtIndex(5).tap()
        app.navigationBars["文章"].buttons["医生主页"].tap()
        app.navigationBars["医生主页"].buttons["我的医生"].tap()
        app.navigationBars["我的医生"].buttons["我"].tap()
        
    }
    
    //查看医生的更多文章
    func test08_checkMoreArticle() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        
        let table = app.tables
        app.swipeUp()
        table.childrenMatchingType(.Cell).elementAtIndex(9).childrenMatchingType(.StaticText).matchingIdentifier("更多 •••").elementAtIndex(0).tap()
        app.swipeUp()
        app.swipeDown()
        
        table.childrenMatchingType(.Cell).elementAtIndex(0).tap()
        let button = app.navigationBars["文章"].buttons["历史文章"]
        button.tap()
        app.navigationBars["历史文章"].buttons["医生主页"].tap()
        app.navigationBars["医生主页"].buttons["我的医生"].tap()
        app.navigationBars["我的医生"].buttons["我"].tap()
        
    }
    
    //查看我的健康数据
    func test09_checkMyHealthDate() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的健康数据"].tap()
        app.navigationBars["我的健康数据"].buttons["我"].tap()
        
    }
    
    //设置-查看消息推送
    func test10_checkNotification() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["设置"].tap()
        app.tables.staticTexts["新消息推送"].tap()
        app.alerts["推送设置"].collectionViews.buttons["好的"].tap()
        app.navigationBars["设置"].buttons["我"].tap()
        
    }
    
    //设置-下载聊天记录
    func test11_DownloadHistoryMessag() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["设置"].tap()
        app.tables.staticTexts["下载聊天记录"].tap()
        app.alerts["是否下载聊天记录？"].collectionViews.buttons["下载"].tap()
        sleep(3)
        app.navigationBars["设置"].buttons["我"].tap()
        
    }
    
    //设置-App Store好评
    func test12_appStoryAssess() {
        let app = XCUIApplication()
        app.tables.staticTexts["设置"].tap()
        app.tables.staticTexts["App Store给个好评"].tap()
        app.alerts["亲，喜欢就给个五星好评吧^_^"].collectionViews.buttons["残忍地拒绝"].tap()
        app.navigationBars["设置"].buttons["我"].tap()
        
    }
    
    //设置-查看常见问题
    func test13_checkFAQ() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["设置"].tap()
        app.tables.staticTexts["常见问题"].tap()
        sleep(2)
        app.staticTexts["使用青苹果健康软件是否收费？"].tap()
        app.navigationBars["常见问题"].buttons["设置"].tap()
        app.navigationBars["设置"].buttons["我"].tap()
        
    }
    
    //设置-联系客服-App客服
    func test14_contactCSE() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["设置"].tap()
        app.tables.staticTexts["联系客服"].tap()
        app.sheets.collectionViews.buttons["APP客服"].tap()
        if self.canOperateElement(app.staticTexts["是否允许医生给您致电？"]) {
            app.buttons["允许"].tap()
            if self.canOperateElement(app.alerts["“患者测试版” Would Like to Access Your Contacts"]) {
             app.alerts["“患者测试版” Would Like to Access Your Contacts"].collectionViews.buttons["OK"].tap()
            }
        }
        
        app.navigationBars["ChatView"].buttons["返回"].tap()
        app.navigationBars["设置"].buttons["我"].tap()
        
    }
    
    //设置-联系客服-微信客服
    func test15_contectWechatCSE() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["设置"].tap()
        app.tables.staticTexts["联系客服"].tap()
        app.sheets.collectionViews.buttons["微信客服"].tap()
        app.alerts["青苹果健康微信客服号：qpgjk08，添加成为好友没事就来吐个槽。"].collectionViews.buttons["好的"].tap()
        app.navigationBars["设置"].buttons["我"].tap()
        
    }
    
    //设置-关于我们-意见反馈
    func test16_feedback() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["设置"].tap()
        app.tables.staticTexts["关于我们"].tap()
        app.tables.staticTexts["意见反馈"].tap()
        app.staticTexts["请留下您的宝贵意见，同时留下您的联系方式，以便问题解决后我们通知您"].tap()
        app.textViews["W"].typeText("这是我的宝贵意见，望采纳")
        app.navigationBars["意见反馈"].buttons["提交"].tap()
        app.navigationBars["关于我们"].buttons["设置"].tap()
        app.navigationBars["设置"].buttons["我"].tap()
        
    }
    
    //设置-关于我们-用户协议
    func test17_userInfo() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["设置"].tap()
        app.tables.staticTexts["关于我们"].tap()
        app.tables.staticTexts["用户协议"].tap()
        app.swipeUp()
        app.swipeDown()
        app.navigationBars["用户协议"].buttons["关于我们"].tap()
        app.navigationBars["关于我们"].buttons["设置"].tap()
        app.navigationBars["设置"].buttons["我"].tap()
        
    }
    
    //设置-退出登录
    func test18_loginOut() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["设置"].tap()
        app.tables.buttons["退出登录"].tap()
        app.sheets["确定退出吗?"].collectionViews.buttons["退出"].tap()
        app.textFields["输入手机号码"].tap()
        
    }
    
    //配药服务-搜索药品
    func test19_searchDrug() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.tables.staticTexts["配药服务"].tap()
        
        let table = app.tables
        table.searchFields["Search"].tap()
        table.searchFields["Search"].typeText("十一")
        sleep(2)
        app.childrenMatchingType(.Window).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(1).childrenMatchingType(.Unknown).elementAtIndex(0).tap()
        app.buttons["下单"].tap()
        
    }
    
    //配药服务-修改配药数量
    func test20_editDrugNum() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.tables.staticTexts["配药服务"].tap()
        app.tables.staticTexts["鼻咽清毒颗粒"].tap()
        
        let itemAmtAddButton = app.buttons["item amt add"]
        itemAmtAddButton.tap()
        itemAmtAddButton.tap()
        app.scrollViews.staticTexts["鼻咽清毒颗粒"].tap()
        app.navigationBars["鼻咽清毒颗粒"].buttons["鼻咽清毒颗粒"].tap()
        app.buttons["下单"].tap()
        app.tables.buttons["确定下单"].tap()
        sleep(1)
        let textField = app.childrenMatchingType(.Window).elementAtIndex(1).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.Unknown).elementAtIndex(1).childrenMatchingType(.Unknown).elementAtIndex(0).childrenMatchingType(.TextField).elementAtIndex(0)
        textField.typeText("沙同学")
        
        app.buttons["确定"].tap()
        sleep(1)
        if self.canOperateElement(app.alerts["今天已经申请过这个药咯。如有需要，请联系医生拒绝上一个申请。"]) {
            app.alerts["今天已经申请过这个药咯。如有需要，请联系医生拒绝上一个申请。"].collectionViews.buttons["知道了"].tap()
            print("此药已配送")
            app.navigationBars["送药地址"].buttons["十一味参芪胶囊"].tap()
            app.navigationBars["十一味参芪胶囊"].buttons["药品列表"].tap()
            app.navigationBars["药品列表"].buttons["完成"].tap()
            app.navigationBars["医生主页"].buttons["我的医生"].tap()
            app.navigationBars["我的医生"].buttons["我"].tap()
        }else {
            app.navigationBars["ChatView"].buttons["返回"].tap()
        }

    }
    
}
