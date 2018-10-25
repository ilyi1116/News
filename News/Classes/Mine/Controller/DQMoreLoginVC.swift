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
    
    private let btnW = (SCREEN_WIDTH-60)/4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        // 关闭按钮
        view.addSubview(btnClose)
        view.addSubview(lblTip)
        view.addSubview(viewPhone)
        viewPhone.addSubview(btnGetCode)
        viewPhone.addSubview(viewLine)
        viewPhone.addSubview(txtPhone)
        view.addSubview(viewCode)
        viewCode.addSubview(btnFindPassword)
        viewCode.addSubview(viewLine2)
        viewCode.addSubview(txtCode)
        view.addSubview(lblTip2)
        view.addSubview(gotoBtn)
        view.addSubview(btnCheckBox)
        view.addSubview(lblTip3)
        view.addSubview(btnLoginWithPassword)
        // 第三方登录方式
        view.addSubview(btnWechat)
        view.addSubview(btnQQ)
        view.addSubview(btnTianyi)
        view.addSubview(btnEmail)
        
    }
    
    // 懒加载控件
    lazy var btnClose: UIButton = {
        let btnClose = UIButton()
        view.addSubview(btnClose)
        btnClose.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.width.height.equalTo(40)
        }
        btnClose.setImage(UIImage(named: "close_sdk_login_14x14_"), for: .normal)
        btnClose.addTarget(self, action: #selector(btnClose_Click), for: .touchUpInside)
        return btnClose
    }()
    
    // 提示登录你的头条
    lazy var lblTip: UILabel = {
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
        return lblTip
    }()
    
    
    // 手机号view
    lazy var viewPhone: UIView = {
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
        return viewPhone
    }()
    
    // 发送验证码
    lazy var btnGetCode: UIButton = {
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
        return btnGetCode
    }()
    
    // 竖线
    lazy var viewLine: UIView = {
        let viewLine = UIView()
        viewPhone.addSubview(viewLine)
        viewLine.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(viewPhone)
            make.right.equalTo(btnGetCode.snp.left)
            make.width.equalTo(1)
            make.height.equalTo(35)
        }
        viewLine.backgroundColor = UIColor.lightGray
        return viewLine
    }()
    
    // 输入框
    lazy var txtPhone: UITextField = {
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
        return txtPhone
    }()
    
    // 验证码view
    lazy var viewCode: UIView = {
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
        return viewCode
    }()
    
    // 找回密码按钮
    lazy var btnFindPassword: UIButton = {
        let btnFindPassword = UIButton()
        viewCode.addSubview(btnFindPassword)
        btnFindPassword.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(viewCode)
            make.right.equalTo(viewCode)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        btnFindPassword.setTitle("找回密码", for: .normal)
        btnFindPassword.setTitleColor(UIColor.black, for: .normal)
        btnFindPassword.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btnFindPassword.addTarget(self, action: #selector(btnFindPassword_Click), for: .touchUpInside)
        return btnFindPassword
    }()
    
    // 竖线view2
    lazy var viewLine2: UIView = {
        let viewLine2 = UIView()
        viewCode.addSubview(viewLine2)
        viewLine2.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(viewCode)
            make.right.equalTo(btnFindPassword.snp.left)
            make.width.equalTo(1)
            make.height.equalTo(35)
        }
        viewLine2.backgroundColor = UIColor.lightGray
        return viewLine2
    }()
    
    // 验证码
    lazy var txtCode: UITextField = {
        let txtCode = UITextField()
        viewCode.addSubview(txtCode)
        txtCode.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(viewCode)
            make.left.equalTo(viewCode).offset(10)
            make.right.equalTo(viewLine2.snp.left)
            make.height.equalTo(45)
        }
        txtCode.keyboardType = .numberPad
        txtCode.placeholder = "请输入验证码"
        return txtCode
    }()
    
    // 未注册手机验证后自动登录
    lazy var lblTip2: UILabel = {
        let lblTip2 = UILabel()
        view.addSubview(lblTip2)
        lblTip2.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewCode.snp.bottom).offset(10)
            make.centerX.equalTo(view)
        }
        lblTip2.text = "未注册手机验证后自动登录"
        lblTip2.font = UIFont.systemFont(ofSize: 12)
        lblTip2.textColor = UIColor.black
        return lblTip2
    }()
    
    // 进入头条
    lazy var gotoBtn: UIButton = {
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
        return gotoBtn
    }()
    
    // btnCheckBox
    lazy var btnCheckBox: UIButton = {
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
        return btnCheckBox
    }()
    
    // 我已阅读并同意"用户协议和隐私条款"
    lazy var lblTip3: UILabel = {
        let lblTip3 = UILabel()
        view.addSubview(lblTip3)
        lblTip3.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(btnCheckBox)
            make.left.equalTo(btnCheckBox.snp.right).offset(10)
        }
        lblTip3.text = "我已阅读并同意\"用户协议和隐私条款\""
        lblTip3.textColor = UIColor.black
        lblTip3.font = UIFont.systemFont(ofSize: 14)
        return lblTip3
    }()
    
    // 账号密码登录
    lazy var btnLoginWithPassword: UIButton = {
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
        return btnLoginWithPassword
    }()
    
    /****第三方登录*****/
    lazy var btnWechat: UIButton = {
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
        return btnWechat
    }()
    
    lazy var btnQQ: UIButton = {
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
        return btnQQ
    }()
    
    lazy var btnTianyi: UIButton = {
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
        return btnTianyi
    }()
    
    lazy var btnEmail: UIButton = {
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
        return btnEmail
    }()
    

   
    
    // 事件
    @objc func btnClose_Click() {
        dismiss(animated: true, completion: nil)
    }
    
    // 发送验证码
    @objc func btnGetCode_Click() {
        print("发送验证码")
    }
    
    // 找回密码
    @objc func btnFindPassword_Click() {
        print("找回密码")
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
