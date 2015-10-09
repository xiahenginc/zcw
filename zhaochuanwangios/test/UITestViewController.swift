//
//  UITestViewController.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-2.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import UIKit

class UITestViewController: UIViewController , UIAlertViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            let phone = "4000682662"
            let str = NSString(format:"tel://%@", phone)
            let url = NSURL(string: str as String)
            UIApplication.sharedApplication().openURL(url!)
            
        }
    }
    override func viewDidAppear(animated: Bool){
        var alert = UIAlertView()
        
        let phone = "400-068-2662"
        alert = UIAlertView(title: "", message: phone, delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "呼叫")
        alert.show()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func onClickShipPublish(sender: AnyObject) {
       

    }
    
    @IBAction func onClickPalletPublish(sender: AnyObject) {
        
    }
    
    @IBAction func onClickJobhunting(sender: AnyObject) {
        
    }
    @IBAction func onClickSupplyInfo(sender: AnyObject) {
        
    }
    @IBAction func onClickPurchaseInfo(sender: AnyObject) {
        
    }
    @IBAction func onClickJobRecuritment(sender: AnyObject) {
        
    }
    @IBAction func onClickShipBuy(sender: AnyObject) {
    }
    @IBAction func onClickShipRent(sender: AnyObject) {
    }
    @IBAction func onClickShipLend(sender: AnyObject) {
    }
    @IBAction func onClickShipSale(sender: AnyObject) {
    
    }
    
    
    @IBAction func onClickInfoPublish(sender: AnyObject) {
     
        
    }
    @IBAction func onClickMemberCenter(sender: AnyObject) {
             
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
