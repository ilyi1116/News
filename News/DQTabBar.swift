//
//  DQTabBar.swift
//  News
//
//  Created by ZFF on 2018/10/11.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit

class DQTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //添加
        addSubview(publishBtn)
        
        // 设置tabbar的 tintColor
        theme_tintColor = "colors.tabbarTintColor"
        theme_barTintColor = "colors.cellBackgroundColor"
    }
    
    // 使用懒加载的方式 创建button
    /*
        private 绝对私有，除了在当前类中可以访问之外，其他任何类或者该类的扩展都不能方法到
        fileprivate 文件私有 可以在当前类文件中访问，其他文件不能访问
        open 在任何类文件中都能访问
        internal 默认的 可以不写
     */
    private lazy var publishBtn: UIButton = {
        let publishBtn = UIButton(type: .custom)
        // 设置发布按钮的主题
        publishBtn.theme_setBackgroundImage("images.imgPublishBtn", forState: .normal)
        publishBtn.theme_setBackgroundImage("images.imgPublishBtnSelected", forState: .selected)
        publishBtn.sizeToFit()
        return publishBtn
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //设置frame
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //当前tabbar 的宽度和高度
        let width = frame.width
        let height = frame.height
        //发布按钮
        publishBtn.center = CGPoint(x: width*0.5, y: height*0.5 - 7)
        //其他四个按钮的位置需要重新设置
        let btnW: CGFloat = width*0.2
        let btnH: CGFloat = height
        let btnY: CGFloat = 0
        
        var index = 0
        for button in subviews {
            if !button.isKind(of: NSClassFromString("UITabBarButton")!){
                continue
            }
            let btnX = btnW * (index > 1 ? CGFloat(index + 1) : CGFloat(index))
            button.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH)
            index += 1
        }
        
    }
    

}
