//
//  AppDelegate.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-3-31.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var indexNav:RootIndexNavigationViewController?
    var profileNav:RootNavigationViewController?
    var adviceNav:RootNavigationViewController?
    var curDetailView:WebBaseViewController?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //-------------------------start
        let version : NSString = UIDevice.currentDevice().systemVersion
        if version.floatValue >= 8.0 {
            let myTypes = UIUserNotificationType.Badge | UIUserNotificationType.Alert | UIUserNotificationType.Sound
            let settings = UIUserNotificationSettings(forTypes: myTypes, categories: nil)
            application.registerUserNotificationSettings(settings)
        } else {
            let myTypes = UIRemoteNotificationType.Badge | UIRemoteNotificationType.Alert | UIRemoteNotificationType.Sound
            application.registerForRemoteNotificationTypes(myTypes)
        }
        BPush.registerChannel(launchOptions, apiKey: "VCcGL2TbxAOkcSHPFU9mZbz6", pushMode: BPushMode.Production, withFirstAction: nil, withSecondAction: nil, withCategory: nil, isDebug: true)
   //     BPush.registerChannel(launchOptions, apiKey: "VCcGL2TbxAOkcSHPFU9mZbz6", pushMode: BPushMode.Development, withFirstAction: nil, withSecondAction: nil, withCategory: nil, isDebug: true)
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        //-------------------------end
        defaultusername = getDefaultUserName()
        defaultpassword = getDefaultPassword()
        
 
        _setupProxy()

        if(getIsSkipguide()){
            setAppviewAsRootView()
        }
        else{
            setSkipguide(true)
        }

        testNotify()
        return true
    }
    
    
    func testNotify(){
  
        //oswift.sendLocalMessage("测试一个数据看看呢")
    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings){
        application.registerForRemoteNotifications()
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData){
        
        BPush.registerDeviceToken(deviceToken);
        BPush.bindChannelWithCompleteHandler(
            {(result:AnyObject! , err:NSError!)->Void in
                print("test")
                return
            //[self.viewController addLogString:[NSString stringWithFormat:@"Method: %@\n%@",BPushRequestMethodBind,result]];
        })

    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError){
        
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]){
        BPush.handleNotification(userInfo)
        
        let theJSONData = NSJSONSerialization.dataWithJSONObject(
            userInfo ,
            options: NSJSONWritingOptions(0),
            error: nil)
        let theJSONText = NSString(data: theJSONData!,
            encoding: NSASCIIStringEncoding)
        showSuccess("","JSON string = \(theJSONText!)");
        
        var strMsg = ""
        var strId = ""
        
        if let apsDictionary = userInfo["aps"] as? [NSObject:AnyObject] {
            if let alertString = apsDictionary["alert"] as? String {
                strMsg = alertString
            }
            
        }
        
        if let idString = userInfo["key1"] as? String{
            strId = idString
        }
   
        showMsgInfo("http://www.baidu.com")
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification){
        BPush.showLocalNotificationAtFront(notification,identifierKey: nil)
    }


    
    func setAppviewAsRootView(){
        
        // Override point for customization after application launch.
        var storyBoardMain = UIStoryboard(name:"Main",bundle:nil)
        var AppNav = storyBoardMain.instantiateViewControllerWithIdentifier("rootTab") as! UITabBarController
        
      //  indexNav = storyBoardMain.instantiateViewControllerWithIdentifier("tab1") as? RootIndexNavigationViewController
      
        var storyBoardWeb = UIStoryboard(name:"infodetail",bundle:nil)
        var dvcindex = storyBoardWeb.instantiateViewControllerWithIdentifier("indexwebdetail") as!IndexWebDetailViewController
        dvcindex.detailname = "index"
        dvcindex.title = "首页"
        dvcindex.tabBarItem = UITabBarItem(title:dvcindex.title,image:UIImage(named:"ic_nav_home_normal"),tag:1)
        //dvc.paramdict = paramdict
        indexNav = RootIndexNavigationViewController(rootViewController:dvcindex)
        //indexNav!.rootViewController = dvcindex
        
        var vc2 = storyBoardMain.instantiateViewControllerWithIdentifier("tab2") as! RootNavigationViewController
       // var vc3 = storyBoardMain.instantiateViewControllerWithIdentifier("tab3") as RootNavigationViewController
      
        setLogin()
        setAdvice()
//        var vc4 = storyBoardMain.instantiateViewControllerWithIdentifier("tab4") as RootNavigationViewController
//        
        
        AppNav.viewControllers = [indexNav!,vc2,profileNav!,adviceNav!]
        
        self.window!.rootViewController = AppNav
    }
    func setAdvice(){
        var storyBoardWeb = UIStoryboard(name:"infodetail",bundle:nil)
        var dvcAdvice = storyBoardWeb.instantiateViewControllerWithIdentifier("webdetailmyprofile") as! WebDetailMyProfileViewController
        dvcAdvice.detailname = "yjjy"
        dvcAdvice.title = "意见建议"
        dvcAdvice.tabBarItem = UITabBarItem(title:dvcAdvice.title,image:UIImage(named:"ic_nav_opinion_normal"),tag:2)
        
        //dvc.paramdict = paramdict
        adviceNav = RootNavigationViewController(rootViewController:dvcAdvice)
        
    }
    
    func setLogin(){
        var storyBoardWeb = UIStoryboard(name:"infodetail",bundle:nil)
        var dvcLogin = storyBoardWeb.instantiateViewControllerWithIdentifier("indexwebdetail") as! IndexWebDetailViewController
        dvcLogin.detailname = "dl"
        dvcLogin.title = "个人"
        dvcLogin.refreshwhenappear  = true
        dvcLogin.tabBarItem = UITabBarItem(title:dvcLogin.title,image:UIImage(named:"ic_nav_me_normal"),tag:2)
        
        //dvc.paramdict = paramdict
        profileNav = RootNavigationViewController(rootViewController:dvcLogin)

    }
    func showMsgInfo(msgUrl:String){
        var storyBoardWeb = UIStoryboard(name:"infodetail",bundle:nil)
        var dvcMsg = storyBoardWeb.instantiateViewControllerWithIdentifier("urlwebdetail") as! WebDetailUrlViewController
        dvcMsg.url = msgUrl
        dvcMsg.title = "消息"
        self.curDetailView?.navigationController?.pushViewController(dvcMsg, animated: true)
      //  var popMsg = UINavigationController(rootViewController:dvcMsg)
        
    }
    
    func test(){
//        request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
//            .responseSwiftyJSON { (request, response, json, error) in
//            println(json)
//            println(error)
//        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func _setupProxy(){
        WebViewProxy.handleRequestsWithHost("localperson", handler: {
            (req:NSURLRequest!,res:WVPResponse! )-> Void in
            //            //http://local/cbjy.htm#__webviewproxyreq__
            var uriid = self.getSubString(req.URLString,starts: "/",ends: ".htm")
            println(uriid)
            dispatch_sync(dispatch_get_main_queue(), {
                var title = ""
                switch(uriid){
                case "jbzl":
                    title = "基本资料"
                case "xxtx":
                    title = "消息提醒"
                case "wdft":
                    title = "我的发贴"
                case "gz":
                    title = "谁关注我"
                case "mygz":
                    title = "我的关注"
                case "xgmm":
                    title = "修改密码"
                case "update":
                    title = "版本更新"
                    return
                case "bz":
                    title = "帮助"
                case "zc":
                    title = "注册"
                    navto_webinfo_personal(uriid,title)
                    return
                case "tc":
                    uid = ""
                    sessionId = ""
                    defaultusername = ""
                    defaultpassword = ""
                    setCheckPassword(true,defaultusername,defaultpassword)
                    dispatch_async(dispatch_get_main_queue(), {
                        NSNotificationCenter.defaultCenter().postNotificationName("onLoginRefresh", object: nil)
                    })
                
                    return
                default:
                    title = "个人信息"
                }
                navto_webinfo_nofooter_personal(uriid,title)
            })
        })

        //普通点击页面
        WebViewProxy.handleRequestsWithHost("local", handler: {
            (req:NSURLRequest!,res:WVPResponse! )-> Void in
//            //http://local/cbjy.htm#__webviewproxyreq__
            var uriid = self.getSubString(req.URLString,starts: "/",ends: ".htm")
                    println(uriid)
                    dispatch_sync(dispatch_get_main_queue(), {
                        var title = ""
                        switch(uriid){
                            case "fbxx":
                                title = "信息发布"
                            case "hp":
                                 title = "货盘信息"
                            case "cp":
                                 title = "船盘信息"
                            case "zxtb":
                                 title = "在线投保"
                            case "cywz":
                                 title = "物资市场"
                            case "cbjy":
                                 title = "船舶交易"
                            case "hr":
                                 title = "人才中心"
							case "trbj_index":
                                 title = "他人报价"	
                            case "qxxx":
                                 title = "气象信息"
                            case "ssxw":
                                 title = "时事新闻"
                            case "cylt":
                                title = "船友之家"
                                navto_webinfo_nofooter(uriid,title)
                                return
                            case "gxcb":
                                title = "更新我的船舶"
                                navto_webinfo_nofooter(uriid,title)
                                return
                            case "yjjy":
                               title = "意见建议"

                        case "hpfb":
                            title = "货盘发布"
                        case "cpfb":
                            title = "船盘发布"
                        case "gyxx":
                            title = "供应信息"
                        case "cgxx":
                            title = "采购信息"
                        case "rczp":
                            title = "人才招聘"
                        case "rcqz":
                            title = "人才求职"
                        case "cbcs":
                            title = "船舶出售"
                        case "cbqs":
                            title = "船舶求售"
                        case "cz":
                            title = "船舶出租"
                        case "cbqz":
                            title = "船舶求租"
                        case "about":
                            title = "公司简介"
                        case "ssxw":
                            title = "时事新闻"
                        case "qxxx":
                            title = "气象信息"
                        case "yjjy":
                            title = "意见建议"
                        default:
                            title = "信息"
                        }
                        navto_webinfo(uriid,title)
                    })
        })
        
        //发送数据页面
        WebViewProxy.handleRequestsWithHost("post", handler: {
            (req:NSURLRequest!,res:WVPResponse! )-> Void in
            println(req.URLString)
            println(req.HTTPBody)
            var uriid = self.getSubString(req.URLString,starts: "/",ends: "#")
            if(uriid == "login" ){//登录比较特殊
                var redirecturl = GlobalUrl + "login"
                var url:NSURL = NSURL(string:redirecturl)!
                let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
                request.HTTPMethod  = "POST"
                request.HTTPBody = req.HTTPBody
                request.timeoutInterval = 10.0
                NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
                    (response,data,error) -> Void in
                   

                    if let err = error{
                       println("\(err)")
                    }
                    else{
                     var htmlString = NSString(data:data,encoding:NSUTF8StringEncoding)!
                        if(response.MIMEType == "application/json"
                            || response.MIMEType == "text/json"){
                                let jsonData = NSJSONSerialization.JSONObjectWithData(data,options:NSJSONReadingOptions.MutableContainers,
                                    error:nil) as! NSDictionary
                                
                                res.respondWithJSON(jsonData as [NSObject : AnyObject])
                                uid = jsonData["login"]!.valueForKey("uid") as! String
                                if let defaultusername = jsonData["login"]!.valueForKey("defaultusername") as? String{
                                    
                                }
                                else{
                                    
                                }
                                if let defaultpassword = jsonData["login"]!.valueForKey("defaultpassword") as? String{
                                    
                                }
                                else{
                                    
                                }
                                setCheckPassword(true,defaultusername,defaultpassword)
                                if let httpResponse = response as? NSHTTPURLResponse {
                                    for (name, value) in httpResponse.allHeaderFields {
                                        println("kv:\(name),\(value)")
                                        if name == "Set-Cookie" {
                                            let sessionStr = value as! String
                                            sessionId = self.getSubString(sessionStr,starts: "=",ends: ";")
                                        }
                                    }
                                }
                                
                        }else{
                            res.respondWithText(htmlString as String)
                            uid = ""
                            sessionId = ""
                        }

                        dispatch_async(dispatch_get_main_queue(), {
                            NSNotificationCenter.defaultCenter().postNotificationName("onLoginRefresh", object: nil)
                        })

                    }
                })
            }
            else{
                var redirecturl = GlobalUrl + uriid
                println("remote url:redirecturl:\(redirecturl)")
                var url:NSURL = NSURL(string:redirecturl)!
                let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
                request.HTTPMethod  = "POST"
                request.HTTPBody = req.HTTPBody
                var postString = NSString(data:req.HTTPBody!,encoding:NSUTF8StringEncoding)!
                println("send post data:--->\(postString)")
                if(sessionId != "")
                {
                    request.addValue(sessionId,forHTTPHeaderField:"Cookie")
                }
                request.timeoutInterval = 10.0
                NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
                    (response,data,error) -> Void in
                    if let err = error {
                        
                    }
                    else {
                        var htmlString = NSString(data:data,encoding:NSUTF8StringEncoding)!
                        println("get from server:--->\(htmlString)")

                        if(response.MIMEType == "application/json"
                        || response.MIMEType == "text/json"){
                            let jsonData = NSJSONSerialization.JSONObjectWithData(data,options:NSJSONReadingOptions.MutableContainers,
                                error:nil) as! NSDictionary
                            
                            res.respondWithJSON(jsonData as [NSObject : AnyObject])
                        }
                        else{
                            res.respondWithText(htmlString as String)
                            var uriid = ""
                            let names = request.URLString.componentsSeparatedByString("/")
                            if(names.count > 1){
                                uriid = names[names.count - 1]
                            }
                            let detailname = self.curDetailView?.detailname
                            println("\(request.URLString),\(uriid),\(htmlString),\(detailname)")
                            if(htmlString == "1" ){
                                if(self.isSuccessToRefresh(uriid,detailname: detailname!)){
                                    dispatch_async(dispatch_get_main_queue(), {
                                        self.curDetailView?.loadWebView()
                                        return
                                    })
                                }
                                if(self.isSuccessToReturn(uriid,detailname: detailname!)){
                                    dispatch_async(dispatch_get_main_queue(), {
                                        //刷新所有页
                                        NSNotificationCenter.defaultCenter().postNotificationName("onLoginRefresh", object: nil)
                                        self.curDetailView?.navigationController?.popViewControllerAnimated(true)
                                       //self.curDetailView?.loadWebView()
                                        return
                                    })
                                }

                            }
                          
                        }
                    }
                })
            }
        })
        
        //js控制跳转的页面
        WebViewProxy.handleRequestsWithHost("skip", handler: {
            (req:NSURLRequest!,res:WVPResponse! )-> Void in
            
            var uriid = self.getSubString(req.URLString,starts: "/",ends: ".htm")
            println(uriid)
            dispatch_sync(dispatch_get_main_queue(), {
                var title = ""
                if(uriid == "grzx"){
                    navto_myprofile()
                    return
                }
                else if(uriid == "return"){
                    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDel.indexNav?.popViewControllerAnimated(false)
                    return
                }
                else if(uriid == "dl"){
                    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDel.profileNav?.popToRootViewControllerAnimated(true)
                    return
                }
                else if(uriid == "cbjy"){
                    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDel.indexNav?.popViewControllerAnimated(false)

                    navto_webinfo_nofooter(uriid,"船舶交易")
                    return
                }
                else if(uriid == "hp"){
                    navto_webinfo_nofooter(uriid,title)
                    return
                }
                else if(uriid == "cywz"){
                    navto_webinfo_nofooter(uriid,title)
                    return
                }
                else if(uriid == "index"){
                    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDel.indexNav?.popToRootViewControllerAnimated(true)
                    //navto_webinfo_nofooter(uriid,title)
                    return
                }
                else if(uriid == "cylt"){
                    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDel.indexNav?.popViewControllerAnimated(false)
                    return
                }
                else if(uriid == "cylt2"){
                    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDel.profileNav?.popViewControllerAnimated(false)
                    return
                }
                else if(uriid == "jbzl"){
                    //skip
                    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDel.profileNav?.popViewControllerAnimated(false)
                    return
                }
                
                navto_webinfo_nofooter_personal(uriid,title)
            })

        })
        
        // cbcs_detail.htm?id=
        WebViewProxy.handleRequestsWithHost("detail", handler: {
            (req:NSURLRequest!,res:WVPResponse! )-> Void in
            
            var uriid = self.getSubString(req.URLString,starts: "/",ends: ".htm")
            var uri = self.getSubString(req.URLString,starts: "/",ends: "#")
            var paramids = self.getParams(uri)
            println(uriid)
            dispatch_sync(dispatch_get_main_queue(), {
                var title = ""
                switch uriid{
                case "cbcs_detail":
                    title = "船舶交易详情"
				case "hp_detail_index":
                    title = "货盘报价详情"
				case "cp_detail_index":
                    title = "船盘报价详情"
                case "cz_detail":
                    title = "船舶出租详情"
                case "cbqg_detail":
                    title = "船舶求购详情"
                case "cbqz_detail":
                    title = "船舶求租详情"
                case "cgxx_detail":
                    title = "采购信息详情"
                case "gyxx_detail":
                    title = "供应信息详情"
                case "cpfb_detail":
                    title = "船盘信息详情"
                case "hpfb_detail":
                    title = "货盘信息详情"
                case "rcqz_detail":
                    title = "人才求职信息详情"
                case "rczp_detail":
                    title = "人才招聘信息详情"
                case "hp_detail":
                    title = "货盘信息详情"
                case "cp_detail":
                    title = "船盘信息详情"
                case "hr_1":
                    title = "人才信息详情"
                case "gyxx":
                    title = "人才信息详情"
                case "newsview":
                    title = "详情信息"
                default:
                    title = ""
                }
                navto_detail(uriid,title,paramids)
            })
            
        })

        WebViewProxy.handleRequestsWithHost("detailperson", handler: {
            (req:NSURLRequest!,res:WVPResponse! )-> Void in
            
            var uriid = self.getSubString(req.URLString,starts: "/",ends: ".htm")
            var uri = self.getSubString(req.URLString,starts: "/",ends: "#")
            var paramids = self.getParams(uri)
            println(uriid)
            dispatch_sync(dispatch_get_main_queue(), {
                var title = ""
                switch uriid{
                case "lt2_1":
                    title = "帖子详情"
                case "lt_2":
                    title = "帖子详情"
                case "newsview":
                    title = "详情信息"
                default:
                    title = ""
                }
                println(uriid)
                navtocbqg_detail_personal(uriid,title,paramids)
            })

        })
        
       
    }
    //JSESSIONID=A7AC1D17A8A268D796E402A684B564F3; Path=/
    //getSubString("JSESSIONID=A7AC1D17A8A268D796E402A684B564F3; Path=/","=",";")->A7AC1D17A8A268D796E402A684B564F3
    func getSubString(s:String,starts:String,ends:String)->String{
        println("getSubString:\(s)")
        var rets = ""
        let names = s.componentsSeparatedByString(ends)
        if(names.count > 1){
            let uris = names[0].componentsSeparatedByString(starts)
            if(uris.count > 0 ){
                rets = uris[uris.count - 1]
            }
        }
        return rets
    }
    //id=5&af=7
    func getParams(s:String)->Dictionary<String,String>{
        var dict = Dictionary<String,String>()
        let names = s.componentsSeparatedByString("?")
        if(names.count > 1){
            let paramstrings = names[1].componentsSeparatedByString("&")
            for var i = 0 ;i < paramstrings.count; i++ {
                let paramsz = paramstrings[i].componentsSeparatedByString("=")
                if paramsz.count == 2{
                    var key = "<%=" + paramsz[0] + "%>"
                    dict[key] = paramsz[1]
                    println("dict:\(dict)")
                  //  dict.updateValue(paramsz[1], forKey: key)
                }
            }
        }
        return dict
    }
    
    func isSuccessToReturn(uriid:String,detailname:String)->Bool{
        if(uriid == "delmybbs"){
            if(detailname == "lt2_1"){
                return true
            }
        }
        return false
    }
    
    func isSuccessToRefresh(uriid:String,detailname:String)->Bool{
        if(uriid == "huitie"){
            if( detailname == "lt_1" || detailname == "lt2_1"){
                return true
            }
        }

//        else if(uriid == "delShipSell"){
//            if(detailname == "cbcslist"){
//                return true
//            }
//            
//        }
//        else if(uriid == "delShipLet"){
//            if(detailname == "cbczlist"){
//                return true
//            }
//            
//        }
//        else if(uriid == "delShipBuy"){
//            if(detailname == "cbqglist"){
//                return true
//            }
//            
//        }
//        else if(uriid == "delShipQz"){
//            if(detailname == "cbqzlist"){
//                return true
//            }
//        }
//
//        else if(uriid == "delPurData"){
//            if(detailname == "cglist"){
//                return true
//            }
//            
//        }
//        else if(uriid == "delShipData"){
//            if(detailname == "cp2"){
//                return true
//            }
//            
//        }
//        else if(uriid == "delSupData"){
//            if(detailname == "gylist"){
//                return true
//            }
//            
//        }
//        else if(uriid == "delPallData"){
//            if(detailname == "hp2"){
//                return true
//            }
//            
//        }
//        else if(uriid == "delJobData"){
//            if(detailname == "rcqzlist"){
//                return true
//            }
//            
//        }
//        else if(uriid == "delRecData"){
//            if(detailname == "rczplist"){
//                return true
//            }
//            
//        }
        return false
    }


}

