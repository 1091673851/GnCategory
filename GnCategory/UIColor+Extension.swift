//
//  UIColor+Extension.swift
//  GnCategoryDemo
//
//  Created by 梁琪琛 on 2018/9/7.
//  Copyright © 2018年 sxw. All rights reserved.
//

import UIKit

extension UIColor{
    /// hexColor 0XFFFF
    static func colorWithHex(hexColor:UInt32)->UIColor{
        let r:CGFloat = (CGFloat)((hexColor >> 16) & 0xFF)
        let g:CGFloat = (CGFloat)((hexColor >> 8) & 0xFF)
        let b:CGFloat = (CGFloat)(hexColor & 0xFF)
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
}


///MARK: - Simple
extension String {
    // MARK: - 字符串 -> UIColor
    /// 字符串 -> UIColor
    func hexColor()->UIColor{
        let scanner = Scanner(string: self)
        var hexNum:UInt32 = 0
        if scanner.scanHexInt32(&hexNum) == false {
            return UIColor.clear
        }
        
        return UIColor.colorWithHex(hexColor: hexNum)
    }
}


///MARK: - 数组渐变颜色
extension Array where Element == String {
    enum GradientDirection{ // 渐变方向
        /// 左到右
        case LeftToRight // 没有
        /// 上到下
        case TopToBottom // 浏览记录
    }
    
    func hexColors(direction:GradientDirection)->UIColor{
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        let gradientColors = self.map({$0.hexColor().cgColor})
        
        gradientLayer.colors = gradientColors
        switch direction {
        case .LeftToRight:
            gradientLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint.init(x: 1, y: 0.5)
            UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size,false, UIScreen.main.scale);
            gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
            let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return UIColor(patternImage: backgroundColorImage!)
        case .TopToBottom:
            UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size,false, UIScreen.main.scale);
            gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
            let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return UIColor(patternImage: backgroundColorImage!)
        }
    }
}
