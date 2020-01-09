//
//  DataRealm.swift
//  MemoryReactivationApp
//
//  Created by 宏輝 on 02/01/2020.
//  Copyright © 2020 宏輝. All rights reserved.
//

import UIKit
import RealmSwift

// Objectを継承してクラスを作成
class DataRealm: Object {
    
    // 各プロパティは@objc dynamic varを付けて宣言
    @objc dynamic var answerDataList = [String]()
    
    override class func primaryKey() -> String? {
        return "answerDataList"
    }
}
