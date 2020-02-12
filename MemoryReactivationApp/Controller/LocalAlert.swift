//
//  LocalAlert.swift
//  MemoryReactivationApp
//
//  Created by 近藤宏輝 on 2020/02/10.
//  Copyright © 2020 宏輝. All rights reserved.
//

import Foundation
import UserNotifications

class LocalAlert {
    
    //ここでの毎日の通知日程は、pickeViewで表示させるようにしたい
    //option画面で入力をする場所をもうけることを検討
    
    func localAlertFire(){
        //通知設定に必要なクラスをインスタンス化
        let content = UNMutableNotificationContent()
        var notificationTime = DateComponents()
        
        //通知の時間設定
        notificationTime.hour = 0
        notificationTime.minute = 19
        let trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: true)
        
        
        //通知のラベルを設定
        content.title = "想起の時間です"
        content.body = "○日前に食べたご飯は？"
        content.sound = .default
        
        //通知スタイル
        let request = UNNotificationRequest(identifier: "Alert", content: content, trigger: trigger)
        
        //通知をセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
