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
        
        // 接收通知
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNotification), name: NSNotification.Name(rawValue: DayOrNightButtonClicked), object: nil)
    }
    
    // 移除通知
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // 接收通知
    @objc func receiveNotification(notification: Notification) {
        let selected = notification.object as! Bool
        if selected { // 为true的话设置为夜间
            for childController in childViewControllers {
                switch childController.title! {
                case "首页":
                    setNightChildController(controller: childController, imageName: "home")
                case "视频":
                    setNightChildController(controller: childController, imageName: "video")
                case "小视频":
                    setNightChildController(controller: childController, imageName: "huoshan")
                case "未登录":
                    setNightChildController(controller: childController, imageName: "no_login")
                default:
                    break
                }
            }
        }else { // 否则设置为日间
            for childController in childViewControllers {
                switch childController.title! {
                case "首页":
                    setDayChildController(controller: childController, imageName: "home")
                case "视频":
                    setDayChildController(controller: childController, imageName: "video")
                case "小视频":
                    setDayChildController(controller: childController, imageName: "huoshan")
                case "未登录":
                    setDayChildController(controller: childController, imageName: "no_login")
                default:
                    break
                }
            }
        }
    }
    
    // 设置夜间控制器
    private func setNightChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    // 设置日间控制器
    private func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
    
    func addViewControllers(){
        setupChildViewController(childVC: DQHomeVC(), title: "首页", imageName: "home")
        setupChildViewController(childVC: DQVideoVC(), title: "视频", imageName: "video")
        setupChildViewController(childVC: DQHuoshanVC(), title: "小视频", imageName: "huoshan")
        setupChildViewController(childVC: DQMineVC(), title: "未登录", imageName: "no_login")
        
        // 通过kvc的方式来设置tabbar
        // tabbar是readonly 属性，不能直接修改，利用kvc把readonly属性的权限改过来
        setValue(DQTabBar(), forKey: "tabBar")
    }
    
    //设置子控制器
    func setupChildViewController(childVC: UIViewController, title: String, imageName: String){
        
        //设置 tabbar 的文字和图片
        if UserDefaults.standard.bool(forKey: isNight) {
            setNightChildController(controller: childVC, imageName: imageName)
        }else {
            setDayChildController(controller: childVC, imageName: imageName)
        }
        childVC.title = title
        //添加导航控制器为tabbarVC的子控制器
        let navVC = DQNavigationVC(rootViewController: childVC)
        addChildViewController(navVC)
    }

}
