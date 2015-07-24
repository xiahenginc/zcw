//
//  Globals.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-11.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import Foundation

var globals_attributes = [
    NSForegroundColorAttributeName: UIColor.whiteColor(),
   //NSFontAttributeName: UIFont(name: "AvenirNext-Medium", size: 18)!
    NSFontAttributeName: UIFont.boldSystemFontOfSize(20)
]


var GlobalUrl = "http://www.zcwjson.com18.cn/"

func setSkipguide(isSkipguide:Bool){
    var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(isSkipguide, forKey: "skipguide")
}

func getIsSkipguide()->Bool{
   return true
    var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var isSkipguide = defaults.objectForKey("skipguide") as? Bool
    if let b = isSkipguide{
        return b
    }
    return false
}


func showError(message: String, subtitle: String?) {
    var rootViewController:UIViewController = UIApplication.sharedApplication().keyWindow!.rootViewController!
    TSMessage.showNotificationInViewController(
        TSMessage.defaultViewController(),
        title: message,
        subtitle: subtitle,
        image: nil,
        type: TSMessageNotificationType.Error,
        duration: 1,
        callback: nil,
        buttonTitle: nil,
        buttonCallback: nil,
        atPosition: TSMessageNotificationPosition.NavBarOverlay,
        canBeDismissedByUser: true)
}
func showSuccess(message: String, subtitle: String?) {
    var rootViewController:UIViewController = UIApplication.sharedApplication().keyWindow!.rootViewController!
    TSMessage.showNotificationInViewController(
        TSMessage.defaultViewController(),
        title: message,
        subtitle: subtitle,
        image: nil,
        type: TSMessageNotificationType.Success,
        duration: 1,
        callback: nil,
        buttonTitle: nil,
        buttonCallback: nil,
        atPosition: TSMessageNotificationPosition.NavBarOverlay,
        canBeDismissedByUser: true)
}

func showWarning(message: String, subtitle: String?) {
    var rootViewController:UIViewController = UIApplication.sharedApplication().keyWindow!.rootViewController!
    TSMessage.showNotificationInViewController(
        TSMessage.defaultViewController(),
        title: message,
        subtitle: subtitle,
        image: nil,
        type: TSMessageNotificationType.Warning,
        duration: 1,
        callback: nil,
        buttonTitle: nil,
        buttonCallback: nil,
        atPosition: TSMessageNotificationPosition.NavBarOverlay,
        canBeDismissedByUser: true)
}
    