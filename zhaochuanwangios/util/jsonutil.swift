//
//  jsonutil.swift
//  zhaochuanwangios
//
//  Created by wxqdev on 15-4-3.
//  Copyright (c) 2015年 zcwpc.com18.cn. All rights reserved.
//

import Foundation


func jsonFromDictionary(jsonObj:NSDictionary) ->String{
    var error:NSError?
    let jsonData: NSData?
    do {
        jsonData = try NSJSONSerialization.dataWithJSONObject(jsonObj, options: NSJSONWritingOptions(rawValue: 0))
    } catch var error1 as NSError {
        error = error1
        jsonData = nil
    }
    var buffer = [UInt8](count:jsonData!.length, repeatedValue:0)
    jsonData!.getBytes(&buffer, length:jsonData!.length)
    var s:String = String(bytes:buffer,encoding:NSUTF8StringEncoding)!
    return s;
}