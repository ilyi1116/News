//
//  UITableView+Extension.swift
//  News
//
//  Created by ZFF on 2018/10/15.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit

extension UITableView {
    
    func aj_registerCell<T: UITableViewCell>(cell: T.Type) where T: RegisterCellOrNib {
        if let nib = T.nib {
            // 采用xib的方式
            register(nib, forCellReuseIdentifier: T.identifier)
        }else {
            // 采用代码的方式
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    
    
    /// 从缓存池出队已经存在的cell
    func aj_dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: RegisterCellOrNib {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}
