//
//  ViewController.swift
//  RxSwift_MVVM
//
//  Created by lizhe on 16/4/11.
//  Copyright © 2016年 lizhe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor();
        
        let btn = UIButton(frame: CGRect(x: 40, y: 100, width: 50, height: 40));
        btn.setTitle("login", forState: UIControlState.Normal);
        btn.backgroundColor = UIColor.redColor()
        btn.addTarget(self, action: "login", forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(btn);
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func login()->Void {
        print("login")
        let tarBar = TabBarViewControlelr();
        self.presentViewController(tarBar, animated: true, completion: nil)
    }
}

