//
//  MainViewController.swift
//  TestRealm
//
//  Created by CC on 16/4/28.
//  Copyright © 2016年 CC. All rights reserved.
//

import UIKit
import RealmSwift

let ID = "cell"

// 查询数据库并展示

class MainViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var dformatetter = NSDateFormatter()
    
    var consumItems = Results<ConsumeItem>?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()

        self.title = "查询数据"
        
        self.dformatetter.dateFormat = "MM月dd日 HH:mm"
        
        let tableview = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableview.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: ID)
        tableview.dataSource = self
        tableview.delegate = self
        
        self.view.addSubview(tableview)
        
        // 使用默认数据库
        let realm = try! Realm()
        //查询所有的消费纪录
        consumItems = realm.objects(ConsumeItem)
        //查询消费大于10 元的纪录
//        consumItems = realm.objects(ConsumeItem).filter("cost > 10")
        //多条件查询
        let predicate = NSPredicate(format: "type.name = '购物' AND cost > 10")
//        consumItems =  realm.objects(ConsumeItem).filter(predicate)
        //链式查询
//        consumItems = realm.objects(ConsumeItem).filter("cost > 10").filter("type.name = '购物' ")
        //排序
//        consumItems = realm.objects(ConsumeItem).filter("cost > 10").sorted("cost")
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consumItems!.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "MyCell")
        let item = self.consumItems![indexPath.row]
        cell.textLabel?.text = item.name + "¥" + String(format: "%.f", item.cost)
        cell.detailTextLabel?.text = self.dformatetter.stringFromDate(item.date)
        
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
