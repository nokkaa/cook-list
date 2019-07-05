//
//  AdviceViewController.swift
//  cook list
//
//  Created by nodoka on 2019/05/03.
//  Copyright © 2019 nodoka. All rights reserved.
//

import UIKit

class AdviceViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    let foodname: [String] = ["オムライス","ラーメン","煮魚"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Tappedbutton() {
        let randomValue = foodname.randomElement()!
        label.text = randomValue
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
