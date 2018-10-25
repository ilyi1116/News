//
//  DQMoreLoginVC.swift
//  News
//
//  Created by ZFF on 2018/10/25.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import UIKit
import SnapKit

class DQMoreLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        // 关闭按钮
        let btnClose = UIButton()
        view.addSubview(btnClose)
        btnClose.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.width.height.equalTo(40)
        }
        btnClose.setImage(UIImage(named: "close_sdk_login_14x14_"), for: .normal)
        btnClose.addTarget(self, action: #selector(btnClose_Click), for: .touchUpInside)
        
        // 提示 登录你的头条，精彩用不丢失
        let lblTip = UILabel()
        view.addSubview(lblTip)
        lblTip.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(btnClose.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
        lblTip.text = "登录你的头条,精彩永不丢失"
        lblTip.textColor = UIColor.black
        lblTip.font = UIFont.systemFont(ofSize: 16)
        
        // 手机号
        let viewPhone = UIView()
        view.addSubview(viewPhone)
        viewPhone.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(lblTip.snp.bottom).offset(20)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(50)
        }
        viewPhone.layer.borderWidth = 1
        viewPhone.layer.borderColor = UIColor.lightGray.cgColor
        viewPhone.layer.cornerRadius = 25;
        viewPhone.layer.masksToBounds = true
        
        // 发送验证码
        let btnGetCode = UIButton()
        viewPhone.addSubview(btnGetCode)
        btnGetCode.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(viewPhone)
            make.right.equalTo(viewPhone)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        btnGetCode.setTitle("发送验证码", for: .normal)
        btnGetCode.setTitleColor(UIColor.black, for: .normal)
        btnGetCode.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btnGetCode.addTarget(self, action: #selector(btnGetCode_Click), for: .touchUpInside)
        
        // 竖线
        let viewLine = UIView()
        viewPhone.addSubview(viewLine)
        viewLine.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(viewPhone)
            make.right.equalTo(btnGetCode.snp.left)
            make.width.equalTo(1)
            make.height.equalTo(35)
        }
        viewLine.backgroundColor = UIColor.lightGray
        
        // 输入框
        let txtPhone = UITextField()
        viewPhone.addSubview(txtPhone)
        txtPhone.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(viewPhone)
            make.left.equalTo(viewPhone).offset(10)
            make.right.equalTo(viewLine.snp.left)
            make.height.equalTo(45)
        }
        txtPhone.keyboardType = .numberPad
        txtPhone.placeholder = "手机号"
        
        // 验证码
        let viewCode = UIView()
        view.addSubview(viewCode)
        viewCode.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewPhone.snp.bottom).offset(20)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(50)
        }
        viewCode.layer.borderWidth = 1
        viewCode.layer.borderColor = UIColor.lightGray.cgColor
        viewCode.layer.cornerRadius = 25
        viewCode.layer.masksToBounds = true
        
        // txtCode
        let txtCode = UITextField()
        viewCode.addSubview(txtCode)
        txtCode.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(viewCode)
            make.left.equalTo(viewCode).offset(10)
            make.width.equalTo(250)
            make.height.equalTo(45)
        }
        txtCode.keyboardType = .numberPad
        txtCode.placeholder = "请输入验证码"
        
        // 未注册手机验证后自动登录
        let lblTip2 = UILabel()
        view.addSubview(lblTip2)
        lblTip2.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewCode.snp.bottom).offset(10)
            make.centerX.equalTo(view)
        }
        lblTip2.text = "未注册手机验证后自动登录"
        lblTip2.font = UIFont.systemFont(ofSize: 12)
        lblTip2.textColor = UIColor.black
        
        // 进入头条按钮
        let gotoBtn = UIButton()
        view.addSubview(gotoBtn)
        gotoBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(lblTip2.snp.bottom).offset(20)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(50)
        }
        gotoBtn.setTitle("进入头条", for: .normal)
        gotoBtn.setTitleColor(UIColor.white, for: .normal)
        gotoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        gotoBtn.backgroundColor = UIColor.orange
        gotoBtn.layer.cornerRadius = 25
        gotoBtn.layer.masksToBounds = true
        gotoBtn.addTarget(self, action: #selector(gotoBtn_Click), for: .touchUpInside)
        
        
        // CheckBox
        let btnCheckBox = UIButton()
        view.addSubview(btnCheckBox)
        btnCheckBox.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(gotoBtn.snp.bottom).offset(20)
            make.left.equalTo(view).offset(60)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        btnCheckBox.setImage(UIImage(named: "details_choose_ok_icon_15x15_"), for: .selected)
        btnCheckBox.setImage(UIImage(named: "details_choose_icon_night_15x15_"), for: .normal)
        btnCheckBox.addTarget(self, action: #selector(btnCheckBox_Click), for: .touchUpInside)
        btnCheckBox.isSelected = true
        
        // 我已阅读并同意"用户协议和隐私条款"
        let lblTip3 = UILabel()
        view.addSubview(lblTip3)
        lblTip3.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(btnCheckBox)
            make.left.equalTo(btnCheckBox.snp.right).offset(10)
        }
        lblTip3.text = "我已阅读并同意\"用户协议和隐私条款\""
        lblTip3.textColor = UIColor.black
        lblTip3.font = UIFont.systemFont(ofSize: 14)
        
        // 账号密码登录
        let btnLoginWithPassword = UIButton()
        view.addSubview(btnLoginWithPassword)
        btnLoginWithPassword.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(lblTip3.snp.bottom).offset(30)
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        btnLoginWithPassword.setTitle("账号密码登录", for: .normal)
        btnLoginWithPassword.setTitleColor(UIColor.blue, for: .normal)
        btnLoginWithPassword.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btnLoginWithPassword.addTarget(self, action: #selector(btnLoginWithPassword_Click), for: .touchUpInside)
        
        
        // 第三方登录方式
        let btnW = (SCREEN_WIDTH-60)/4
        
        // 1.微信
        let btnWechat = UIButton()
        view.addSubview(btnWechat)
        btnWechat.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(view).offset(-30)
            make.left.equalTo(view).offset(30)
            make.width.equalTo(btnW)
            make.height.equalTo(btnW)
        }
        btnWechat.setImage(UIImage(named: "weixin_sdk_login_40x40_"), for: .normal)
        btnWechat.addTarget(self, action: #selector(btnWechat_Click), for: .touchUpInside)
        
        let btnQQ = UIButton()
        view.addSubview(btnQQ)
        btnQQ.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(view).offset(-30)
            make.left.equalTo(btnWechat.snp.right)
            make.width.equalTo(btnW)
            make.height.equalTo(btnW)
        }
        btnQQ.setImage(UIImage(named: "qq_sdk_login_40x40_"), for: .normal)
        btnQQ.addTarget(self, action: #selector(btnQQ_Click), for: .touchUpInside)
        
        let btnTianyi = UIButton()
        view.addSubview(btnTianyi)
        btnTianyi.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(view).offset(-30)
            make.left.equalTo(btnQQ.snp.right)
            make.width.equalTo(btnW)
            make.height.equalTo(btnW)
        }
        btnTianyi.setImage(UIImage(named: "tianyi_sdk_login_40x40_"), for: .normal)
        btnTianyi.addTarget(self, action: #selector(btnTianyi_Click), for: .touchUpInside)
        
        let btnEmail = UIButton()
        view.addSubview(btnEmail)
        btnEmail.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(view).offset(-30)
            make.left.equalTo(btnTianyi.snp.right)
            make.width.equalTo(btnW)
            make.height.equalTo(btnW)
        }
        btnEmail.setImage(UIImage(named: "mailbox_sdk_login_40x40_"), for: .normal)
        btnEmail.addTarget(self, action: #selector(btnEmail_Click), for: .touchUpInside)
    }
    
    // 事件
    @objc func btnClose_Click() {
        dismiss(animated: true, completion: nil)
    }
    
    // 发送验证码
    @objc func btnGetCode_Click() {
        print("发送验证码")
    }
    
    // 进入头条
    @objc func gotoBtn_Click() {
        print("进入头条")
    }
    
    // CheckBox
    @objc func btnCheckBox_Click(sender:UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    // 账号密码登录
    @objc func btnLoginWithPassword_Click() {
        print("账号密码登录")
    }
    
    // 微信登录
    @objc func btnWechat_Click() {
        print("微信登录")
    }
    
    // QQ登录
    @objc func btnQQ_Click() {
        print("QQ登录")
    }
    
    // 天翼登录
    @objc func btnTianyi_Click() {
        print("天翼登录")
    }
    
    // 邮箱登录
    @objc func btnEmail_Click() {
        print("邮箱登录")
    }

    
}
