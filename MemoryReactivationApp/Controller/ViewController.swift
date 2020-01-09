//
//  ViewController.swift
//  MemoryReactivationApp
//
//  Created by 宏輝 on 29/12/2019.
//  Copyright © 2019 宏輝. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
    
    var actionLabel = UILabel()
    
    //お題を格納するクラス
    var odaiData = OdaiData()
    
    
    //お題を表示するUILabel
    var odaiLabel = UILabel()
    //答えを表示するUILabel
    var answerLabel = UILabel()
    //お題を選択するPicker
    var odaiPickerView = UIPickerView()
    //答えを入力するTextField
    var answerTextField = UITextField()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Delegate設定
        odaiPickerView.delegate = self
        odaiPickerView.dataSource = self
        answerTextField.delegate = self
        
        
        // ViewContorller 背景色
        //後日修正を加える
        self.view.backgroundColor = UIColor(red: 0.92, green: 1.0, blue: 0.94, alpha: 1.0)
        
        
        //お題を表すUILabelを実装
        odaiLabel.frame = CGRect(x: 0, y: self.view.frame.height/8, width: self.view.frame.size.width, height: self.view.frame.size.height/8)
        odaiLabel.textAlignment = .center
        odaiLabel.font = UIFont(name: "HiraMaruProN-W4", size: 25)
        self.view.addSubview(odaiLabel)
        
        
        //答えを表すUILabelを実装
        answerLabel.frame = CGRect(x: 0, y: self.view.frame.size.height*2/8, width: self.view.frame.size.width, height: self.view.frame.size.height/8)
        answerLabel.textAlignment = .center
        answerLabel.font = UIFont(name: "HiraMaruProN-W4", size: 25)
        self.view.addSubview(answerLabel)
        
        
        
        // PickerView のサイズと位置
        odaiPickerView.frame = CGRect(x: 0, y: self.view.frame.size.height/2, width: self.view.frame.width, height:self.view.frame.height/4 )
        //pickerの背景色は後日修正
        odaiPickerView.backgroundColor = UIColor(red: 0.69, green: 0.93, blue: 0.9, alpha: 1.0)
        
        //pickerをviewに表示
        self.view.addSubview(odaiPickerView)
        
        
        
        //答えを入力するTextFieldを実装
        answerTextField.frame = CGRect(x: 0, y: self.view.frame.size.height*3/4, width: self.view.frame.width, height: self.view.frame.height/4)
        
        answerTextField.placeholder = "答えを入力してください"
        answerTextField.textAlignment = .center
        answerTextField.font = UIFont(name: "HiraMaruProN-W4", size: 20)
        answerTextField.backgroundColor = UIColor(red: 0.69, green: 0.93, blue: 0.9, alpha: 1.0)
        
        
        self.view.addSubview(answerTextField)
        
        
    }
    
    
    //お題を入力するpickerを実装
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return odaiData.odaiDataList.count
            
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return odaiData.odaiDataList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        odaiLabel.text = "お題: \(odaiData.odaiDataList[row])"
        //ここにUserDefaultを入力する。rowのNo.だけを入れる
        
    }

    
    
    //答えを入力するtextFieldの挙動を実装
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        answerTextField.resignFirstResponder()
        
        answerLabel.text = "答え： \(answerTextField.text!)"
        
        //入力した言葉はRealmに記入、配列にする
        //2週間後に自動的に削除されるようにする
        return true
    }
    
}

