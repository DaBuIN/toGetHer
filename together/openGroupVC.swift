//
//  openGroupVC.swift
//  together
//
//  Created by Seven Tsai on 2017/7/17.
//  Copyright © 2017年 Seven Tsai. All rights reserved.
//

import UIKit


//因委託給自己所以要加  UIPickerViewDelegate, UIPickerViewDataSource
class openGroupVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
//    @IBOutlet weak var pickerClass: UIPickerView!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var LabelStartTime: UILabel!
    @IBOutlet weak var LabelEndTime: UILabel!
    @IBOutlet weak var textFieldStartDate: UITextField!
    @IBOutlet weak var textFieldEndDate: UITextField!

    var listClass = [String]()
    
    
   

    var selectClass:String?  //class select的資料儲存
 

    
var formatter: DateFormatter! = nil

    
  
    
    
    
    //////////Class Picker
    //幾個滾筒
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //多少筆資料
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if component == 0 {
        return listClass.count
//        }
    }
    
    //資料內容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if component == 0 {
        
        return listClass[row]
        }
//    }
    
    //使用者選擇的資料
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
        
        
            
            
            let field  = self.view.viewWithTag(100) as? UITextField
            
            field?.text = listClass[row]
            
        print("selectClass:\(listClass[row])")
            
            selectClass = listClass[row]

            
            print("\(selectClass!)")
        
        }
    }
    
    
    
    func datePickerChanged(datePicker:UIDatePicker) {
        // 依據元件的 tag 取得 UITextField
        
        
        let textField = self.view.viewWithTag(200) as? UILabel
        
        
        textField?.text = formatter.string(for: datePicker.date)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    // class Picker API
    func setClassPicker(array:Array<String>){
    
        ////////////class PickerView 用
        //實作一個pickerView 出來
        let myPickerView = UIPickerView()
        
        
        //委託給自己
        myPickerView.delegate = self
        myPickerView.dataSource = self
        
        //將textField(用拉的) 鍵盤改為pickView
        classTextField.inputView = myPickerView
        
        
       let array = array
        
        //預設text為
        classTextField.text = array[0]
        
        
        classTextField.tag = 100
    }
    
    
    func setDatePicker(textField:UITextField){
        formatter = DateFormatter()   //date picker 初始化 日期格式
        formatter.dateFormat = "yyyy 年 MM 月 dd 日"
        //        formatter.dateFormat = "yyyy 年 MM 月 dd 日 h 時 m 分"
        
        
        let textField = textField
        
        
        //實作一個date picker
        let myDatePicker = UIDatePicker()
        
        //模式
        myDatePicker.datePickerMode = .date
        
        //時區
        //        myDatePicker.locale = NSLocale(localeIdentifier: "zh_TW")
        
        //預設日期
        myDatePicker.date = Date()
        
        myDatePicker.addTarget(self, action: #selector(datePickerChanged), for: UIControlEvents.valueChanged)
        
        //鍵盤置換
        textField.inputView = myDatePicker
        
        //預設內容
        textField.text = formatter.string(from: myDatePicker.date)
        
        textField.tag = 200
    
    }
    
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()


        let fullScreenSize = UIScreen.main.bounds.size

//       formatter = DateFormatter()   //date picker 初始化 日期格式
//        formatter.dateFormat = "yyyy 年 MM 月 dd 日"
////        formatter.dateFormat = "yyyy 年 MM 月 dd 日 h 時 m 分"
//        
//        
//        
//       
//        
//        //實作一個date picker
//        let myDatePicker = UIDatePicker()
//        
//        //模式
//        myDatePicker.datePickerMode = .date
//    
//        //時區
////        myDatePicker.locale = NSLocale(localeIdentifier: "zh_TW")
//        
//        //預設日期
//        myDatePicker.date = Date()
//        
//        myDatePicker.addTarget(self, action: #selector(datePickerChanged), for: UIControlEvents.valueChanged)
//        
//        //鍵盤置換
//        textFieldStartDate.inputView = myDatePicker
//        
//        //預設內容
//        textFieldStartDate.text = formatter.string(from: myDatePicker.date)
//        
//        textFieldStartDate.tag = 200
//        
        
        
     
        
        
    
        
        
        
        
        
        listClass.append("美食")
        listClass.append("運動")
        listClass.append("旅遊")
        listClass.append("團康")
        listClass.append("其他")

        ////////////class PickerView 用
        setClassPicker(array: listClass)
        
        //startdate picker
        setDatePicker(textField: textFieldStartDate)
        //enddate picker
        setDatePicker(textField: textFieldEndDate)
        
        
          }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
