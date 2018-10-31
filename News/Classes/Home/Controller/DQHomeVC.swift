//
//  DQHomeVC.swift
//  News
//
//  Created by ZFF on 2018/10/10.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit

class DQHomeVC: UIViewController {
    
    fileprivate var offlineDownloadTable = OfflineDownloadTable()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        NetworkTool.loadHomeNewsData { (offlineDownloadModels) in
            // 获取到数据之后 添加到数据库中
            self.offlineDownloadTable.insert(offlineDownloadModels)
        }
    }


}
