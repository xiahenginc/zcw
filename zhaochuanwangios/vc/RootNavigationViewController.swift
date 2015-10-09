//
//  RootNavigationViewController.swift
//  WorkTest
//
//  Created by wxqdev on 14-10-15.
//  Copyright (c) 2014年 wxqdev. All rights reserved.
//

import UIKit

class RootNavigationViewController: UINavigationController ,UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.navigationBar.barTintColor = UIColor.colorWithHex("#1984c8")
        
//        let font = UIFont(name: "AvenirNext-Medium", size: 18.0)
//        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName: font]
 
        self.navigationBar.titleTextAttributes = globals_attributes
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationController(navigationController: UINavigationController,
        willShowViewController viewController: UIViewController,
        animated: Bool){
            if(viewController is IndexWebDetailViewController
                || viewController is UITabBarController){
                //首页，个人信息
                self.navigationBarHidden = true
            }
            else if (viewController is WebDetailMyProfileViewController){
                self.navigationBarHidden = false
                viewController.navigationItem.leftBarButtonItem = nil
                viewController.navigationItem.hidesBackButton = true
                viewController.navigationItem.rightBarButtonItem = nil
                
            }
            else if(viewController is TabFeedbackViewController){
                //意见建议
                viewController.navigationItem.leftBarButtonItem = nil
                viewController.navigationItem.hidesBackButton = true
                viewController.navigationItem.rightBarButtonItem = nil
                //self.navigationBarHidden = true
            }
            else if(viewController is UITestViewController){
                self.navigationBarHidden = true
                viewController.navigationItem.leftBarButtonItem = nil
                viewController.navigationItem.hidesBackButton = true
                viewController.navigationItem.rightBarButtonItem = nil
            }
            else{
                if(self.navigationBarHidden){
                    //显示导航条
                    self.navigationBarHidden = false
                 
                }
                
                let btnBack = UIButton(type: UIButtonType.Custom)
                btnBack.frame = CGRectMake(0, 0, 32, 32);
                btnBack.setBackgroundImage(UIImage(named: "back_arrow_normal"), forState: UIControlState.Normal)
                btnBack.addTarget(self, action: "onClickBack:", forControlEvents: UIControlEvents.TouchUpInside)
                let leftBarButtonItem = UIBarButtonItem(customView:btnBack)
                //  let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_arrow_active"), style: .Plain, target: self, action: "onClickBack:")
                viewController.navigationItem.leftBarButtonItem = leftBarButtonItem
            }
        // MainTaskViewController
            
    }
    func onClickBack(sender: UIViewController) {
        self.popViewControllerAnimated(true)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
