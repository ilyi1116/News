//
//  DQSettingVC.swift
//  News
//
//  Created by ZFF on 2018/10/26.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import UIKit
import Kingfisher

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
        let path = Bundle.main.path(forResource: "Settings", ofType: "plist")
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
        tableView.register(SettingCell.self, forCellReuseIdentifier:"SettingCell")
        tableView.rowHeight = 50
        tableView.tableFooterView = UIView()
        
        // 设置主题颜色
        tableView.theme_backgroundColor = "colors.cellBackgroundColor"
        
        // 调用计算缓存的方法
        calculateDiskCashSize()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell") as! SettingCell
        let rows = sections[indexPath.section]
        let settingModel = rows[indexPath.row]
        cell.settingModel = settingModel
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
                case 0: // 显示缓存
                    NotificationCenter.default.addObserver(self, selector: #selector(loadCacheSize), name: NSNotification.Name(rawValue: CalculateCashSizeName), object: nil)
                case 1: // 显示字体大小
                    NotificationCenter.default.addObserver(self, selector: #selector(loadFontSize), name: NSNotification.Name(rawValue: SetupFontSizeName), object: nil)
                case 2:
                    cell.selectionStyle = .none
                case 3: // 非 WiFi 网络流量
                    NotificationCenter.default.addObserver(self, selector: #selector(loadNetworkMode), name: NSNotification.Name(rawValue: NetWorkModeName), object: nil)
            default:
                break
            }
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 10))
        viewHeader.backgroundColor = UIColor.lightGray
        return viewHeader
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch indexPath.section {
            case 0:
                switch indexPath.row {
                    case 0: // 清理缓存
                        clearCacheData()
                    case 1: // 设置字体大小
                        setupFontSize()
                    case 3: // 非 WiFi 网络流量
                        networkMode()
                    default: break
                }
            default:
                break
            }
        
    }
    

}



extension DQSettingVC {
    
    // 从沙盒中获取缓存数据的大小
    fileprivate func calculateDiskCashSize() {
        let cache = KingfisherManager.shared.cache
        cache.calculateDiskCacheSize { (size) in
            // 转换成 M
            let sizeM = Double(size) / 1024.0 / 1024.0
            let sizeString = String(format: "%.2fM", sizeM)
            
            // 发通知
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: CalculateCashSizeName), object: self, userInfo: ["cacheSize": sizeString])
            
        }
    }
    
    // 获取缓存大小 并显示到cell 上
    @objc fileprivate func loadCacheSize(notification: Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! SettingCell
        cell.lblRightTitle.text = userInfo["cacheSize"] as? String
    }
    
    // 获取字体大小 并显示在cell上
    @objc fileprivate func loadFontSize(notification: Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! SettingCell
        cell.lblRightTitle.text = userInfo["fontSize"] as? String
    }
    
    // 非 WiFi 网络流量
    @objc fileprivate func loadNetworkMode(notification: Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        let indexPath = IndexPath(row: 3, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! SettingCell
        cell.lblRightTitle.text = userInfo["networkMode"] as? String
    }
    
    // 清理缓存
    fileprivate func clearCacheData() {
        let alert = UIAlertController(title: "确定清理所有缓存?", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .default) { (_) in
            let cache = KingfisherManager.shared.cache
            cache.clearDiskCache()
            cache.clearMemoryCache()
            cache.cleanExpiredDiskCache()
            let sizeString = "0.00M"
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: CalculateCashSizeName), object: self, userInfo: ["cacheSize": sizeString])
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // 设置字体大小
    fileprivate func setupFontSize() {
        let alert = UIAlertController(title: "设置字体大小", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let smallAction = UIAlertAction(title: "小", style: .default) { (_) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: SetupFontSizeName), object: self, userInfo: ["fontSize":"小"])
        }
        let mediamAction = UIAlertAction(title: "中", style: .default) { (_) in
             NotificationCenter.default.post(name: NSNotification.Name(rawValue: SetupFontSizeName), object: self, userInfo: ["fontSize":"中"])
        }
        let bigAction = UIAlertAction(title: "大", style: .default) { (_) in
             NotificationCenter.default.post(name: NSNotification.Name(rawValue: SetupFontSizeName), object: self, userInfo: ["fontSize":"大"])
        }
        let largeAction = UIAlertAction(title: "特大", style: .default) { (_) in
             NotificationCenter.default.post(name: NSNotification.Name(rawValue: SetupFontSizeName), object: self, userInfo: ["fontSize":"特大"])
        }
        alert.addAction(cancelAction)
        alert.addAction(smallAction)
        alert.addAction(mediamAction)
        alert.addAction(bigAction)
        alert.addAction(largeAction)
        present(alert, animated: true, completion: nil)
    }
    
    // 非 WiFi 网络流量
    fileprivate func networkMode() {
        let alert = UIAlertController(title: "网络流量提示", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let bestAction = UIAlertAction(title: "最佳效果(下载大图)", style: .default) { (_) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NetWorkModeName), object: self, userInfo: ["networkMode":"最佳效果(下载大图)"])
        }
        
        let betterAction = UIAlertAction(title: "较少流量(只能下图)", style: .default) { (_) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NetWorkModeName), object: self, userInfo: ["networkMode":"较少流量(只能下图)"])
        }
        
        let leastAction = UIAlertAction(title: "极省流量(下载大图)", style: .default) { (_) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NetWorkModeName), object: self, userInfo: ["networkMode":"极省流量(下载大图)"])
        }
        
        alert.addAction(cancelAction)
        alert.addAction(bestAction)
        alert.addAction(betterAction)
        alert.addAction(leastAction)
        present(alert, animated: true, completion: nil)
    }
    
}
