//
//  AppDelegate.swift
//  Chief
//
//  Created by Doctorwork on 2021/11/15.
//


import UIKit
import React

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here \(launchOptions)")
        
//        guard let options = launchOptions else{
            let ins = Yard.instance()
            ins.loadBaseBundle(launchOptions: launchOptions)
//        }
      
        return true
    }
}
