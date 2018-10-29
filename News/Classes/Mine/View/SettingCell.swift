//
//  SettingCell.swift
//  News
//
//  Created by ZFF on 2018/10/29.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell, RegisterCellOrNib {
    
    var settingModel: SettingModel? {
        didSet{
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
