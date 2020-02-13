//
//  AnswerDataList.swift
//  MemoryReactivationApp
//
//  Created by 近藤宏輝 on 2020/02/12.
//  Copyright © 2020 宏輝. All rights reserved.
//

import Foundation
import RealmSwift

class AnswerDataList: Object {
    
    //お題名
    @objc dynamic var odai: String = ""
    //回答文
    @objc dynamic var AnswerSentence: String = ""
}
