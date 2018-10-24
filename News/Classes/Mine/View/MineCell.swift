//
//  MineCell.swift
//  News
//
//  Created by ZFF on 2018/10/15.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit

class MineCell: UITableViewCell,RegisterCellOrNib {

    // 标题
    @IBOutlet weak var lblTitle: UILabel!
    // 副标题
    @IBOutlet weak var lblsubTitle: UILabel!
    
    @IBOutlet weak var imgArrow: UIImageView!
    
    @IBOutlet weak var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblTitle.theme_textColor = "colors.black"
        lblsubTitle.theme_textColor = "colors.cellRightTextColor"
        imgArrow.theme_image = "images.imgCellRightArrow"
        self.theme_backgroundColor = "colors.cellBackgroundColor"
        lineView.theme_backgroundColor = "colors.separatorColor"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
