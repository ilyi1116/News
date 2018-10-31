//
//  OfflinedownloadCell.swift
//  News
//
//  Created by ZFF on 2018/10/31.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import UIKit
import SnapKit

class OfflinedownloadCell: UITableViewCell {
    
    var offlineDownloadModel: OfflineDownloadModel? {
        didSet {
            lblTitle.text = offlineDownloadModel?.name
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(lblTitle)
        addSubview(imgIcon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 标题
    lazy var lblTitle: UILabel = {
        let lblTitle = UILabel()
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints({ (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
        })
        lblTitle.textColor = UIColor.black
        lblTitle.font = UIFont.systemFont(ofSize: 15)
        return lblTitle
    }()
    
    // 图片
    lazy var imgIcon: UIImageView = {
        let imgIcon = UIImageView()
        addSubview(imgIcon)
        imgIcon.snp.makeConstraints({ (make) ->Void in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        })
        imgIcon.image = UIImage(named: "air_download_option_press_20x20_")
        return imgIcon
    }()

}
