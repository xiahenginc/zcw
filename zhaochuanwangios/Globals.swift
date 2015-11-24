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


var GlobalUrl = "http://interface.zhaochuanw.com/"

func setSkipguide(isSkipguide:Bool){
    let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(isSkipguide, forKey: "skipguide")
}

func getIsSkipguide()->Bool{
   return true
    let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let isSkipguide = defaults.objectForKey("skipguide") as? Bool
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
        duration: 10,
        callback: nil,
        buttonTitle: nil,
        buttonCallback: nil,
        atPosition: TSMessageNotificationPosition.NavBarOverlay,
        canBeDismissedByUser: true)
}

//set checkpassword
func setCheckPassword(isChecked:Bool,Username:String,Password:String){
    let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(isChecked, forKey: "isChecked")
    defaults.setObject(Username, forKey: "Username")
    defaults.setObject(Password, forKey: "Password")
}

func getCheckPassword()->Bool{
    let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let isChecked = defaults.objectForKey("isChecked") as? Bool
    if let r = isChecked {
        return r
    }
    return false
}
func getDefaultUserName()->String!{
    let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var Username = defaults.objectForKey("Username") as? String
    if (Username == nil) {
        Username = ""
    }
    return Username
}

func getDefaultPassword()->String!{
    let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var Password = defaults.objectForKey("Password") as? String
    if (Password == nil) {
        Password = ""
    }
    return Password
}

    