//
//  UIView+RNSwizzle.swift
//  Chief
//
//  Created by Doctorwork on 2021/11/22.
//

import Foundation

// I've never tried swizzling before but fancied trying this out - a quick google found this article that explains how to do it with an extension.

extension UIView {
    
    static let classInit: Void = {
        // patch layoutSubViews
        guard let originalMethod = class_getInstanceMethod(
            UIView.self,
            #selector(layoutSubviews)
        ), let swizzledMethod = class_getInstanceMethod(
            UIView.self,
            #selector(swizzled_layoutSubviews)
        ) else {
            return
        }
       method_exchangeImplementations(originalMethod, swizzledMethod)
    }()

    @objc func swizzled_layoutSubviews() {
        swizzled_layoutSubviews()
//        self.layer.borderColor = UIColor.red.cgColor
//        self.layer.borderWidth = 2
    }
}
