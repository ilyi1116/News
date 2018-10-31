//
//  SqliteManager.swift
//  News
//
//  Created by ZFF on 2018/10/31.
//  Copyright © 2018 yuwenbin. All rights reserved.
//

import Foundation
import SQLite


struct SqliteManager {
    
    var database: Connection!
    
    init() {
        do {
                // 数据库路径
                let path = NSHomeDirectory() + "/Documents/news.sqlite3"
                database = try Connection(path)
        } catch {
            print(error)
        }
    }
}

// 新闻标题数据表
struct OfflineDownloadTable {
    
    // 创建数据库管理者
    private let sqlManager = SqliteManager()
    
    // 创建新闻表 表名：news_title
    private let news_title = Table("news_title")
    
    // 添加表字段
    let id = Expression<Int64>("id")
    let category = Expression<String>("category")
    let web_url = Expression<String>("web_url")
    let flags = Expression<Int64>("flags")
    let name = Expression<String>("name")
    let tip_new = Expression<Int64>("tip_new")
    let default_add = Expression<Int64>("default_add")
    let concern_id = Expression<String>("concern_id")
    let type = Expression<Int64>("type")
    let icon_url = Expression<String>("icon_url")
    let selected = Expression<Bool>("selected")
    
    init() {
        do {
            // 建表
            try sqlManager.database.run(news_title.create(ifNotExists: true,block:{t in
                t.column(id,primaryKey: true)
                t.column(category)
                t.column(web_url)
                t.column(flags)
                t.column(name)
                t.column(tip_new)
                t.column(default_add)
                t.column(concern_id)
                t.column(type)
                t.column(icon_url)
                t.column(selected)
            }))
        } catch {
            print(error)
        }
    }
    
    // 增 插入一组数据
    func insert(_ titles: [OfflineDownloadModel]) {
        for title in titles {
            insert(title)
        }
    }
    
    // 增 插入一条数据
    func insert(_ title: OfflineDownloadModel) {
        
        // 首先判断数据是否存在 , 如果不存在 则插入 存在 则不插入
        if !exist(title) {
           let insert = news_title.insert(
                                          category <- title.category,
                                          web_url <- title.web_url,
                                          flags <- Int64(title.flags),
                                          name <- title.name,
                                          tip_new <- Int64(title.tip_new),
                                          default_add <- Int64(title.default_add),
                                          concern_id <- title.concern_id,
                                          type <- Int64(title.type),
                                          icon_url <- title.icon_url,
                                          selected <- title.selected
                                         )
            do {
                // 插入数据
                try sqlManager.database.run(insert)
            } catch {
                print(error)
            }
        }
    }
    
    // 判断数据是否存在
    func exist(_ title: OfflineDownloadModel) -> Bool {
        // 取出数据
        let title = news_title.filter(category == title.category)
        do {
            // 判断该条数据是否存在 根据count 是否是 0 来判断 是否存在这条数据 0 表示没有该条记录  1表示存在
            let count = try sqlManager.database.scalar(title.count)
            return count != 0
        } catch {
            print(error)
        }
        return false
    }
    
    
    // 查询所有记录
    func selectAll() -> [OfflineDownloadModel] {
        // 定义一个数组来接收
        var allTitles = [OfflineDownloadModel]()
        do {
            // 遍历表中的数据
            for title in try sqlManager.database.prepare(news_title) {
                // 取出表中数据 并初始化为一个结构体模型
                let newsTitle = OfflineDownloadModel(category: title[category], web_url: title[web_url], flags: Int(title[flags]), name: title[name], tip_new: Int(title[tip_new]), default_add: Int(title[default_add]), concern_id: title[concern_id], type: Int(title[type]), icon_url: title[icon_url], selected: title[selected])
                // 添加到数组中
                allTitles.append(newsTitle)
            }
            return allTitles
        } catch {
            print(error)
        }
        
        return []
    }
    
    
    // 更新表中的数据
    func update(_ newstitle: OfflineDownloadModel) {
        do {
            // 取出数据
            let title = news_title.filter(category == newstitle.category)
            try sqlManager.database.run(title.update(selected <- newstitle.selected))
        } catch {
            print(error)
        }
    }
    
}
