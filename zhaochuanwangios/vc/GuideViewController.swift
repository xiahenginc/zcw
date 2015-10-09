//
//  GuideViewController.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-24.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        enterOnclick.layer.masksToBounds = true
        enterOnclick.layer.cornerRadius = 5
        enterOnclick.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        var scrollwidth = self.view.frame.width
//        var scrollheight = self.view.frame.height
        print("cur:\(self.view.bounds.size.width)")
        scrollView.delegate = self
        scrollView.contentSize =  CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height);
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.pagingEnabled = true
        for index in 0...2 {
            let imageview = UIImageView(frame: CGRectMake(CGFloat(index) * self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height))
            let str = NSString(format: "welcome%d.png", index)
            imageview.image = UIImage(named: str as String)
            scrollView.addSubview(imageview)
        }
        pageControll.currentPage = 0
        
//        self.view.bringSubviewToFront(pageControll)
//        self.view.bringSubviewToFront(enterOnclick)
    }
    @IBOutlet var pageControll: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var enterOnclick: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        let bounds = scrollView.frame
        pageControll.currentPage = Int(offset.x / bounds.width)
        print("cur:\(pageControll.currentPage),offset:\(offset),bounds:\(bounds)")
        if(pageControll.currentPage == 2){
            enterOnclick.hidden = false
            self.view.bringSubviewToFront(enterOnclick)
        }
        else{
            enterOnclick.hidden = true
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let contentWidth = CGRectGetWidth(self.scrollView.frame)
        //调整分页控件“点”的位置（默认为－3.5,原因未知。
        var centerx:CGFloat = contentWidth*0.5 - 19.5
        for var i = 0;i < self.pageControll.subviews.count ; i++ {
            let v = self.pageControll.subviews[i] 
            v.frame.origin.x  = centerx
            v.frame.origin.y = self.pageControll.height*0.5 + 10
            centerx += 16
        }
        for v in self.pageControll.subviews{
            print("v:\(v.frame),\(v.bounds)")
            
        }

    }
    @IBAction func onClickStart(sender: AnyObject) {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDel.setAppviewAsRootView()
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
