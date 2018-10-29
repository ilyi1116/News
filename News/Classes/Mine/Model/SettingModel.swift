//
//  SettingModel.swift
//  News
//
//  Created by ZFF on 2018/10/26.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import Foundation
import HandyJSON

struct SettingModel: HandyJSON {
    
    var title: String = ""
    var subTitle: String = ""
    var rightTitle: String = ""
    var isHiddenRightTitle: Bool = false
    var isHiddenSubTitle: Bool = false
    var isHiddenRightArrow: Bool = false
    var isHiddenSwitch: Bool = false
    
}
