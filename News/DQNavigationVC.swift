//
//  DQNavigationVC.swift
//  News
//
//  Created by ZFF on 2018/10/10.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit

class DQNavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 重写pushViewController 方法 在这里处理返回按钮的样式
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true;
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_24x24_"), style: .plain, target: self, action: #selector(back_click))
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func back_click() {
        popViewController(animated: true)
    }

}
