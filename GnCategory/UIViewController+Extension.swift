//
//  UIViewController+HWExtension.swift
//  BBCShop
//
//  Created by Hanwen on 2018/1/15.
//  Copyright © 2018年 SK丿希望. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  
    // MARK: - 跳转相关
    /// 快速push到指定控制器 name:控制器名
    func pushController(name:String) {
        _ = pushSetController(name: name)
    }
    
    func pushSetController(name:String) -> UIViewController {
        weak var weakSelf = self // 弱引用
        // 1.获取命名空间
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            //            HWPrint("命名空间不存在")
            return UIViewController()
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + name)
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? UIViewController.Type else {
            //            HWPrint("无法转换成UIViewController")
            return UIViewController()
        }
        // 3.通过Class创建对象
        let vc = clsType.init()
        weakSelf!.navigationController?.pushViewController(vc, animated: true)
        return vc
    }
    
    /// 快速返回指定的控制器 name:要返回的控制器名 (注意:要返回的控制器必须在navigationController的子控制器数组中)
    func popToViewController(name:String) { // 使用 self.popToViewController(name: "JYKMeViewController")
        weak var weakSelf = self // 弱引用
        // 1.获取命名空间
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            //            HWPrint("命名空间不存在")
            return
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + name)
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard (cls as? UIViewController.Type) != nil else {
            //            HWPrint("无法转换成UIViewController")
            return
        }
        for  controller in (weakSelf!.navigationController?.viewControllers)! {
            if controller.isKind(of: cls!) {
                weakSelf!.navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
    /// 快速返回根的控制器
    func popToRootViewController() {
        weak var weakSelf = self // 弱引用
        weakSelf?.navigationController?.popToRootViewController(animated: true)
    }
    
}

// MARK: - 清除导航栏分隔线
extension UIViewController {
    /// 清除导航栏分隔线
    func removeNavigationBarLine() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
    }
    /// 切换渐变导航栏
    func switchGradientColor(arryColor:[String],direction: Array<String>.GradientDirection) {
        let width =  UIScreen.main.bounds.size.width
        let height =  UIScreen.main.bounds.size.height
        let color = arryColor.hexColors(direction: direction)
        let image = UIImage(color: color, size: CGSize(width: width, height: height))
        navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white //item 字体颜色
    }
    
    func switchNavColor(_ color: UIColor) {
        let width =  UIScreen.main.bounds.size.width
        let height =  UIScreen.main.bounds.size.height
        let image = UIImage(color: color, size: CGSize(width: width, height: height))
        navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white //item 字体颜色
    }
    /// 切换黑色航栏
    func switchBlackColor() {
        let width =  UIScreen.main.bounds.size.width
        let height =  UIScreen.main.bounds.size.height
        let color = UIColor.black
        let image = UIImage(color: color, size: CGSize(width: width, height: height))
        navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white //item 字体颜色
        navigationController?.navigationBar.isTranslucent = false
    }
    /// 切换白色导航栏
    func switchWhiteColor() {
        let width =  UIScreen.main.bounds.size.width
        let height =  UIScreen.main.bounds.size.height
        let color = UIColor.white
        let image = UIImage(color: color, size: CGSize(width: width, height: height))
        navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.tintColor = UIColor.black
        //        navigationController?.navigationBar.isTranslucent = false
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = UIColor.black //item 字体颜色
        navigationController?.navigationBar.isTranslucent = false
    }
    /// 切换透明导航栏
    func switchClearColor() {
        let width =  UIScreen.main.bounds.size.width
        let height =  UIScreen.main.bounds.size.height
        let color = UIColor.clear
        let image = UIImage(color: color, size: CGSize(width: width, height: height))
        navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.shadowImage = UIImage()
        //        navigationController?.navigationBar.isTranslucent = false
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white //item 字体颜色
        navigationController?.navigationBar.isTranslucent = true
        
    }
    
}


fileprivate extension UIImage {
    
     convenience init(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        defer {
            UIGraphicsEndImageContext()
        }

        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        
        guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }
        
        self.init(cgImage: aCgImage)
    }
}


extension UIViewController{
    private class var sharedApplication: UIApplication? {
        let selector = NSSelectorFromString("sharedApplication")
        return UIApplication.perform(selector)?.takeUnretainedValue() as? UIApplication
    }
    
    /// 在最上层界面进行跳转 push
    open class func navigationControllerTopPush(vc:UIViewController){
        UIViewController.topMost?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    /// 返回最上层控制器
    open class var topMost: UIViewController? {
        guard let currentWindows = self.sharedApplication?.windows else { return nil }
        var rootViewController: UIViewController?
        for window in currentWindows {
            if let windowRootViewController = window.rootViewController {
                rootViewController = windowRootViewController
                break
            }
        }
        return self.topMost(of: rootViewController)
    }
    
    /// 返回上级页面
    ///
    /// - Parameter lastPage: 根据lastpage 返回lastpage层页面
    public func popLastControllerWithLastPage(lastPage:NSInteger){
        if self.navigationController?.viewControllers.count == 0{  return
        }else if self.navigationController?.viewControllers.count == 1{
            self.navigationController?.popViewController(animated: true)
        }else if (self.navigationController?.viewControllers.count)! >= lastPage{
            let count = (self.navigationController?.viewControllers.count)!;
            let viewCtr = (self.navigationController?.viewControllers[count - lastPage - 1])!
            self.navigationController?.popToViewController(viewCtr, animated: true)
        }
    }
    

    /// 获取最上层的控制器
    ///
    /// - Parameter viewController: 获取此控制器的最上层
    /// - Returns: 返回上层控制器
    private class func topMost(of viewController: UIViewController?) -> UIViewController? {
        if let presentedViewController = viewController?.presentedViewController {
            return self.topMost(of: presentedViewController)
        }
        // UITabBarController
        if let tabBarController = viewController as? UITabBarController,
            let selectedViewController = tabBarController.selectedViewController {
            return self.topMost(of: selectedViewController)
        }
        
        // UINavigationController
        if let navigationController = viewController as? UINavigationController,
            let visibleViewController = navigationController.visibleViewController {
            return self.topMost(of: visibleViewController)
        }
        
        // UIPageController
        if let pageViewController = viewController as? UIPageViewController,
            pageViewController.viewControllers?.count == 1 {
            return self.topMost(of: pageViewController.viewControllers?.first)
        }
        
        // child view controller
        for subview in viewController?.view?.subviews ?? [] {
            if let childViewController = subview.next as? UIViewController {
                return self.topMost(of: childViewController)
            }
        }
        
        return viewController
    }
    
   
}


extension UIViewController {
    /// 加载Storyboard方法 
    func loadStoryboard<T:UIViewController>(type:T.Type,sbname:String) -> T {
        return UIStoryboard(name: sbname, bundle: nil).instantiateViewController(withIdentifier: "\(self)") as! T
    }
    
   
}
