//
//  OfflineDownloadModel.swift
//  News
//
//  Created by ZFF on 2018/10/31.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import Foundation
import HandyJSON

struct OfflineDownloadModel: HandyJSON {
    var category: String = ""
    var web_url: String = ""
    var flags: Int = 0
    var name: String = ""
    var tip_new: Int = 0
    var default_add: Int = 0
    var concern_id: String = ""
    var type: Int = 0
    var icon_url: String = ""
}
