//
//  NavMenu.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-9.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import Foundation

func createNavMenu()->REMenu{
    var items : [REMenuItem] = []
    
    var menuTxt = "首页"
    var menuImg = "plugmenu6"
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var storyBoardMain = UIStoryboard(name:"Main",bundle:nil)
 
    
    var item = REMenuItem(title: menuTxt, image: UIImage(named: menuImg), highlightedImage: nil) { (item) -> Void in
       appDel.indexNav?.popToRootViewControllerAnimated(true)
        
      //   appDel.showMsgInfo("http://www.baidu.com")
        return
    }
    items.append(item)
    

    menuTxt = "更新我的船舶"
    menuImg = "nav_update"
    item = REMenuItem(title: menuTxt, image: UIImage(named: menuImg), highlightedImage: nil) { (item) -> Void in
        let uriid = "gxcb"
        navto_webinfo_nofooter(uriid,title: item.title)
    }
    items.append(item)
    
    menuTxt = "信息发布"
    menuImg = "nav_release"
    item = REMenuItem(title: menuTxt, image: UIImage(named: menuImg), highlightedImage: nil) { (item) -> Void in
        let uriid = "fbxx"
        navto_webinfo(uriid,title: item.title)
    }
    items.append(item)
  
    menuTxt = "货盘信息"
    menuImg = "nav_goods"
    item = REMenuItem(title: menuTxt, image: UIImage(named: menuImg), highlightedImage: nil) { (item) -> Void in
        let uriid = "hp"
        navto_webinfo(uriid,title: item.title)
    }
    items.append(item)

    menuTxt = "船盘信息"
    menuImg = "nav_boat"
    item = REMenuItem(title: menuTxt, image: UIImage(named: menuImg), highlightedImage: nil) { (item) -> Void in
        let uriid = "cp"
        navto_webinfo(uriid,title: item.title)
    }
    items.append(item)

    menuTxt = "在线投保"
    menuImg = "nav_insurnace"
    item = REMenuItem(title: menuTxt, image: UIImage(named: menuImg), highlightedImage: nil) { (item) -> Void in
        let uriid = "zxtb"
        navto_webinfo(uriid,title: item.title)
    }
    items.append(item)

    menuTxt = "物资市场"
    menuImg = "nav_material"
    item = REMenuItem(title: menuTxt, image: UIImage(named: menuImg), highlightedImage: nil) { (item) -> Void in
        let uriid = "cywz"
        navto_webinfo(uriid,title: item.title)
    }
    items.append(item)

    menuTxt = "船舶交易"
    menuImg = "nav_deal"
    item = REMenuItem(title: menuTxt, image: UIImage(named: menuImg), highlightedImage: nil) { (item) -> Void in
        let uriid = "cbjy"
        navto_webinfo(uriid,title: item.title)
    }
    items.append(item)
   
    menuTxt = "人才中心"
    menuImg = "nav_talent"
    item = REMenuItem(title: menuTxt, image: UIImage(named: menuImg), highlightedImage: nil) { (item) -> Void in
        let uriid = "hr"
        navto_webinfo(uriid,title: item.title)
    }
    items.append(item)
  
    let menu = REMenu(items: items)
    menu.backgroundColor = UIColor.whiteColor()//    menu.liveBlur = true
//    menu.liveBlurBackgroundStyle = .Light
    menu.separatorColor = UIColor.colorWithHex("#cccccc")
    menu.borderColor = UIColor.colorWithHex("#cccccc")
    menu.highlightedBackgroundColor = UIColor.colorWithHex("#e5f5ff")
    menu.separatorHeight = 1.0
    menu.itemHeight = 40
    menu.textAlignment = NSTextAlignment.Left
    menu.textOffset = CGSizeMake(50, 0)
    menu.highlightedSeparatorColor = UIColor.colorWithHex("#cccccc")
    menu.borderWidth = 2.0
    menu.font = UIFont.boldSystemFontOfSize(14)
    menu.showFromNavigationController(appDel.indexNav)
    
    return menu
}