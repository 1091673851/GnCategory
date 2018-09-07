//
//  String+Extension.swift
//  GnCategoryDemo
//
//  Created by 梁琪琛 on 2018/9/7.
//  Copyright © 2018年 sxw. All rights reserved.
//

import UIKit


extension String{

    /// 时间搓字符串转时间
    func date(dateFormat:String) -> String{
        //格式话输出
        if self.isEmpty {
            return ""
        }
        let timeStamp = Int(self)
        //转换为时间 
        let timeInterval:TimeInterval = TimeInterval(timeStamp!/1000)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dformatter = DateFormatter()
        dformatter.dateFormat = dateFormat // "yyyy年MM月dd日 HH:mm:ss"
        return dformatter.string(from: date)
    }
}

extension String{
    /// 计算字符串的尺寸
    func  getStringSize(text: String, rectSize: CGSize,fontSize: CGFloat) -> CGSize {
        let str = text as NSString
        let rect = str.boundingRect(with: rectSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], context: nil)
        return rect.size
    }
    
    /// 计算字符串的高度 width:最大宽度 font:文字大小
    func getStringHeight(width : CGFloat, font: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: font)], context: nil)
        return rect.size.height
    }
    
    /// 计算字符串的宽度 width:最大宽度 font:文字大小
    func getStringWidth(height : CGFloat, font: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize.init(width: 1000, height: height), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: font)], context: nil)
        return rect.size.width
    }

}
