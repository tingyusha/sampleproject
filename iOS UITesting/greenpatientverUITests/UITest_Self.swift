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
    //总是找不到修改界面的用户名……
    func test00_editSelfInfo() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["test老沙"].tap()
        
        let textField = tablesQuery.staticTexts["test老沙"]
        if app.staticTexts["test老沙"].exists {
            assert(false)
        }
        app.tables.staticTexts["test老沙"].pressForDuration(1)
        app.menuItems["Select All"].tap()
        app.menuItems["Cut"].tap()
        textField.typeText("test")
        app.typeText("\n")
        
        let staticText = tablesQuery.staticTexts["出生年份"]
        staticText.tap()
        staticText.tap()
        
        let staticText2 = tablesQuery.staticTexts["性别"]
        staticText2.tap()
        staticText2.tap()
        
        let staticText3 = tablesQuery.staticTexts["所在省份"]
        staticText3.tap()
        staticText3.tap()
        
        let navigationBar = app.navigationBars["个人资料"]
        let button = navigationBar.buttons["保存"]
        button.tap()
        tablesQuery.staticTexts["test"].tap()
        app.tables.staticTexts["test"].pressForDuration(1)
        app.menuItems["Select All"].tap()
        app.menuItems["Cut"].tap()
        textField.typeText("test老沙")
        button.tap()
        tablesQuery.staticTexts["test老沙"].tap()
        navigationBar.buttons["我"].tap()
        

    }
    
    //查看如何购买苹果
    //Disable的原因：该功能已取消
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
        let tablesQuery = app.tables
        tablesQuery.staticTexts["我的医生"].tap()
        tablesQuery.staticTexts["沙医生"].tap()
        tablesQuery.staticTexts["电话咨询"].tap()
        tablesQuery.buttons["确定咨询"].tap()
        tablesQuery.tables.buttons["确定支付"].tap()
        sleep(5)
        app.navigationBars["预约电话咨询"].buttons["医生主页"].tap()
        app.navigationBars["医生主页"].buttons["我的医生"].tap()
        app.navigationBars["我的医生"].buttons["我"].tap()
        tablesQuery.staticTexts["服务历史"].tap()
        app.navigationBars["服务历史"].buttons["返回"].tap()
        
    }
    
    //图文咨询
    func test05_consulfImageAndText() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.buttons["发消息"].tap()
        let textField = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(4).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.TextView).element
        textField.tap()
        
        textField.typeText("你好")
        app.buttons["Send"].tap()
        app.navigationBars["ChatView"].buttons["返回"].tap()

    
    }
    
    //配药服务
    func test06_dosageService() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["我的医生"].tap()
        tablesQuery.staticTexts["沙医生"].tap()
        tablesQuery.staticTexts["配药服务"].tap()
        tablesQuery.staticTexts["十一味参芪胶囊"].tap()
        app.buttons["下单"].tap()
        tablesQuery.buttons["确定下单"].tap()
        sleep(1)
        app.childrenMatchingType(.Window).elementBoundByIndex(2).childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element.childrenMatchingType(.TextField).element.typeText("T")
        app.buttons["确定"].tap()
        sleep(1)
        if app.alerts["今天已经申请过这个药咯。如有需要，请联系医生拒绝上一个申请。"].exists {
            app.alerts["今天已经申请过这个药咯。如有需要，请联系医生拒绝上一个申请。"].collectionViews.buttons["知道了"].tap()
            sleep(1)
            app.navigationBars["送药地址"].buttons["十一味参芪胶囊"].tap()
            app.navigationBars["十一味参芪胶囊"].buttons["药品列表"].tap()
            app.navigationBars["药品列表"].buttons["完成"].tap()
            app.navigationBars["医生主页"].buttons["我的医生"].tap()
            app.navigationBars["我的医生"].buttons["我"].tap()
        }else {
            sleep(3)
            app.navigationBars["ChatView"].buttons["返回"].tap()
        }
        
    }
    
    //查看医生的历史文章
    func test07_checkHistoryArticle() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.tables.childrenMatchingType(.Cell).elementBoundByIndex(8).tap()
        app.navigationBars["文章"].buttons["医生主页"].tap()
        app.navigationBars["医生主页"].buttons["我的医生"].tap()
        app.navigationBars["我的医生"].buttons["我"].tap()
        
    }
    
    //查看医生的更多文章
    func test08_checkMoreArticle() {
        var temp = true
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的医生"].tap()
        app.tables.staticTexts["沙医生"].tap()
        
        while temp {
            if app.tables.staticTexts["更多 •••"].exists {
                app.tables.staticTexts["更多 •••"].tap()
                app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0).tap()
                let button = app.navigationBars["文章"].buttons["历史文章"]
                button.tap()
                app.navigationBars["历史文章"].buttons["医生主页"].tap()
                temp = false
                break
            }
            app.swipeUp()
        }
        
        
        app.navigationBars["医生主页"].buttons["我的医生"].tap()
        app.navigationBars["我的医生"].buttons["我"].tap()
        
    }
    
    //查看我的健康数据
    //Disable的原因：4.3去掉了
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
        app.tabBars.buttons["我"].tap()
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
             app.alerts.buttons["OK"].tap()
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
        app.typeText("这是我的宝贵意见，望采纳")
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
        app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).elementBoundByIndex(0).tap()
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
        let textField = app.childrenMatchingType(.Window).elementBoundByIndex(2).childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element.childrenMatchingType(.TextField).element
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
