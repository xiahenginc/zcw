//
//  WebDetailMyProfileViewController.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-27.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import UIKit

class WebDetailMyProfileViewController: WebBaseViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myWebView = self.webView
        loadWebView()
    }
    override func viewDidAppear(animated: Bool){
//        if let htmlFile = NSBundle.mainBundle().pathForResource(detailname, ofType: "htm") {
//            if let htmlData = NSData(contentsOfFile: htmlFile){
//                var htmlString = NSString(data:htmlData,encoding:NSUTF8StringEncoding)!
//                for pair in paramdict{
//                    htmlString = htmlString.stringByReplacingOccurrencesOfString(pair.0, withString: pair.1)
//                }
//                
//                let nshtmdata = htmlString.dataUsingEncoding(NSUTF8StringEncoding)
//                
//                let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
//                self.webView.loadData(nshtmdata, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
//            }
//            
//        }
        
    }
    
    @IBOutlet weak var webView: UIWebView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
