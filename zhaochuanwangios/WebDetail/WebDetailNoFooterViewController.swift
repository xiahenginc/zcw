//
//  WebDetailNoFooterViewController.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-25.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import UIKit

class WebDetailNoFooterViewController: WebBaseViewController {

    
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
    
    
}
