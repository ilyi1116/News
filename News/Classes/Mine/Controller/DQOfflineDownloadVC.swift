//
//  DQOfflineDownloadVC.swift
//  News
//
//  Created by ZFF on 2018/10/31.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import UIKit
import SnapKit

class DQOfflineDownloadVC: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "离线下载"
    }
    
    // 定义一个数组来接收数据
    var offlineDownloadModels = [OfflineDownloadModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.register(OfflinedownloadCell.self, forCellReuseIdentifier: "OfflinedownloadCell")
        
        // 获取数据
        NetworkTool.loadHomeNewsData { (offlineDownloadModels) in
            self.offlineDownloadModels = offlineDownloadModels
            self.tableView .reloadData()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return offlineDownloadModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OfflinedownloadCell") as! OfflinedownloadCell
        let offlineDownloadModel = offlineDownloadModels[indexPath.row]
        cell.offlineDownloadModel = offlineDownloadModel
        // 取消cell 的点击
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 44))
        view.backgroundColor = UIColor.lightGray
        
        let lblTitle = UILabel()
        view.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(view)
            make.left.equalTo(view).offset(20)
        }
        lblTitle.text = "我的频道"
        lblTitle.font = UIFont.systemFont(ofSize: 14)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    

}
