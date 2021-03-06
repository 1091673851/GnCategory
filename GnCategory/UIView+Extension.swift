//
//  UIView+HWExtension.swift
//  BBCShop
//
//  Created by Hanwen on 2018/1/13.
//  Copyright © 2018年 SK丿希望. All rights reserved.
//

import UIKit

public extension UIView{
    // MARK: - 尺寸相关
    var x:CGFloat{
        get{
            return self.frame.origin.x
        } set{
            self.frame.origin.x = newValue
        }
    }
    
    var y:CGFloat{
        get{
            return self.frame.origin.y
        }set{
            self.frame.origin.y = newValue
        }
    }
    
    var width:CGFloat{
        get{
            return self.frame.size.width
        }set{
            self.frame.size.width = newValue
        }
    }
    
    var height:CGFloat{
        get{
            return self.frame.size.height
        }set{
            self.frame.size.height = newValue
        }
    }
    
    var size:CGSize{
        get{
            return self.frame.size
        }set{
            self.frame.size = newValue
        }
    }
    var centerX:CGFloat{
        get{
            return self.center.x
        }set{
            self.centerX = newValue
        }
    }
    var centerY:CGFloat{
        get{
            return self.center.y
        }set{
            self.centerY = newValue
        }
    }
    // 关联 SB 和 XIB
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable public var shadowColor: UIColor? {
        get {
            return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    @IBInspectable public var zPosition: CGFloat {
        get {
            return layer.zPosition
        }
        
        set {
            layer.zPosition = newValue
        }
    }
}

extension UIView{
    
    /// 给view添加宽高约束
    ///
    /// - Parameters:
    ///   - width: 宽
    ///   - height: 高
    func addConstraintSize(width:CGFloat,height:CGFloat){
        let width:NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute:.notAnAttribute, multiplier:0.0, constant:width)
        let height:NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute:.notAnAttribute, multiplier:0.0, constant:height)
        self.translatesAutoresizingMaskIntoConstraints = true
        self.addConstraint(width)
        self.addConstraint(height)
    }
}

extension UIView {
    /// 从xib加载view
    static func loadViewFromNib() -> UIView {
        if (Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last != nil) {
            return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! UIView
        } else {
            return self.init()
        }
    }
}
