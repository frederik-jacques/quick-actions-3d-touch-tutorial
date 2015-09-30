//
//  AppDelegate.swift
//  AppShortCut
//
//  Created by Frederik Jacques on 30/09/15.
//  Copyright © 2015 Frederik Jacques. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var shortcutItem: UIApplicationShortcutItem?

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    print("Application did finish launching with options")

    var performShortcutDelegate = true
    
    if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
        
        print("Application launched via shortcut")
        self.shortcutItem = shortcutItem
        
        performShortcutDelegate = false
    }
    
    return performShortcutDelegate
    
}
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {

        print("Application performActionForShortcutItem")
        completionHandler( handleShortcut(shortcutItem) )
        
    }
    
    func handleShortcut( shortcutItem:UIApplicationShortcutItem ) -> Bool {
        print("Handling shortcut")
        
        var succeeded = false
        
        if( shortcutItem.type == "be.thenerd.appshortcut.new-user" ) {
            
            // Add your code here
            print("- Handling \(shortcutItem.type)")
            
            succeeded = true
            
        }
        
        return succeeded
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        print("Application did become active")
        
        guard let shortcut = shortcutItem else { return }
        
        print("- Shortcut property has been set")
        
        handleShortcut(shortcut)
        
        self.shortcutItem = nil
        
    }

}

