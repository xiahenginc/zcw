//
//  WebDetailShipViewController.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-23.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import UIKit

class WebDetailViewController: WebBaseViewController, UIAlertViewDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myWebView = self.webView
        loadWebView()
    }
    override func viewDidAppear(animated: Bool){
     
    }
    
    @IBOutlet weak var webView: UIWebView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickPhone(sender: AnyObject) {
        var alert = UIAlertView()
        
        let phone = "400-068-2662"
        alert = UIAlertView(title: "", message: phone, delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "呼叫")
        alert.show()
    }
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            let phone = "4000682662"
            let str = NSString(format:"tel://%@", phone)
            let url = NSURL(string: str as String)
            UIApplication.sharedApplication().openURL(url!)
            
        }
    }


}
