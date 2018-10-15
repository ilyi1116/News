//
//  MineFirstSectionCell.swift
//  News
//
//  Created by ZFF on 2018/10/15.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit

class MineFirstSectionCell: UITableViewCell,RegisterCellOrNib {

    
    /// 标题
    @IBOutlet weak var lblTitle: UILabel!
    
    /// 图片
    @IBOutlet weak var imgView: UIImageView!
    
    /// 副标题
    @IBOutlet weak var lblsubTitle: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var followModels = [MyfollowModel]()
    
    var mycellModel: MyCellModel? {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.collectionViewLayout = myCollectionViewLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.aj_registerCell(cell: MyfollowCollectionCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

class myCollectionViewLayout: UICollectionViewFlowLayout {
    override func prepare() {
        // 每个 cell 的大小
        itemSize = CGSize(width: 58, height: 74)
        // 横向间距
        minimumLineSpacing = 0
        // 纵向间距
        minimumInteritemSpacing = 0
        // cell 上下左右间距
        sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        // 水平滚动
        scrollDirection = .horizontal
    }
}

// 实现uicollectionview的代理方法和数据源方法
extension MineFirstSectionCell: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.aj_dequeueReusableCell(indexPath: indexPath) as MyfollowCollectionCell
        
        return cell
    }
}
