//
//  UITest_Myself.swift
//  GreenDoctor
//
//  Created by 沙庭宇 on 15/7/3.
//  Copyright © 2015年 kangkanghui. All rights reserved.
//

import Foundation
import XCTest

class UITest_Myself: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        sleep(1)
    }
        
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func canOperateElement(element: XCUIElement?) ->Bool {
        if element != nil {
            if element!.exists {
                return true
            }
            return false
        }
        return false
    }
    
    //查看&保存二维码
    func test00_checkCode() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.navigationBars["我"].buttons["glyth qrcode"].tap()
        app.tables.staticTexts["我的福利"].pressForDuration(2.2);
        app.sheets["保存二维码？"].collectionViews.buttons["保存"].tap()
        
        if self.canOperateElement(app.alerts["“青苹果医生版” Would Like to Access Your Photos"]) {
            app.alerts["“青苹果医生版” Would Like to Access Your Photos"].collectionViews.buttons["OK"].tap()
        }
        app.alerts["保存成功！"].collectionViews.buttons["好的"].tap()
        app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(1).staticTexts["沙医生"].tap()
        
    }
    
    //修改个人资料
    func test01_editInformation() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["沙医生"].tap()
        
        let navigationBar = app.navigationBars["我的名片"]
        navigationBar.buttons["编辑"].tap()
        app.tables.staticTexts["出诊时间"].tap()
        app.tables.staticTexts["星期二"].tap()
        app.navigationBars["星期二"].buttons["出诊时间"].tap()
        app.navigationBars["出诊时间"].buttons["我的名片"].tap()
        app.tables.staticTexts["专长"].tap()
        app.typeText("q")
        app.navigationBars["专长"].buttons["我的名片"].tap()
        app.tables.staticTexts["从业经历"].tap()
        app.typeText("q")
        app.navigationBars["从业经历"].buttons["我的名片"].tap()
        app.navigationBars.buttons["保存"].tap()
        
    }
    
    //联系客服修改资料
    func test02_contactCSE() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["沙医生"].tap()
        
        let navigationBar = app.navigationBars["我的名片"]
        navigationBar.buttons["编辑"].tap()
        app.tables.staticTexts["沙医生"].tap()
        app.buttons["联系客服，修改资料"].tap()
        app.navigationBars["ChatView"].buttons["修改内容"].tap()
        app.navigationBars["修改内容"].buttons["我的名片"].tap()
        navigationBar.buttons["保存"].tap()
        
    }
    
    //查看苹果余额
    func test04_checkApple() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["16"].tap()
        app.staticTexts["苹果余额"].tap()
        app.navigationBars["苹果详情"].buttons["我的苹果"].tap()
        app.staticTexts["更多等级 女神CEO和学霸CTO还在思考中"].tap()
        
        for i in 1...4 {
            let num = i
            print("\(num)")
            app.swipeUp()
            app.swipeDown()
            }
        app.navigationBars["苹果成就"].buttons["关闭"].tap()
        app.navigationBars["我的苹果"].buttons["我"].tap()
        
    }
    //查看患者评语
    //Disable原因：暂无评论
    func test05_checkPatientAppraise() {
    
    }
    
    //查看我的患者
    func test06_checkPatient() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["3"].tap()
        
        let screening = app.navigationBars["患者(3人)"]
        let button = screening.buttons["筛选"]
        button.tap()
        app.tables.staticTexts["编辑标签"].tap()
        app.navigationBars["标签"].buttons["患者(3人)"].tap()
        button.tap()
        screening.buttons["我"].tap()
        
    }
    
    //查看我的收入
    //disable的原因是，4.0版本会做修改
    func test07_checkIncome() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的收入"].tap()
        app.tables.staticTexts["本月收入"].tap()
        for i in 1..<4 {
            let num = i
            print("\(num)")
            app.swipeUp()
            app.swipeUp()
            app.swipeDown()
        }
        app.navigationBars["收入详细"].buttons["收入结算"].tap()
        app.navigationBars["收入结算"].buttons["我"].tap()
        
    }
    
    //查看我的福利
    func test08_checkBoon() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的福利"].tap()
        app.navigationBars["福利"].buttons["我"].tap()
        
    }
    
    //查看我的转诊
    func test09_checkRemovePatient() {
        XCTAssertFalse(false)
    
    }
    //查看我的待办事项
    func test10_checkBacklog() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["待办事项"].tap()
        app.swipeDown()
        app.tables.staticTexts["黑名单患者A 鼻咽灵片x1"].tap()
        app.navigationBars["配药申请"].buttons["待办事项"].tap()
        app.buttons["电话"].tap()
        app.tables.staticTexts["熟悉患者A 安徽"].tap()
        app.collectionViews.buttons["More Info"].tap()
        app.navigationBars["电话咨询说明"].buttons["电话咨询"].tap()
        app.navigationBars["电话咨询"].buttons["待办事项"].tap()
        app.buttons["加号"].tap()
        app.swipeDown()
        app.tables.staticTexts["黑名单患者A "].tap()
        app.navigationBars["加号申请"].buttons["待办事项"].tap()
        app.navigationBars["待办事项"].buttons["我"].tap()
        
    }
    //查看我的文章
    func test11_checkArticle() {
        let app = XCUIApplication()
        app.navigationBars["消息"].buttons["群发"].tap()
        app.buttons["新建群发"].tap()
        app.buttons["文章"].tap()
        let textField = app.textFields["请输入标题"]
        textField.tap()
        textField.typeText("我是文章草稿标题")
        app.keyboards.buttons["done"].tap()
        let textField2 = app.tables.childrenMatchingType(.Cell).elementBoundByIndex(2).childrenMatchingType(.TextView).elementBoundByIndex(0)
        textField2.tap()
        textField2.typeText("我是文章内容")
        app.buttons["保存/预览"].tap()
        app.navigationBars["文章预览"].buttons["新建群发"].tap()
        app.navigationBars["新建群发"].buttons["取消"].tap()
        app.navigationBars["群发"].buttons["消息"].tap()
        
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的文章"].tap()
        app.buttons["草稿箱"].tap()
        app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0).staticTexts["我是文章草稿标题"].tap()
        
        let navigationBar = app.navigationBars["群发文章"]
        navigationBar.buttons["预览"].tap()
        app.navigationBars["文章预览"].buttons["群发文章"].tap()
        navigationBar.buttons["取消"].tap()
        app.sheets["是否保存？"].collectionViews.buttons["保存"].tap()
        app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0).buttons["article draft delete"].tap()
        app.alerts["确定删除吗?"].buttons["删除"].tap()
        app.navigationBars["我的文章"].buttons["我"].tap()
        
    }
    
    //分享已发布的文章
    func test12_shareAricle() {
        let app = XCUIApplication()
        app.navigationBars["消息"].buttons["群发"].tap()
        app.buttons["新建群发"].tap()
        app.buttons["文章"].tap()
        let arictleTitle = app.textFields["请输入标题"]
        arictleTitle.tap()
        arictleTitle.typeText("文章标题待分享")
        app.keyboards.buttons["done"].tap()
        let arictleContent = app.tables.childrenMatchingType(.Cell).elementBoundByIndex(2).childrenMatchingType(.TextView).elementBoundByIndex(0)
        arictleContent.tap()
        arictleContent.typeText("文章内容")
        app.buttons["保存/预览"].tap()
        
        app.navigationBars["文章预览"].buttons["新建群发"].tap()
        app.navigationBars["新建群发"].buttons["取消"].tap()
        app.navigationBars["群发"].buttons["消息"].tap()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的文章"].tap()
        app.buttons["草稿箱"].tap()
        app.tables.staticTexts["文章标题待分享"].tap()
        app.navigationBars["群发文章"].buttons["预览"].tap()
        app.navigationBars["文章预览"].buttons["分享"].tap()
        app.buttons["Cancel"].tap()
        app.navigationBars["文章预览"].buttons["群发文章"].tap()
        app.navigationBars["群发文章"].buttons["取消"].tap()
        app.sheets.buttons["放弃编辑"].tap()
        app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0).buttons["article draft delete"].tap()
        app.alerts["确定删除吗?"].buttons["删除"].tap()
        
        
    }
    
    //编辑草稿并发出
    func test13_editDraftAndSend() {
        let app = XCUIApplication()
        app.navigationBars["消息"].buttons["群发"].tap()
        app.buttons["新建群发"].tap()
        app.buttons["文章"].tap()
        let arictleTitle = app.textFields["请输入标题"]
        arictleTitle.tap()
        arictleTitle.typeText("草稿待发出")
        app.keyboards.buttons["done"].tap()
        let arictleContent = app.tables.childrenMatchingType(.Cell).elementBoundByIndex(2).childrenMatchingType(.TextView).elementBoundByIndex(0)
        arictleContent.tap()
        arictleContent.typeText("文章内容")
        app.buttons["保存/预览"].tap()
        app.navigationBars["文章预览"].buttons["新建群发"].tap()
        app.navigationBars["新建群发"].buttons["取消"].tap()
        app.navigationBars["群发"].buttons["消息"].tap()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["我的文章"].tap()
        app.buttons["草稿箱"].tap()
        app.tables.staticTexts["草稿待发出"].tap()
        let textField = app.tables.textFields["草稿待发出"]
        textField.tap()
        textField.typeText("--修改")
        app.navigationBars["群发文章"].buttons["预览"].tap()
        app.buttons["发布"].tap()
        app.alerts["确定发送文章给所有患者（3人）吗？"].collectionViews.buttons["发送"].tap()
        sleep(3)
        app.buttons["已发布"].tap()
        app.tables.staticTexts["草稿待发出--修改"].tap()
        app.navigationBars["草稿待发出--修改"].buttons["我的文章"].tap()
        let cell = app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0)
        cell.buttons["article more"].tap()
        cell.buttons[" 删除"].tap()
        app.alerts.buttons["删除"].tap()

    }
    
    //搜索患者
    func test14_searchPatient() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["3"].tap()
        app.searchFields["Search"].tap()
        app.typeText("微信")
        app.keyboards.buttons["search"].tap()
        app.descendantsMatchingType(.Other)["Search results"].staticTexts["微信患者A"].tap()
        app.navigationBars["患者资料"].buttons["患者(3人)"].tap()
        app.tables.buttons["Clear text"].tap()
        app.tables.buttons["Cancel"].tap()
        app.navigationBars["患者(3人)"].buttons["我"].tap()
    }
    
    //筛选患者
    func test15_screenPatient() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["3"].tap()
        let sreen = app.navigationBars["患者(3人)"].buttons["筛选"]
        sreen.tap()
        app.tables.staticTexts["小儿感冒（1）"].tap()
        app.navigationBars["患者(1人)"].buttons["我"].tap()
    }
    
    //修改患者备注信息
    func test16_editPatientRemark() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["3"].tap()
        app.tables.staticTexts["微信患者A"].tap()
        app.tables.staticTexts["备注"].tap()
        app.typeText("其他名称")

        let navigationBar = app.navigationBars["备注"]
        navigationBar.buttons["保存"].tap()
        app.alerts["更新成功"].collectionViews.buttons["好的"].tap()
        sleep(2)
        app.tables.staticTexts["click其他名称"].tap()
        sleep(1)
        app.textViews["click其他名称"].pressForDuration(1)
        app.menuItems["Select All"].tap()
        app.keys["Delete"].tap()
        app.typeText("click")
        navigationBar.buttons["患者资料"].tap()
        app.navigationBars["患者资料"].buttons["患者(3人)"].tap()
        
    }
    
    //修改患者备注名
    func test17_editPatientAlias() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["3"].tap()
        app.tables.staticTexts["微信患者A"].tap()
        app.buttons["备注名"].tap()
        app.typeText("我是备注名")
        let nev = app.navigationBars["修改昵称"]
        app.buttons["保存"].tap()
        app.buttons["nickname edit"].tap()
        app.textFields["我是备注名"].pressForDuration(1)
        app.menuItems["Select All"].tap()
        app.keys["Delete"].tap()
        nev.buttons["保存"].tap()
        app.navigationBars["患者资料"].buttons["患者(3人)"].tap()
        
    }

    //设置患者置顶
    func test18_editPatientPut() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["3"].tap()
        app.tables.staticTexts["微信患者A"].tap()
        let infoNav = app.navigationBars["患者资料"]
        infoNav.buttons["more new"].tap()
        
        let put = app.tables.switches["置顶会话"]
        put.tap()
        
        let setNav = app.navigationBars["患者设置"]
        setNav.buttons["患者资料"].tap()
        infoNav.buttons["more new"].tap()
        put.tap()
        setNav.buttons["患者资料"].tap()
        app.navigationBars["患者资料"].buttons["患者(3人)"].tap()
        
    }
    
    //加入陌生患者
    func test19_addStrangenessPatient() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["3"].tap()
        app.tables.staticTexts["微信患者A"].tap()
        let infoNav = app.navigationBars["患者资料"]
        infoNav.buttons["more new"].tap()
        
        let put = app.tables.switches["陌生患者"]
        put.tap()
        
        let setNav = app.navigationBars["患者设置"]
        setNav.buttons["患者资料"].tap()
        infoNav.buttons["患者(3人)"].tap()
        app.tables.staticTexts["陌生患者 (2人)"].tap()
        app.tables.staticTexts["微信患者A"].tap()
        app.navigationBars["患者资料"].buttons["more new"].tap()
        app.tables.switches["陌生患者"].tap()
        app.navigationBars["患者设置"].buttons["患者资料"].tap()
        app.navigationBars["患者资料"].buttons["陌生患者"].tap()
        app.navigationBars["陌生患者"].buttons["患者(3人)"].tap()
        app.tables.staticTexts["微信患者A"].tap()
        infoNav.buttons["more new"].tap()
        setNav.buttons["患者资料"].tap()
        infoNav.buttons["患者(3人)"].tap()
        
    }
    
    //查看历史图片
    func test20_checkHistoryImage() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["3"].tap()
        app.tables.staticTexts["微信患者A"].tap()
        app.tables.staticTexts["历史图片"].tap()
        app.navigationBars["历史图片"].buttons["患者资料"].tap()
        app.navigationBars["患者资料"].buttons["患者(3人)"].tap()
    }
    
    //转诊
    func test21_transferPatient() {
        let app = XCUIApplication()
        app.tabBars.buttons["我"].tap()
        app.tables.staticTexts["3"].tap()
        app.tables.staticTexts["熟悉患者A"].tap()
        
        let table = app.tables
        table.buttons["转诊"].tap()
        app.tables.buttons["选择转诊医生"].tap()
        
        let textField = app.textFields["搜索医生名"]
        textField.tap()
        textField.typeText("吴坚炯")
        app.typeText("\n")
        app.tables.staticTexts["吴坚炯"].tap()
        app.buttons["转诊给这个医生"].tap()
        sleep(1)
        app.buttons["取消"].tap()
        sleep(1)
        app.navigationBars["转诊详细信息"].buttons["选择转诊医生"].tap()
        app.staticTexts["按医院科室找"].tap()
        app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Table).elementBoundByIndex(1).childrenMatchingType(.Cell).elementBoundByIndex(0).staticTexts["上海中山医院"].tap()
        app.tables.staticTexts["心内科"].tap()
        table.childrenMatchingType(.Cell).elementBoundByIndex(0).staticTexts["转"].tap()
        sleep(1)
        app.buttons["取消"].tap()
        sleep(1)
        let navigationBar = app.navigationBars["选择转诊医生"]
        navigationBar.buttons["选择医院"].tap()
        app.navigationBars["选择医院"].buttons["选择转诊医生"].tap()
        navigationBar.buttons["患者转诊资料"].tap()
        
    }
    
}
