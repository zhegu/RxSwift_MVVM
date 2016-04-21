//
//  LoginViewController.swift
//  RxSwift_MVVM
//
//  Created by lizhe on 16/4/21.
//  Copyright © 2016年 lizhe. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class LoginViewController: BaseViewController {
    
    let loginViewModel = LoginVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor();
        
        
        initLoginUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initLoginUI()->Void {
        let textFieldAccount:UITextField = UITextField(frame: CGRectMake(100,100,150,30))
        textFieldAccount.placeholder = "请输入手机号"
        textFieldAccount.backgroundColor = UIColor.grayColor()
        view.addSubview(textFieldAccount)

        let textFieldPassword:UITextField = UITextField(frame: CGRectMake(100,140,150,30))
        textFieldPassword.secureTextEntry = true
        textFieldPassword.backgroundColor = UIColor.grayColor()
        view.addSubview(textFieldPassword)
        
        let btn = UIButton(frame: CGRect(x: 120, y: 180, width: 50, height: 40));
        btn.setTitle("login", forState: UIControlState.Normal);
        btn.backgroundColor = UIColor.redColor()
//        btn.addTarget(self, action: #selector(LoginViewController.login), forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(btn);
        
        
        let accountOb = textFieldAccount.rx_text.map { (text) -> Observable<LegalResult> in
            return self.loginViewModel.legalAccount(text)
        }
        
        let passwordOb = textFieldPassword.rx_text.map { (text) -> Observable<LegalResult> in
            return self.loginViewModel.legalPassord(text)
        }
        
        let combine = Observable.combineLatest(textFieldAccount.rx_text, textFieldPassword.rx_text) { (account, password) in
            
        }
        
        
        btn.rx_controlEvent(.TouchUpInside).subscribeNext { (a) in
            print(a)
            self.login()
            btn.enabled = false
        }
    }
   
    
    func  login() -> Void {
        print("login")
    }
    
    
    
    
    
    
    
}
