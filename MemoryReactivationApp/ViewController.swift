//
//  ViewController.swift
//  MemoryReactivationApp
//
//  Created by 宏輝 on 29/12/2019.
//  Copyright © 2019 宏輝. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    
    var priorityDataList:[String] = [
        " 今日の朝ごはんは？",
        "今日の服は？",
        "今日の昼ごはんは？",
        "今日の夜ごはんは？"
    ]
    
    
    var pickerView = UIPickerView()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // ViewContorller 背景色
        //後日修正を加える
        self.view.backgroundColor = UIColor(red: 0.92, green: 1.0, blue: 0.94, alpha: 1.0)
        
        // PickerView のサイズと位置
        pickerView.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.width, height:self.view.frame.height/4 )
        
        //pickerの背景色は後日修正
        pickerView.backgroundColor = UIColor(red: 0.69, green: 0.93, blue: 0.9, alpha: 1.0)
        
        // Delegate設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //pickerをviewに表示
        self.view.addSubview(pickerView)
        
    }
    
    
    //pickerを実装
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return priorityDataList.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return priorityDataList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        print(priorityDataList[row])
        
    }

    

}

