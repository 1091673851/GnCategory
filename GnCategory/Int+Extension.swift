//
//  Int+Extension.swift
//  GnCategoryDemo
//
//  Created by 梁琪琛 on 2018/9/7.
//  Copyright © 2018年 sxw. All rights reserved.
//

import UIKit


extension Int{
    /// 时间搓转换
    func dateWithFormatter(formatter:String) -> String {
        let timeInterval:TimeInterval = TimeInterval(self/1000)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dformatter = DateFormatter()
        dformatter.dateFormat = formatter
        return dformatter.string(from: date)
    }
    
    
    /// 当前时间搓与当前时间计算差差值 如果返回nil 则当前时间大于给定的时间
    func timeIntervalForCurrent()->DateComponents?{
        
        var nowDate = Date()
        
        nowDate.addTimeInterval(TimeInterval(3600*8))
        
        let dateFomatter = DateFormatter()
        dateFomatter.locale = Locale(identifier: "zh_CN")
        dateFomatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // 截止时间data格式
        let timeInterval:TimeInterval = TimeInterval(self)
        var expireDate = Date(timeIntervalSince1970: timeInterval)
        expireDate.addTimeInterval(TimeInterval(3600*8))
        
        let calender = Calendar(identifier: Calendar.Identifier.chinese)
        
        let result = calender.compare(nowDate, to: expireDate, toGranularity: Calendar.Component.second)
        
        let unit = Set<Calendar.Component>([.hour,.minute,.second])
        
        switch result {
            
        case .orderedAscending:
            return calender.dateComponents(unit, from: nowDate, to: expireDate)
        case .orderedSame:
            return nil
        case .orderedDescending:
            return nil
        }
    }
}

