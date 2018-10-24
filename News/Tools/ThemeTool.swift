//
//  ThemeTool.swift
//  News
//
//  Created by ZFF on 2018/10/24.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import Foundation
import SwiftTheme

enum ThemeTool: Int{
    case day = 0
    case night = 1
    
    static var before = ThemeTool.day
    static var current = ThemeTool.day
    
    // 选择主题
    static func switchTo(_ theme: ThemeTool) {
        before = current
        current = theme
        
        switch theme {
            case .day:
                ThemeManager.setTheme(plistName: "DefaultTheme", path: .mainBundle)
            case .night:
                ThemeManager.setTheme(plistName: "NightTheme", path: .mainBundle)
        }
    }
    
    // 选择夜间主题
    static func switchNight(_ isToNight: Bool) {
        if isToNight {
            switchTo(.night)
        }else {
            switchTo(.day)
        }
    }
    
    // 判断当前是否是夜间主题
    static func isNight() -> Bool {
        return current == .night
    }
}
