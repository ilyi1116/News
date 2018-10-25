//
//  DQMineVC.swift
//  News
//
//  Created by ZFF on 2018/10/10.
//  Copyright © 2018年 yuwenbin. All rights reserved.
//

import UIKit

class DQMineVC: UITableViewController {
    
    // 声明一个数组来接收数据
    var sectionArray = [[MyCellModel]]() // 注意 这个数组不能定义为可选类型 否则下面的数据源方法就会崩掉
    var followModels = [MyfollowModel]()
    
    // 隐藏导航栏
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // 设置状态栏高亮显示
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // 去掉tableview多余的空行
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        // 去掉tableview的分割线
        tableView.separatorStyle = .none
        // 设置头部
        tableView.tableHeaderView = headerView
        // 注册MineCell
        tableView.aj_registerCell(cell: MineCell.self)
        
        // 注册MineFirstSectionCell
        tableView.aj_registerCell(cell: MineFirstSectionCell.self)
        
        // 获取我的cell的数据
        NetworkTool.loadMycellData { (sectionArray) in
            let followString = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let followModel = MyCellModel.deserialize(from: followString)
            var followModels = [MyCellModel]()
            followModels.append(followModel!)
            self.sectionArray.append(followModels)
            self.sectionArray += sectionArray
            
            // 刷新数据
            self.tableView.reloadData()
            
            // 获取我的关注数据
            NetworkTool.loadMyFollows { (followModels) in
                self.followModels = followModels
                // 刷新
                let indexSet = IndexSet(integer: 0)
                self.tableView.reloadSections(indexSet, with: .automatic)
            }
        }
        
        // 给更多登录方式按钮添加点击事件
        headerView.btnMore.addTarget(self, action: #selector(btnMore_Click), for: .touchUpInside)
    }
    
    fileprivate lazy var headerView: NoLoginHeaderView = {
        let headerView = NoLoginHeaderView.headerView()
        return headerView
    }()
    
    // 事件
    @objc func btnMore_Click() {
        let loginVC = DQMoreLoginVC()
        present(loginVC, animated:true, completion: nil)
    }
    

}

// 实现tableview的数据源方法和代理方法
extension DQMineVC{
    
    // 一共有多少组
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    // 每一组显示多少行
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArray[section].count
    }
    // cell的样式
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.aj_dequeueReusableCell(indexPath: indexPath) as MineFirstSectionCell
            // 取消cell的选中样式
            cell.selectionStyle = .none
            // 取出数组里面的数据
            let section = sectionArray[indexPath.section]
            let mycellModel = section[indexPath.row]
            cell.mycellModel = mycellModel
            
            if followModels.count == 0 || followModels.count == 1 {
                cell.collectionView.isHidden = true
            }
            if followModels.count == 1 {
                cell.myfollowModel = followModels[0]
            }
            if followModels.count > 1 {
                cell.followModels = followModels
            }
            return cell
        }
        
        // 使用自定义的cell
        let cell = tableView.aj_dequeueReusableCell(indexPath: indexPath) as MineCell
        // 取消cell的选中样式
        cell.selectionStyle = .none
        // 取出数组里面的数据
        let section = sectionArray[indexPath.section]
        let followModel = section[indexPath.row]
        cell.lblTitle?.text = followModel.text
        cell.lblsubTitle.text = followModel.grey_text
        cell.lblsubTitle.textColor = UIColor.lightGray
        return cell
    }
    
    // 设置组的高度
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 0;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return (followModels.count == 0 || followModels.count == 1) ? 40 : 114
        }
        return 40
    }
    
    // 自定义组头的样式
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 10))
        view.backgroundColor = UIColor.globalBackgroundColor()
        return view
    }

    // 向下拉头部 黏住顶部
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 { // 表示向下拉
            let totalOffset = kMineHeaderViewHeight + abs(offsetY)
            let f = totalOffset / kMineHeaderViewHeight
            headerView.imgBG.frame = CGRect(x: -SCREEN_WIDTH * (f-1) * 0.5, y: offsetY, width: SCREEN_WIDTH*f, height: totalOffset)
        }
    }
}
