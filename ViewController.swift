//
//  ViewController.swift
//  RxSwift_MVVM
//
//  Created by lizhe on 16/4/11.
//  Copyright © 2016年 lizhe. All rights reserved.
//

import UIKit
import RxSwift

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
    
    func example(description: String, action: () -> ()) {
        print("\n--- \(description) example ---")
        action()
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func myExample()->Void {
        
//        let em : Observable<String> = empty()
        
        example("empty") {
//            let emptySequence: Observable<Int> = empty()
//            
//            let subscription = emptySequence.subscribe { event in
//                print(event)
//            }
        }
    }
}

