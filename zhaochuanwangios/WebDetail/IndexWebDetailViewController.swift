//
//  WebDetailShipViewController.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-23.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import UIKit

class IndexWebDetailViewController: WebBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myWebView = self.webView
        loadWebView()
    }
    
    var refreshwhenappear = false
    override func viewDidAppear(animated: Bool){
        if(refreshwhenappear){
            
            loadWebView()
        }
    }
    
    @IBOutlet weak var webView: UIWebView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
