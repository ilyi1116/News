//
//  UIView+extension.swift
//  News
//
//  Created by ZFF on 2018/10/15.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit

// 定义一个协议
protocol RegisterCellOrNib {
    
}

extension RegisterCellOrNib {
    
    static var identifier: String {
        return "\(self)"
    }
    
    static var nib: UINib? {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}
