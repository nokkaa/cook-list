//
//  ViewController.swift
//  cook list
//
//  Created by nodoka on 2019/05/02.
//  Copyright © 2019 nodoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    //↓食べた物、ジャンル、日付）（宣言コーナー）
    var dishname : String = ""
    var genre : String = ""
    var date : Date?
    let genrearray = ["和食","洋食","中華"]
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var pickerview: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker! = UIDatePicker()
    
    //画面表示されて最初に行うこと
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.locale =  Locale(identifier: "ja_JP")
        
        // pickerView
        pickerview.delegate = self
        pickerview.dataSource = self
      
    }
     
    //ここで記入したごはんをほぞん
    @IBAction func saveWord() {
        dishname = textfield.text ?? ""
        let index = pickerview.selectedRow(inComponent: 0)
        genre = genrearray[index]
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        dateFormatter.dateFormat = "yyyy年M月d日 H時mm分"
        let dateAndTime = "\(dateFormatter.string(from: datePicker.date))"
    
        
        print(dateAndTime)
        print(dishname)
        print(genre)
        
        let dic: Dictionary<String, String> = ["dishname": dishname, "genre": genre, "dateAndTime": dateAndTime]
        var disharray: [Dictionary<String, String>] = []
        let ud = UserDefaults.standard
        if ud.array(forKey: "disharray") != nil{
            disharray = ud.array(forKey: "disharray") as! [Dictionary<String, String>]
        }
        disharray.append(dic)
        ud.set(disharray, forKey: "disharray")
        let alert = UIAlertController(
            title:"保存完了",
            message: "登録ができました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style:.default ,
            handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
        
    }
    
//    @IBAction func changed(sender: UIDatePicker) {
//        let date2:
//    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genrearray.count
    }


    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genrearray[row]
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

