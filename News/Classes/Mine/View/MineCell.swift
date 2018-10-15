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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
