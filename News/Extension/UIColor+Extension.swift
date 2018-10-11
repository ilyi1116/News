//
//  UIColor+Extension.swift
//  News
//
//  Created by ZFF on 2018/10/11.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit

extension UIColor{
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        if #available(iOS 10.0, *) { //iOS 10的方法
            self.init(displayP3Red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
        } else {
            self.init(red: r/255.0, green: g / 255.0, blue: b/255.0, alpha: alpha)
        }
    }
    
    class func globalBackgroundColor() -> UIColor{
        return UIColor(r: 248, g: 249, b: 247)
    }
    
}
