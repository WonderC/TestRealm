//
//  ViewController.swift
//  TestRealm
//
//  Created by CC on 16/4/28.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit
import RealmSwift

//添加消费纪录

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        self.title = "插入数据"
        let realm = try! Realm()
        //查询纪录
        let items = realm.objects(ConsumeType)
        
        if  items.count > 0 {
            return
        }
        
        //创建消费类型
        let type1 = ConsumeType()
        type1.name = "购物"
        
        let type2 = ConsumeType()
        type2.name = "娱乐"
        
        //创建消费纪录
        let item1 = ConsumeItem(value:["买了一台电脑",5999.2,NSDate(),type1])
        
        let item2 = ConsumeItem()
        item2.name = "看了一场电影"
        item2.cost = 30
        item2.date = NSDate(timeIntervalSinceNow: -72000)
        item2.type = type2
        
        let item3 =  ConsumeItem()
        item3.name = "买了一包泡面"
        item3.cost = 2.5
        item3.date = NSDate(timeIntervalSinceNow: -36000)
        item3.type = type1
        
        //数据持久化操作
        try! realm.write({ 
            realm.add(item1)
            realm.add(item2)
            realm.add(item3)
        })
        
        print(realm.path)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

