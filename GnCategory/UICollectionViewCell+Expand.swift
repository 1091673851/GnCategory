//
//  UICollectionViewCell+Expand.swift
//  ZhiRenGu
//
//  Created by 梁琪琛 on 2018/7/29.
//  Copyright © 2018年 sxw. All rights reserved.
//

import UIKit

protocol UICollectionReusableViewEasyDelegate {
    static func identifier() ->String

}

//extension UICollectionViewCell : UICollectionReusableViewEasyDelegate{
//    static func identifier() -> String{
//        return "\(self)"
//    }
//}
extension UICollectionReusableView : UICollectionReusableViewEasyDelegate{
    static func identifier() -> String{
        return "\(self)"
    }
}
