//
//  BallDynamicViewController.swift
//  MyBasketBallProject
//
//  Created by lizhe on 16/3/5.
//  Copyright © 2016年 lizhe. All rights reserved.
//

import UIKit
import HMSegmentedControl
class BallDynamicViewController: BaseViewController {
    var HMSegmentedCtrl:HMSegmentedControl? = nil
    var containView:UIView? = nil
    let hotViewController:HotViewController? = HotViewController();
    let newsViewController:NewsViewController? = NewsViewController();
    let nbaViewController:NBAViewController? = NBAViewController();
    let cbaViewController:CBAViewController? = CBAViewController();
    let folkViewController:FolkViewController? = FolkViewController();
    let equipmentViewController:EquipmentViewController? = EquipmentViewController()
    let lalaTeamViewController:LalaTeamViewController? = LalaTeamViewController()
    var currentViewController:UIViewController? = nil
    var myIndexBlock :IndexChangeBlock? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
//        self.navigationController?.navigationBar.topItem?.title = "动态"
//        self.navigationController?.navigationBar.tintColor = UIColor.redColor()
//        let segItems = ["全部","新闻","NBA","CBA","民间","装备","拉拉队"]
//        
//        segment = UISegmentedControl(items: segItems)
//        segment!.frame =  CGRect(x: 0, y: NAVIGATION_HEIGHT, width: SCR_W, height: SEGMENT_HEIGHT)
//        self.view.addSubview(segment!)
        
//        let tableView = UITableView(frame: CGRect(x: 0.0, y: NAVIGATION_HEIGHT + SEGMENT_HEIGHT, width: SCR_W, height: SCR_H - NAVIGATION_HEIGHT - SEGMENT_HEIGHT))
//        tableView.delegate = self;
        
        // Do any additional setup after loading the view.
/*AnimatedSegment
        let segmentedSwitch = AnimatedSegmentSwitch()
        segmentedSwitch.frame = CGRect(x: 0, y: NAVIGATION_HEIGHT, width: SCR_W, height: SEGMENT_HEIGHT)
        segmentedSwitch.autoresizingMask = [.FlexibleWidth]
        segmentedSwitch.backgroundColor = UIColor(red: 85.0/255.0, green: 172.0/255.0, blue: 238.0/255.0, alpha: 1)
        segmentedSwitch.selectedTitleColor = UIColor(red: 85.0/255.0, green: 172.0/255.0, blue: 238.0/255.0, alpha: 1)
        segmentedSwitch.titleColor = .whiteColor()
        segmentedSwitch.font = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        segmentedSwitch.thumbColor = .whiteColor()
        segmentedSwitch.items = ["Week", "Month", "Year"]
        segmentedSwitch.addTarget(self, action: "segmentValueDidChange:", forControlEvents: .ValueChanged)
        
        view.addSubview(segmentedSwitch)
*/
        
/***
** HMSegmentController
***/
        
//        var myTaskListController : SwiftMyTaskListViewController? = SwiftMyTaskListViewController()
//        var myTaskFinishedListController :MyTaskFinishedListViewController? = MyTaskFinishedListViewController()
        self.title = "动态"
        self.view.backgroundColor = UIColor(white: 1, alpha: 1)
        self.automaticallyAdjustsScrollViewInsets = false
        self.setMyBlock()
        self.initHMSegmentedCtrl()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segmentValueDidChange(ind:AnyObject)->Void {
        print("num is \(ind)")
    }
    // MARK: - init
    func initHMSegmentedCtrl() {
//        let myNewTask:String = "待办任务";
//        let myFinishedTask:String  = "已办任务";
        let items = ["热门","新闻","NBA","CBA","民间","装备","拉拉队"]
        HMSegmentedCtrl = HMSegmentedControl(sectionTitles: items)
        HMSegmentedCtrl!.frame = CGRectMake(0, Swift_NAVIGATION_HEIGHT, Swift_SCR_W, 44)
        HMSegmentedCtrl!.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
//        HMSegmentedCtrl!.backgroundColor = UIColor.whiteColor()
        //设置导航标题的颜色及字体大小
        let dic:Dictionary = Dictionary(dictionaryLiteral: (NSForegroundColorAttributeName, UIColor.blackColor()))
        HMSegmentedCtrl!.titleTextAttributes = dic;
        let dicChoose:Dictionary = Dictionary(dictionaryLiteral: (NSForegroundColorAttributeName, Swift_BlueColor))
        HMSegmentedCtrl!.selectedTitleTextAttributes = dicChoose
        HMSegmentedCtrl!.selectionIndicatorColor = Swift_BlueColor //选中横线的颜色
        HMSegmentedCtrl!.selectionIndicatorHeight = 3; //选择的下面那一条横线
        HMSegmentedCtrl!.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        HMSegmentedCtrl!.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        HMSegmentedCtrl!.verticalDividerEnabled = true;
        HMSegmentedCtrl!.verticalDividerColor = UIColor(white: 1, alpha: 1);
        
        containView = UIView(frame: CGRectMake(0, 44+Swift_NAVIGATION_HEIGHT, Swift_SCR_W, Swift_SCR_H-44-Swift_NAVIGATION_HEIGHT));
        
        self.view.addSubview(containView!)
        self.view.addSubview(HMSegmentedCtrl!)
        
        self.addChildViewController(hotViewController!)
        self.addChildViewController(newsViewController!)
        self.addChildViewController(nbaViewController!)
        self.addChildViewController(cbaViewController!)
        self.addChildViewController(folkViewController!)
        self.addChildViewController(equipmentViewController!)
        self.addChildViewController(lalaTeamViewController!)
        
        containView?.addSubview(hotViewController!.view)
        currentViewController = hotViewController!
//        (hotViewController?.view)!.frame = CGRect(x: 0, y: 44+Swift_NAVIGATION_HEIGHT, width: Swift_SCR_W, height: Swift_SCR_H-44-Swift_NAVIGATION_HEIGHT)
//        self.view.addSubview((hotViewController?.view)!)

        HMSegmentedCtrl!.indexChangeBlock = myIndexBlock
        
    }

    func setMyBlock()->Void {
        weak var controller:BallDynamicViewController? = self
        myIndexBlock = {
            (index:Int) in
            var to : UIViewController?;
            if (0 == index) {
                to = controller!.hotViewController!;
            }else if (1 == index){
                to = controller!.newsViewController!;
            }else if (2 == index) {
                to = controller!.nbaViewController!
            }else if (3 == index){
                to = controller!.cbaViewController!;
            }else if (4 == index){
                to = controller!.folkViewController!;
            }else if (5 == index){
                to = controller!.equipmentViewController!;
            }else if (6 == index){
                to = controller!.lalaTeamViewController!;
            }
            controller!.transitionFromViewController (
                controller!.currentViewController!,
                toViewController: to!,
                duration: 0,
                options: UIViewAnimationOptions.TransitionNone,
                animations: { () -> Void in
                    
                },
                completion: { ( finished ) -> Void in
                    if finished {
                        controller?.currentViewController = to
                    }
                }
            )
        }
    }
    

}
