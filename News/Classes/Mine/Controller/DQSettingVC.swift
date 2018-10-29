//
//  DQSettingVC.swift
//  News
//
//  Created by ZFF on 2018/10/26.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import UIKit

class DQSettingVC: UITableViewController {
    
    // 存储 plist 文件中的数据
    var sections = [[SettingModel]]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "设置"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取 plist 文件的路径
        let path = Bundle.main.path(forResource: "Setting", ofType: "plist")
        // 获取 plist 文件中的数据
        let plistData = NSArray(contentsOfFile: path!) as! [Any]
        
        for dics in plistData {
            let array = dics as! [[String: Any]]
            var rows = [SettingModel]()
            for dic in array {
                let settingModel = SettingModel.deserialize(from: dic as NSDictionary)
                rows.append(settingModel!)
            }
            sections.append(rows)
        }
        
        // 注册cell
        tableView.aj_registerCell(cell: SettingCell.self)
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = sections[section]
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.aj_dequeueReusableCell(indexPath: indexPath) as SettingCell
        let rows = sections[indexPath.section]
        let settingModel = rows[indexPath.row]
        cell.settingModel = settingModel
        return cell
    }


}
