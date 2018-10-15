//
//  MyCellModel.swift
//  News
//
//  Created by ZFF on 2018/10/15.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import Foundation
import HandyJSON

// 我的cellmodel
struct MyCellModel: HandyJSON {
    var grey_text: String = ""
    var text: String = ""
    var url: String = ""
    var key: String = ""
    var tip_new: Int = 0
}

// 我的关注model
struct MyfollowModel: HandyJSON {
    var name: String?
    var url: String?
    var total_count: Int?
    var description: String?
    var time: String?
    var type: String?
    var icon: String?
    var userid: Int?
    var is_verify: Bool?
    var media_id: Int?
    var tips: Bool?
    var id: Int?
    // user_auth_info 这个字段返回的是一个字符串 但里面是已字典的形式 所以需要特殊处理一下
    var user_auth_info: String?
    var userAuthInfo: UserAuthInfo? {
        return UserAuthInfo.deserialize(from: user_auth_info)
    }
}

struct UserAuthInfo: HandyJSON {
    var auth_type: Int?
    var auth_info: String?
}

