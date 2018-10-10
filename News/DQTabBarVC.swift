//
//  DQTabBarVC.swift
//  News
//
//  Created by ZFF on 2018/10/10.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit

class DQTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //添加子控制器
        addViewControllers();
        
        //设置tabbar上的字体颜色
        let tabbarAppearance = UITabBar.appearance()
        tabbarAppearance.tintColor = UIColor(red: 245/255.0, green: 90/255.0, blue: 93/255.0, alpha: 1.0)
    }
    
    func addViewControllers(){
        setupChildViewController(childVC: DQHomeVC(), title: "首页", imageName: "home_tabbar_32x32_", selectImageName: "home_tabbar_press_32x32_")
        setupChildViewController(childVC: DQVideoVC(), title: "视频", imageName: "video_tabbar_32x32_", selectImageName: "video_tabbar_press_32x32_")
        setupChildViewController(childVC: DQHuoshanVC(), title: "小视频", imageName: "huoshan_tabbar_32x32_", selectImageName: "huoshan_tabbar_press_32x32_")
        setupChildViewController(childVC: DQMineVC(), title: "我的", imageName: "mine_tabbar_32x32_", selectImageName: "mine_tabbar_press_32x32_")
    }
    
    //设置子控制器
    func setupChildViewController(childVC: UIViewController, title: String, imageName: String, selectImageName: String){
        //设置 tabbar 的文字和图片
        childVC.tabBarItem.image = UIImage(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: selectImageName)
        childVC.tabBarItem.title = title
        //添加导航控制器为tabbarVC的子控制器
        let navVC = DQNavigationVC(rootViewController: childVC)
        addChildViewController(navVC)
    }

}
