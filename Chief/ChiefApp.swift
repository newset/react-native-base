//
//  ChiefApp.swift
//  Chief
//
//  Created by Doctorwork on 2021/10/19.
//

import SwiftUI

@main
struct ChiefApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        // other classinit
        UIView.classInit
        UIViewController.classInit
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
