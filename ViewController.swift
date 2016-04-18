//
//  ViewController.swift
//  RxSwift_MVVM
//
//  Created by lizhe on 16/4/11.
//  Copyright © 2016年 lizhe. All rights reserved.
//

import UIKit
import Foundation
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
        myExample()
//        let tarBar = TabBarViewControlelr();
//        self.presentViewController(tarBar, animated: true, completion: nil)
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
        example("empty") {
            let emptySequence: Observable<Int> = .empty()
            
            let subscription = emptySequence.subscribe { event in
                print(event)
            }
        }
        
        example("just") {
            let singleElementSequence:Observable<Int>  = .just(32)
            
            let subscription = singleElementSequence
                .subscribe { event in
                    print(event)
            }
        }
        
        example("sequenceOf") { 
            let sequenceOf:Observable<Int> = Observable<Int>.of(1,2,3)
            
            let subscription = sequenceOf.subscribe {event in
                print(event)
            }
        }
        
        example("form") {
//            let sequenceFromArray:Observable<Int>  = [1,2,3].asObservable()
//            let form = [1,2,3,4] as Observable
        }
        let disposeBag = DisposeBag()
        example("create") { 
            let myCreate = { (singleElement:Int)->Observable<Int> in
                return Observable<Int>.create({ (res) -> Disposable in
                    res.onNext(singleElement)
                    res.onCompleted()
                    return NopDisposable.instance
                })
                
            }
            
            let test = myCreate(5).subscribe({ (event) in
                print(event)
            })
        }
        
    }
}

