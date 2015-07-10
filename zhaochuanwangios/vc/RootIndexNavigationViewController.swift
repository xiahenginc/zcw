//
//  RootIndexNavigationViewController.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-10.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import Foundation


class RootIndexNavigationViewController: UINavigationController ,UINavigationControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.navigationBar.barTintColor = UIColor.colorWithHex("#1984c8")

        self.navigationBar.titleTextAttributes = globals_attributes
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationController(navigationController: UINavigationController,
        willShowViewController viewController: UIViewController,
        animated: Bool){
            if(viewController is IndexWebDetailViewController){
                    //首页，个人信息
                    self.navigationBarHidden = true
            }
            else{
                if(self.navigationBarHidden){
                    //显示导航条
                    self.navigationBarHidden = false
                }
                
                viewController.navigationItem.hidesBackButton = false
                var btnMenu = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
                btnMenu.frame = CGRectMake(0, 0, 32, 32);
                btnMenu.setBackgroundImage(UIImage(named: "menu_icon_normal"), forState: UIControlState.Normal)
                btnMenu.addTarget(self, action: "onClickMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                var rightBarButtonItem = UIBarButtonItem(customView:btnMenu)
               // rightBarButtonItem.initWithCustomView:btn
//                let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu_icon_active"), style: .Plain, target: self, action: "onClickMenu:")
                viewController.navigationItem.rightBarButtonItem = rightBarButtonItem
//                
                var btnBack = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
                btnBack.frame = CGRectMake(0, 0, 32, 32);
                btnBack.setBackgroundImage(UIImage(named: "back_arrow_normal"), forState: UIControlState.Normal)
                btnBack.addTarget(self, action: "onClickBack:", forControlEvents: UIControlEvents.TouchUpInside)
                var leftBarButtonItem = UIBarButtonItem(customView:btnBack)
              //  let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_arrow_active"), style: .Plain, target: self, action: "onClickBack:")
                viewController.navigationItem.leftBarButtonItem = leftBarButtonItem

            }
            // MainTaskViewController
            
    }
    
    var menu : REMenu?
    func onClickMenu(sender: UIViewController) {
        if let menu2 = menu {
        if menu2.isOpen {
            menu2.close()
            return
        }
        }
        menu = createNavMenu()
    }
    func onClickBack(sender: UIViewController) {
        if let menu2 = menu {
            if menu2.isOpen {
                menu2.close()
            }
        }
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