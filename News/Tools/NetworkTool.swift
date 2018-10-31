//
//  NetworkTool.swift
//  News
//
//  Created by ZFF on 2018/10/12.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkToolProtocol {
    
    // --------------------我的界面----------------
    
    // 我的界面 cell 的数据
    static func loadMycellData(completionHandler: @escaping (_ sections: [[MyCellModel]]) -> ())
    // 我的关注
    static func loadMyFollows(completionHandler: @escaping (_ sections: [MyfollowModel]) -> ())
    // 首页顶部新闻标题的数据
    static func loadHomeNewsData(completionHandler: @escaping (_ newsTitles: [OfflineDownloadModel]) -> ())
}

extension NetworkToolProtocol {
    
    // 获取我的界面cell里面的数据
    static func loadMycellData(completionHandler: @escaping (_ sections: [[MyCellModel]]) -> ()){
        let url = MyCellUrl
        let params = ["device_id":deviceId]
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else {
                // 网络错误提示信息
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"] == "success" else {
                    return
                }
                if let data = json["data"].dictionary {
                    print(data)
                     if let sections = data["sections"]?.array {
                        var sectionArray = [[MyCellModel]]()
                        for item in sections {
                            var rows = [MyCellModel]()
                            for row in item.arrayObject! {
                                let mycellModel = MyCellModel.deserialize(from: row as? NSDictionary)
                                rows.append(mycellModel!)
                            }
                            sectionArray.append(rows)
                        }
                        completionHandler(sectionArray)
                    }
                }
            }
        }
    }
    
    // 获取我的关注数据
    static func loadMyFollows(completionHandler: @escaping (_ sections: [MyfollowModel]) -> ()){
        let url = MyfollowUrl
        let params = ["device_id":deviceId]
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else {
                // 网络错误提示信息
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"] == "success" else {
                    return
                }
                if let datas = json["data"].arrayObject {
                    print(datas)
                    var followModels = [MyfollowModel]()
                    for data in datas {
                        let myfollowModel = MyfollowModel.deserialize(from: data as? NSDictionary)
                        followModels.append(myfollowModel!)
                    }
                    completionHandler(followModels)
                }
            }
        }
    }
    
    // 获取首页顶部新闻数据
    static func loadHomeNewsData(completionHandler: @escaping (_ newsTitles: [OfflineDownloadModel]) -> ()) {
        let url = OfflineDownloadUrl
        let params = ["device_id" : deviceId]
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"] == "success" else {
                    return
                }
                if let dataDic = json["data"].dictionary {
                    if let data = dataDic["data"]?.arrayObject {
                        // 定义一个泛型数组
                        var offlineDownloadModels = [OfflineDownloadModel]()
                        // 手动添加 推荐
                        let jsonString = "{\"category\": \"\", \"name\": \"推荐\"}"
                        let recommend = OfflineDownloadModel.deserialize(from: jsonString)
                        offlineDownloadModels.append(recommend!)
                        
                        for item in data {
                            let offlineDownloadModel = OfflineDownloadModel.deserialize(from: item as? NSDictionary)
                            offlineDownloadModels.append(offlineDownloadModel!)
                        }
                        completionHandler(offlineDownloadModels)
                    }
                }
            }
        }
    }
}


/// 定义一个结构体 并实现 NetworkToolProtocol协议
struct NetworkTool: NetworkToolProtocol {
    
}
