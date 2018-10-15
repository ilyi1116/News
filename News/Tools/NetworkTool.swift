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
    static func loadMyFollows(completionHandler: @escaping (_ sections: [[MyfollowModel]]) -> ())
}

extension NetworkToolProtocol {
    
    //实现上面的请求方法
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
    
    static func loadMyFollows(completionHandler: @escaping (_ sections: [[MyfollowModel]]) -> ()){
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
                    completionHandler([followModels])
                }
            }
        }
    }
    
}


/// 定义一个结构体 并实现 NetworkToolProtocol协议
struct NetworkTool: NetworkToolProtocol {
    
}
