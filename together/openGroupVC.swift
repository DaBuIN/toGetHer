//
//  openGroupVC.swift
//  together
//
//  Created by Seven Tsai on 2017/7/17.
//  Copyright © 2017年 Seven Tsai. All rights reserved.
//



///////////**********開揪團頁面
import UIKit


//因委託給自己所以要加  UIPickerViewDelegate, UIPickerViewDataSource
class openGroupVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    @IBOutlet weak var pickerClass: UIPickerView!
    @IBOutlet weak var imgViewSubject: UIImageView!
    @IBOutlet weak var btnPicOutlet: UIButton!
    @IBOutlet weak var textFieldSubject: UITextField!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var LabelStartTime: UILabel!
    @IBOutlet weak var LabelEndTime: UILabel!
    @IBOutlet weak var textFieldStartDate: UITextField!
    @IBOutlet weak var textFieldEndDate: UITextField!
    @IBOutlet weak var textViewDetail: UITextView!

    var listClass = [String]()  //class list的空陣列

    var selectClass:String?  //class select的資料儲存

    var formatter: DateFormatter! = nil
    var formatter2: DateFormatter! = nil

    var subject:String?
    var location:String?
    var starttime:String?
    var endtime:String?
    var classType:String?
    var detail:String?
    var subjectpic:String?
    
  
   

    
    ////拍照按鈕
    @IBAction func btnTakePic(_ sender: AnyObject) {
    
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "使用相機", style: .default, handler: {(action) in
            openCamera()
        })
        let libraryAction = UIAlertAction(title: "使用相簿", style: .default, handler: {(action) in
            openLibrary()
            
        })
        let cancelAction = UIAlertAction(title: "取消", style: .destructive, handler: {(action) in
            self.dismiss(animated: true, completion: nil)
        })
        
        
        alertController.addAction(cameraAction)
            alertController.addAction(libraryAction)
        alertController.addAction(cancelAction)
        
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = view as? UIView
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.maxY, width: 0, height: 0)
            
        }
        
        self.present(alertController, animated: true, completion: nil)
        
      
        
        //相機拍照
        
        func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
            let imgPickerTakeVC = UIImagePickerController()
            imgPickerTakeVC.sourceType = .camera
            imgPickerTakeVC.delegate = self
            
            show(imgPickerTakeVC, sender: self)
            
            }
        }
        
       //取library
        func openLibrary(){
        let imgPickGetVC = UIImagePickerController()
        imgPickGetVC.sourceType = .photoLibrary
        imgPickGetVC.delegate = self
        
        //規定要跳出
            
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = view as? UIView
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                
            }
            present(imgPickGetVC, animated: true, completion: nil)
            
            
//        imgPickGetVC.modalPresentationStyle = .popover
//        let popover = imgPickGetVC.popoverPresentationController
//        popover?.sourceView = self.view as? UIView
//        
//        popover?.sourceRect = self.view.bounds
//        popover?.permittedArrowDirections = .any
//        
//        show(imgPickGetVC, sender: self)
        
        
        }
    
    }
    
    //拍照finish 實作
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imgTaken = info[UIImagePickerControllerOriginalImage] as! UIImage
        
//        imgViewSubject.image = imgTaken
        
        //將UIImage 變為 jpeg   即為data
        let imgData = UIImageJPEGRepresentation(imgTaken, 0.3)

    
        
        
        
        
            let imgDataBase64 =  imgData?.base64EncodedData()
        
            let imgDataBase64String = imgData?.base64EncodedString()
        

//            print("aaaaaaa\(imgDataBase64)")
        
        print("bbbbbbbbbb\(imgDataBase64String!)")
        
        
//
//    print(imgDataBase64String)
//
        let url = URL(string: "https://together-seventsai.c9users.io/testPhoto.php")
//
        let session = URLSession(configuration: .default)
        var req = URLRequest(url: url!)
        req.httpBody = "data=\(imgDataBase64String!)".data(using: .utf8)
        req.httpMethod = "POST"
        
        let task = session.dataTask(with: req, completionHandler: {(data,response,error) in
            if error != nil{
            print(data)
            }
            
        })
        
        
        
        
                task.resume()
        
        
        
      
        //順便存為相簿圖檔
//       let imgInLib = UIImageWriteToSavedPhotosAlbum(imgTaken, nil, nil, nil)
        
        
        
        //將相片儲存到雲端
        
      //https://together-seventsai.c9users.io/photo/groupimg/
        
        //時間
        let interval = Date.timeIntervalSinceReferenceDate
        //                let docDir = NSHomeDirectory() + "/Documents"
        
//        let imgRelativePath = "/saveimg/\(app.account!)_\(interval).jpg"
        
        //圖片的命名(其路徑含名稱)
//        let imgFile = "\(docDir)\(imgRelativePath)"
//        print("imgFile:\(imgFile)")
        //pathString to url
//        let urlFilePath = URL(fileURLWithPath: imgFile)
        
//        var account = "account1"
//        var groupid = "gid1"
//        
//        let c9Path = "https://together-seventsai.c9users.io/photo/groupimg/"
//        let imgFilePath = "\(c9Path)\(account)_\(groupid)_\(interval).jpg"
//        
//        let urlImgFilePath = URL(fileURLWithPath: imgFilePath)
//        print(urlImgFilePath)
//        
//        do {
//            //將data 存下來
//            
//            
//            try data?.write(to: urlImgFilePath)
//            
//            print("save ok")
//        }catch {
//            print(error)
//        }

        
        
        
        
        
        
        
        
        dismiss(animated: true, completion: nil)

    }
    
    //拍照cancel 實作
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    //

    
    
    
    /////////submit
    @IBAction func submit(_ sender: Any) {
        
        
        
        subject = textFieldSubject.text
        location = "我家"
        
        if detail == nil {
            detail = "I'mDetail"
        }else{
                    detail = textViewDetail.text
        }

        
        subjectpic = "nopic"
        
        
        print(subject!)
        print(location!)
        print(starttime!)
        print(endtime!)
        print(classType!)
        print(detail!)
        print(subjectpic!)
        
        let url = URL(string: "https://together-seventsai.c9users.io/openSubject.php")
        let session = URLSession(configuration: .default)
        var req = URLRequest(url: url!)
        req.httpBody = "subject=\(subject!)&location=\(location!)&starttime=\(starttime!)&endtime=\(endtime!)&class=\(classType!)&detail=\(detail!)&subjectpic=\(subjectpic!)".data(using: .utf8)
        req.httpMethod = "POST"
        
        
        
        
        let task = session.dataTask(with: req, completionHandler: {(data,response,error) in
            if error == nil {
            
                print("add success")
                
                
            }else{ print(error)}
            
            
        })
        
        task.resume()
        
        
    }
    

    
   
    
    
    // class Picker API。建構一個classPicker
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
        
        
        //讓classType(傳值用)
        classType = classTextField.text
        
        
        classTextField.tag = 100
    }
    
    
    //////////Class Picker 實作
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
            
            //        print("selectClass:\(listClass[row])")
            
            classType = field?.text
            
            
            print("select:\(classType!)")
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //////////DatePicker API  建構一個datePicker 取代鍵盤
    func setStartDatePicker(textField:UITextField){
        formatter = DateFormatter()   //date picker 初始化 日期格式
        formatter.dateFormat = "yyyy年MM月dd日HH時mm分"
        
        
        var textField = textField
        
        //實作一個date picker
        let myDatePicker = UIDatePicker()
        
        //模式
        myDatePicker.datePickerMode = .dateAndTime
        
        //時區
                myDatePicker.locale = Locale(identifier: "zh_TW")
        
        //預設日期
        
        
        myDatePicker.date = Date()
        
        myDatePicker.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: .valueChanged)
        
        //鍵盤置換
        textField.inputView = myDatePicker
        
        //預設內容
        textField.text = formatter.string(from: myDatePicker.date)
        
        textField.tag = 200
    
        
        //讓變數starttime 取得改變後的值 以利後續傳值至後端
        starttime = textField.text!
    }
    
    
    ////////////datePicker的實作
    
    
    //startDatePicker 實作
    func datePickerChanged(datePicker:UIDatePicker) {
        // 依據元件的 tag 取得 UITextField
        
        //指定tag
        let textField = self.view.viewWithTag(200) as? UITextField
//        let textField2 = self.view.viewWithTag(300) as? UITextField
        
        //改變日期時 文字也改變
        textField?.text = formatter.string(for: datePicker.date)
//        textField2?.text = formatter2.string(from: datePicker.date)
        //        starttime = textField?.text
        
        //讓變數starttime 取得改變後的值 以利後續傳值至後端
        starttime = textField?.text!

    }
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    // endDatePicker 的 API  建構一個mydatePicker2
    func setEndDatePicker(textField:UITextField){
        formatter2 = DateFormatter()   //date picker 初始化 日期格式
        formatter2.dateFormat = "yyyy年MM月dd日HH時mm分"
        
        
        var textField2 = textField
        
        //實作一個date picker
        let myDatePicker2 = UIDatePicker()
        
        //模式
        myDatePicker2.datePickerMode = .dateAndTime
        
        //時區
                myDatePicker2.locale = Locale(identifier: "zh_TW")
        
        //預設日期
        
        
        myDatePicker2.date = Date()
        
        myDatePicker2.addTarget(self, action: #selector(datePickerChanged2(datePicker:)), for: .valueChanged)
        
        //鍵盤置換
        textField2.inputView = myDatePicker2
        
        //預設內容
        textField2.text = formatter2.string(from: myDatePicker2.date)
        
        textField2.tag = 300
        
        
        //讓變數endtime 取得改變後的值 以利後續傳值至後端
                endtime = textField2.text!
    }
    
    
    //endDatePicker 實作
    func datePickerChanged2(datePicker:UIDatePicker) {
        // 依據元件的 tag 取得 UITextField
        
        //指定tag
        //        let textField = self.view.viewWithTag(200) as? UITextField
        let textField2 = self.view.viewWithTag(300) as? UITextField
        
        //改變日期時 文字也改變
        //        textField?.text = formatter.string(for: datePicker.date)
        textField2?.text = formatter2.string(from: datePicker.date)
        //        starttime = textField?.text
        
        //讓變數endtime 取得改變後的值 以利後續傳值至後端

        endtime = textField2?.text
    }
    
    
    
    
    
    
    
    
    //隱藏鍵盤手勢
    func hideKeyborad(tapG: UITapGestureRecognizer) {
        
        self.view.endEditing(true)
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let imgBtn = UIImage(named: "cat.png")
//        
//        btnPicOutlet.setImage(imgBtn, for: .normal)
        
        
        
        let fullScreenSize = UIScreen.main.bounds.size

        
        listClass.append("美食")
        listClass.append("運動")
        listClass.append("旅遊")
        listClass.append("團康")
        listClass.append("其他")

        ////////////class PickerView 用
        setClassPicker(array: listClass)
        
        //startdate picker  參數為 要作為點選的textfield 與  要紀錄的變數
        
        setStartDatePicker(textField: textFieldStartDate)
        //enddate picker
        setEndDatePicker(textField: textFieldEndDate)
        
        
        
        /////////點擊空白返回鍵盤(被我們改為picker了)

        let tapBack = UITapGestureRecognizer(target: self, action: #selector(hideKeyborad(tapG:)))
        
       
        tapBack.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tapBack)
        
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
