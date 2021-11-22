    //
    //  UIView+RNSwizzle.swift
    //  Chief
    //
    //  Created by Doctorwork on 2021/11/22.
    //

import Foundation
import UIKit
import ObjectiveC

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}


extension UIViewController {
    
    public var aliasName: String? {
        get {
            return objc_getAssociatedObject(self, "aliasName") as? String;
        }
        
        set(newValue) {
            objc_setAssociatedObject(self, "aliasName", newValue, .OBJC_ASSOCIATION_COPY);
        }
    }

    static let classInit: Void = {
            // patch viewDidLoad
        guard let originalInitMethod = class_getInstanceMethod(
            UIViewController.self,
            #selector(viewDidLoad)
        ), let swizzledInitMethod = class_getInstanceMethod(
            UIViewController.self,
            #selector(swizzled_viewDidLoad)
        ) else {
            return
        }
        method_exchangeImplementations(originalInitMethod, swizzledInitMethod)
    }()
    
    @objc func swizzled_viewDidLoad() {
        swizzled_viewDidLoad()
//        NSLog("-- in swizzled %@", [self.value(forKey: "aliasName") as NSString]);
        print("-- in swizzled: ", self.aliasName);
    }
}
