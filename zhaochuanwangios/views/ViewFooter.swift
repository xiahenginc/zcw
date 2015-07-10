//
//  ViewFooter.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-5.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import UIKit

class ViewFooter: UIView , UIAlertViewDelegate{

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    @IBOutlet var view: UIView!
    
    private func setup() {
        
        NSBundle.mainBundle().loadNibNamed("ViewFooter", owner: self, options: nil)[0] as! UIView
        
        self.addSubview(view)
        self.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let viewsDictionary = ["view": view]
        
        let view1_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[view]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let view1_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[view]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        self.addConstraints(view1_constraint_H)
        self.addConstraints(view1_constraint_V)
        
        
    }
    
//    @IBAction func onClickCallPhone(sender: AnyObject) {
//        var alert = UIAlertView()
//      
//        var phone = "400-068-2662"
//        alert = UIAlertView(title: "", message: phone, delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "呼叫")
//        alert.show()
//    }
//    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
//        if buttonIndex == 1 {
//            var phone = "4000682662"
//            var str = NSString(format:"tel://%@", phone)
//            var url = NSURL(string: str)
//            UIApplication.sharedApplication().openURL(url!)
//           
//        }
//    }
    @IBAction func onClickCompanyNews(sender: AnyObject) {
    }
    @IBAction func onClickNews(sender: AnyObject) {
       
    }
    @IBAction func onClickMetrolog(sender: AnyObject) {
        
    }
    @IBAction  func onClickAdvice(sender: AnyObject) {
        
    }

}
