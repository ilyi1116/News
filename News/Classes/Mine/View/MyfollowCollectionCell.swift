//
//  MyfollowCollectionCell.swift
//  News
//
//  Created by ZFF on 2018/10/15.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit
import Kingfisher

class MyfollowCollectionCell: UICollectionViewCell,RegisterCellOrNib {
    
    // 头像
    @IBOutlet weak var imgAvatar: UIImageView!
    // 用户名
    @IBOutlet weak var lblTitle: UILabel!
    // vip
    @IBOutlet weak var imgVip: UIImageView!
    
    @IBOutlet weak var btnTip: UIButton!
    
    var followModel: MyfollowModel? {
        didSet {
            imgAvatar.kf.setImage(with: URL(string: (followModel?.icon)!))
            lblTitle.text = followModel?.name
            if let isVerify = followModel?.is_verify {
                imgVip.isHidden = !isVerify
            }
            if let isTip = followModel?.tips {
                btnTip.isHidden = !isTip
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgAvatar.layer.cornerRadius = 20
        imgAvatar.layer.masksToBounds = true
        
        btnTip.layer.borderWidth = 1
        btnTip.layer.borderColor = UIColor.white.cgColor
        
        // 设置主题
        theme_backgroundColor = "colors.cellBackgroundColor"
        lblTitle.theme_textColor = "colors.black"
    }

}
