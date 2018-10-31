//
//  API.swift
//  News
//
//  Created by ZFF on 2018/10/15.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import Foundation

// 服务器接口地址
//let BASE_URL = "http://lf.snssdk.com"
//let BASE_URL = "http://ib.snssdk.com"
let BASE_URL = "https://is.snssdk.com"

// 参数
let deviceId: String = "6096495334"
let IID: String = "5034850950"

// 我的界面 cell 的请求
// https://is.snssdk.com/user/tab/tabs/?device_id=6096495334
let MyCellUrl = BASE_URL + "/user/tab/tabs/?"

// 关注接口
let MyfollowUrl = BASE_URL + "/concern/v2/follow/my_follow/?"
// https://is.snssdk.com/concern/v2/follow/my_follow/?device_id=6096495334

// 离线下载接口
let OfflineDownloadUrl = BASE_URL + "/article/category/get_subscribed/v1/?"
// https://is.snssdk.com/article/category/get_subscribed/v1/?device_id=6096495334
