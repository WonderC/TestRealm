//
//  ConsumeItem.swift
//  TestRealm
//
//  Created by CC on 16/4/28.
//  Copyright © 2016年 CC. All rights reserved.
//

import Foundation
import RealmSwift

class ConsumeItem: Object {
    dynamic var name: String = ""
    dynamic var cost: Double = 0
    dynamic var date:NSDate = NSDate()
    dynamic var type:ConsumeType?

}
