//
//  SettingCell.swift
//  News
//
//  Created by ZFF on 2018/10/29.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import UIKit
import SnapKit

class SettingCell: UITableViewCell {
    
    
    
    var settingModel: SettingModel? {
        didSet{
            lblTitle.text = settingModel?.title
            lblsubTitle.text = settingModel?.subTitle
            lblRightTitle.text = settingModel?.rightTitle
            imgArrow.isHidden = (settingModel?.isHiddenRightArrow)!
            swSwitch.isHidden = (settingModel?.isHiddenSwitch)!
            lblsubTitle.isHidden = (settingModel?.isHiddenSubTitle)!
            lblRightTitle.isHidden = (settingModel?.isHiddenRightTitle)!
            
            if settingModel?.isHiddenSubTitle == false {
                lblTitle.snp.makeConstraints { (make) -> Void in
                    make.centerY.equalTo(self.snp.centerY).offset(-10)
                    make.left.equalTo(self).offset(10)
                }
                
                lblsubTitle.snp.makeConstraints { (make) -> Void in
                    make.centerY.equalTo(self.snp.centerY).offset(10)
                    make.left.equalTo(self).offset(10)
                }
            }else {
                lblTitle.snp.makeConstraints { (make) -> Void in
                    make.centerY.equalTo(self)
                    make.left.equalTo(self).offset(10)
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 取消 cell 的选中
        self.selectionStyle = .none
        
        self.theme_backgroundColor = "colors.cellBackgroundColor"
        
        // 标题
        addSubview(lblTitle)
        addSubview(lblsubTitle)
        addSubview(lblRightTitle)
        addSubview(swSwitch)
        addSubview(imgArrow)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 标题
    lazy var lblTitle: UILabel = {
        let lblTitle = UILabel()
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
        }
        return lblTitle
    }()
    
    // 副标题
    lazy var lblsubTitle: UILabel = {
        let lblsubTitle = UILabel()
        addSubview(lblsubTitle)
        lblsubTitle.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(lblTitle.snp.bottom).offset(1)
            make.left.equalTo(self).offset(10)
        })
        lblsubTitle.isHidden = true
        lblsubTitle.textColor = UIColor.lightGray
        lblsubTitle.font = UIFont.systemFont(ofSize: 14)
        return lblsubTitle
    }()
    
    // rightTitle
    lazy var lblRightTitle: UILabel = {
        let lblRightTitle = UILabel()
        addSubview(lblRightTitle)
        lblRightTitle.snp.makeConstraints({ (make) -> Void in
            make.right.equalTo(self).offset(-10)
            make.centerY.equalTo(self)
        })
        return lblRightTitle
    }()
    
    // 开关
    lazy var swSwitch: UISwitch = {
        let swSwitch = UISwitch()
        addSubview(swSwitch)
        swSwitch.snp.makeConstraints({ (make) -> Void in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-10)
            make.width.equalTo(50)
            make.height.equalTo(30)
        })
        swSwitch.isOn = false
        return swSwitch
    }()
    
    // 箭头
    lazy var imgArrow: UIImageView = {
        let imgArrow = UIImageView()
        addSubview(imgArrow)
        imgArrow.snp.makeConstraints({ (make) -> Void in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-10)
            make.width.equalTo(12)
            make.height.equalTo(14)
        })
        imgArrow.image = UIImage(named: "setting_rightarrow_8x14_")
        return imgArrow
    }()

}
