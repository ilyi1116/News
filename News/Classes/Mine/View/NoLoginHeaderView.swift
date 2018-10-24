//
//  NoLoginHeaderView.swift
//  News
//
//  Created by ZFF on 2018/10/16.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import UIKit

class NoLoginHeaderView: UIView {
    
    @IBOutlet weak var btnDayorNight: UIButton!
    @IBOutlet weak var btnHistory: UIButton!
    @IBOutlet weak var btnCollect: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var btnSina: UIButton!
    @IBOutlet weak var btnQQ: UIButton!
    @IBOutlet weak var btnWechat: UIButton!
    @IBOutlet weak var btnPhone: UIButton!
    @IBOutlet weak var imgBG: UIImageView!
    
    class func headerView() -> NoLoginHeaderView {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! NoLoginHeaderView
    }
}
