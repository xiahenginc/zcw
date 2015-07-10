//
//  TabFeedbackViewController.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-3-31.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import UIKit

class TabFeedbackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        feedbackTextView.backgroundColor = UIColor.whiteColor()
        feedbackTextView.layer.borderColor = UIColor.colorWithHex("#CCCCCC")?.CGColor;
        feedbackTextView.layer.borderWidth = 1
        feedbackTextView.layer.cornerRadius = 8.0
        feedbackTextView.contentInset = UIEdgeInsetsMake(-7.0,0.0,0.0,0.0)
        
        commitbtn.layer.borderColor = UIColor.clearColor().CGColor
        commitbtn.layer.borderWidth = 1
        commitbtn.layer.cornerRadius = 6
        commitbtn.layer.masksToBounds = true
        
        commitbtn.setTitleColor(UIColor.whiteColor(),forState:UIControlState.Normal)
        commitbtn.setBackgroundImage(UIImage.imageWithColor(UIColor.colorWithHex("#4ABE53")), forState: UIControlState.Normal)
        
        var navigationBarViewRect:CGRect = CGRectMake(0.0,0.0,0.0,0.0)
        keyboard = KeyboardManager(controller: self,navRect:navigationBarViewRect)
    }
    var keyboard:KeyboardManager!
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        keyboard.enableKeyboardManger()
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        keyboard.disableKeyboardManager()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        keyboard.endEditing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var feedbackTextView:UITextView!
    @IBOutlet weak var commitbtn:UIButton!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onClickCommit(sender: AnyObject) {
    }
}
