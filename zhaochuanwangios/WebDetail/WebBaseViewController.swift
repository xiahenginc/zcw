//
//  WebBaseViewController.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-30.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import UIKit

class WebBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onLoginRefresh:", name: "onLoginRefresh", object: nil)
        self.navigationController?.navigationBarHidden = true
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDel.curDetailView = self
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func onLoginRefresh(notification: NSNotification){
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDel.curDetailView = self
        println("onLoginRefresh:\(detailname),\(uid)")
        loadWebView()
    }
    
    var myWebView:UIWebView?
    var detailname = ""
    var paramdict = Dictionary<String,String>()
    func loadWebView() {
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if(detailname == "dl" && count(uid) > 0 && self.navigationController == appDel.profileNav){
            detailname = "grzx"
        }
        else if(detailname == "grzx" && count(uid) == 0 && self.navigationController == appDel.profileNav){
            detailname = "dl"
        }
        println("loadWebView:\(detailname),\(uid)")
        paramdict["<%=uid%>"]=uid
        paramdict["<%=host%>"]="local"
        paramdict["<%=defaultusername%>"]=defaultusername
        paramdict["<%=defaultpassword%>"]=defaultpassword
        myWebView?.opaque = false
        myWebView?.backgroundColor = UIColor.clearColor()
        if let htmlFile = NSBundle.mainBundle().pathForResource(detailname, ofType: "htm") {
            if let htmlData = NSData(contentsOfFile: htmlFile){
                var htmlString = NSString(data:htmlData,encoding:NSUTF8StringEncoding)!
                for pair in paramdict{
                    htmlString = htmlString.stringByReplacingOccurrencesOfString(pair.0, withString: pair.1)
                }
                println("detailname:\(detailname),WebBaseViewController:\(htmlString)")
                let nshtmdata = htmlString.dataUsingEncoding(NSUTF8StringEncoding)
                
                let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
                myWebView?.loadData(nshtmdata, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
            
        }
        
        
    }

}
