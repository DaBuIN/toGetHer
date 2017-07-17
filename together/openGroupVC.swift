//
//  openGroupVC.swift
//  together
//
//  Created by Seven Tsai on 2017/7/17.
//  Copyright © 2017年 Seven Tsai. All rights reserved.
//

import UIKit

class openGroupVC: UIViewController {
    @IBOutlet weak var pickerClass: UIPickerView!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var classTextField: UITextField!

    var selectedClass:String = ""
    var listClass = [String]()
    var listPicker = [String]()
    var formatter: DateFormatter! = nil

    
    let classPickerView = UIPickerView()

    


    
    
  
    
    
    
//    //////////Class Picker
//    //幾個滾筒
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    //多少筆資料
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
////        if component == 0 {
//        return listClass.count
////        }
//    }
//    
//    //資料內容
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
////        if component == 0 {
//        
//        return listClass[row]
//        }
////    }
//    
//    //使用者選擇的資料
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if component == 0 {
//        
//        print("selectClass:\(listClass[row])")
//            
//        
//            selectedClass = listClass[row]
//            
//            print("\(selectedClass)")
//        
//        }
//    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let fullScreenSize = UIScreen.mainScreen().bounds.size

        let fullScreenSize = UIScreen.main.bounds.size

       
        listClass.append("美食")
        listClass.append("運動")
        listClass.append("旅遊")
        listClass.append("團康")
        listClass.append("其他")

        //見一個ＰＩＣＫＥＲＶＩＥＷ
//        let myPickerView = UIPickerView(frame: CGRect(
//            x: 0, y: fullScreenSize.height * 0.3,
//            width: fullScreenSize.width, height: 150))
//        //myViewController 實作為 classPickerVC
//        let myViewController = classPickerVC()
//
//        
//        
//        self.addChildViewController(myViewController)
//        
//        
//        myPickerView.dataSource = myViewController
//        myPickerView.dataSource = myViewController
//        
//        self.view.addSubview(myPickerView)
        
        
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
