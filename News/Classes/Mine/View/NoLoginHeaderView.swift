//
//  NoLoginHeaderView.swift
//  News
//
//  Created by ZFF on 2018/10/16.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import UIKit
import SwiftTheme

class NoLoginHeaderView: UIView {
    
    @IBOutlet weak var btnDayorNight: UIButton!
    @IBOutlet weak var btnHistory: UIButton!
    @IBOutlet weak var btnCollect: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var btnSina: UIButton!
    @IBOutlet weak var btnQQ: UIButton!
    @IBOutlet weak var btnWechat: UIButton!
    @IBOutlet weak var btnPhone: UIButton!
    @IBOutlet weak var imgBG: UIImageView!
    @IBOutlet weak var viewBottom: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        btnDayorNight.isSelected = UserDefaults.standard.bool(forKey: isNight)
        
        btnMore.layer.cornerRadius = 14
        btnMore.layer.masksToBounds = true
        
        // 设置主题图片
        btnPhone.theme_setImage("images.imgMobileButton", forState: .normal)
        btnWechat.theme_setImage("images.imgWechatButton", forState: .normal)
        btnQQ.theme_setImage("images.imgQQButton", forState: .normal)
        btnSina.theme_setImage("images.imgSinaButton", forState: .normal)
        btnCollect.theme_setImage("images.imgCollect", forState: .normal)
        btnHistory.theme_setImage("images.imgHistory", forState: .normal)
        btnDayorNight.theme_setImage("images.imgNight", forState: .normal)
        // 切换文字
        btnDayorNight.setTitle("夜间", for: .normal)
        btnDayorNight.setTitle("日间", for: .selected)
        
        // 更多登录方式的背景颜色 和 字体颜色
        btnMore.theme_backgroundColor = "colors.moreLoginBackgroundColor"
        btnMore.theme_setTitleColor("colors.moreLoginTextColor", forState: .normal)
        
        btnCollect.theme_setTitleColor("colors.black", forState: .normal)
        btnHistory.theme_setTitleColor("colors.black", forState: .normal)
        btnDayorNight.theme_setTitleColor("colors.black", forState: .normal)
        viewBottom.theme_backgroundColor = "colors.cellBackgroundColor"
    }
    
    class func headerView() -> NoLoginHeaderView {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! NoLoginHeaderView
    }
    
    // 点击了 日间 夜间 按钮
    @IBAction func btnDayOrNight_Click(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        // 点击之后保存按钮的选中状态
        UserDefaults.standard.set(sender.isSelected, forKey: isNight)
        ThemeTool.switchNight(sender.isSelected)
    }
    
}
