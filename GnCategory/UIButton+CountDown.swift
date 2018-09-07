    //
//  UIButton+CountDown.swift
//  ZhiRenGu
//
//  Created by 梁琪琛 on 2018/7/28.
//  Copyright © 2018年 sxw. All rights reserved.
//

import UIKit


var timer: DispatchSourceTimer?
var count: Int = 0

private var timerKey = "n"
private var countKey = "s"

extension UIButton {
    /// 安装倒计时
    func installCountDown() {
        var count = 60
        setTimer(DispatchSource.makeTimerSource(flags:[], queue: DispatchQueue.main))
        timer().schedule(wallDeadline: DispatchWallTime.now(), repeating: 1.0)
        timer().setEventHandler {
            self.setTitle(String(format: "%02lds", count), for: .normal)
            if (count) <= 0 {
                //关闭倒计时
                self.closeCountDown()
            }
            count -= 1
        }
    }
    
    /// 开始倒计时
    func startCountDown() {
        isEnabled = false
        timer().resume()
    }
    
    /// 准备倒计时
    func readlyCountDown() {
        isEnabled = false
        if self.state == .normal {
            setTitle("正在获取..", for:.normal)
        }else if self.state == .selected {
            setTitle("正在获取..", for:.selected)
        }
        
    }
    
    /// 关闭倒计时
    func closeCountDown() {
        setCount(60)
        isEnabled = true
        timer().suspend()
        if self.state == .normal {
            setTitle("获取验证码", for:.normal)
        }else if self.state == .selected {
            setTitle("获取验证码", for:.selected)
        }
    }
    
    // MARK: -get
    func timer() -> DispatchSourceTimer {
        return (objc_getAssociatedObject(self, &timerKey) as? DispatchSourceTimer)!
    }
    
    func count() -> Int {
        return (objc_getAssociatedObject(self, &countKey) as? Int)!
    }
    
    // MARK: - set
    func setTimer(_ timer: DispatchSourceTimer) {
        objc_setAssociatedObject(self, &timerKey, timer, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
    }
    
    func setCount(_ count: Int) {
        objc_setAssociatedObject(self, &countKey, count, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
}

