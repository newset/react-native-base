    //
    //  UIView+RNSwizzle.swift
    //  Chief
    //
    //  Created by Doctorwork on 2021/11/22.
    //

import Foundation
import UIKit
import ObjectiveC
import SwiftUI

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

extension View {
    var pageAliasName: String? {
        get {
            return objc_getAssociatedObject(self, "pageAliasName") as? String;
        }
        
        set(newValue) {
            objc_setAssociatedObject(self, "pageAliasName", newValue, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    /**
        加载 url from pageAliasName
         
     */
    func openMini() {
//        let alert = UIAlertController(title: messageTitle, message: messageAlert, preferredStyle: messageBoxStyle)
//        
//        let okAction = UIAlertAction(title: "Ok", style: alertActionStyle) { _ in
//            completionHandler() // This will only get called after okay is tapped in the alert
//        }
//        
//        alert.addAction(okAction)
//        
//        present(alert, animated: true, completion: nil);
    }

}


extension UIViewController {
    
    @objc
    public var pageAliasName: String? {
        get {
            return objc_getAssociatedObject(self, "pageAliasName") as? String;
        }
        
        set(newValue) {
            objc_setAssociatedObject(self, "pageAliasName", newValue, .OBJC_ASSOCIATION_COPY);
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
        
        if(self.pageAliasName == "clinic") {
        
        }
        
        print("-- in viewDidload: ", self.pageAliasName);
    }
}
