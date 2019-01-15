//
//  AppDelegate.swift
//  TDDApp1
//
//  Created by SuguruSasaki on 2019/01/03.
//  Copyright © 2019 quad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let compositionRoot: CompositionRoot
    
    var window: UIWindow?
    
    /// 初期化
    /// 依存関係の注入
    private override init() {
        self.compositionRoot = CompositionRoot.resolve()
        super.init()
    }
    
    /// ユニットテスト用
    ///
    /// - Parameter compositionRoot: instance of AppcompositionRoot
    init(compositionRoot: CompositionRoot) {
        self.compositionRoot = compositionRoot
        super.init()
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let root = self.compositionRoot.rootViewControllerFactory.create(payload: .init(title: "Root ViewController"))
        self.compositionRoot.dependency.window.rootViewController = root
        self.compositionRoot.dependency.window.makeKeyAndVisible()
        
        return true
    }

}

