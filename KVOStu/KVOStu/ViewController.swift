//
//  ViewController.swift
//  KVOStu
//
//  Created by tlc on 2018/3/7.
//  Copyright © 2018年 tlc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 注册成为slider属性的观察着
        slider.addObserver(self, forKeyPath: "value", options: .new, context: nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 移除注册slider属性的观察
        slider.removeObserver(self, forKeyPath: "value")
    }

    //
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        print("1-keyPath:\(keyPath),object:\(object.debugDescription),chane:\(change.debugDescription)")
        
        if keyPath == "value", let change = change {
            //
            print("2-keyPath:\(keyPath),object:\(object.debugDescription),chane:\(change.debugDescription)")
            let value = change[NSKeyValueChangeKey.newKey] as! Float
            showLabel.text = "\(value)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

