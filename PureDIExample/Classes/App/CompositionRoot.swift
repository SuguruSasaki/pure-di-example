 //
//  CompositionRoot.swift
//  TDDApp1
//
//  Created by SuguruSasaki on 2019/01/12.
//  Copyright © 2019 quad. All rights reserved.
//

import Foundation
import Pure
 
 final class CompositionRoot: FactoryModule {
    
    struct Dependency {
        let window: UIWindow
    }
    
    struct Payload {
        
    }
    
    let dependency: Dependency
    
    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
    }
    
    // MARK: - ViewController
    
    /// Root
    lazy var rootViewControllerFactory = RootViewController.Factory(
        dependency: .init(
            window: self.dependency.window,
            reactor: RootReactor.Factory(
                dependency: .init(
                    service: SampleService(),
                    router: self.rootRouterFactory
                )
            )
        )
    )
    
    /// Detail
    private lazy var detailViewControllerFactory = DetailViewController.Factory(
        dependency: .init(
            reactor: DetailReactor.Factory(
                dependency: .init(
                    router: self.detailRouterFactory
                )
            )
        )
    )
    
    
    // MARK: Router
    
    private lazy var rootRouterFactory = RootRouter.Factory(
        dependency: .init(
            factory: self.detailViewControllerFactory
        )
    )
    
    private lazy var detailRouterFactory = DetailRouter.Factory(
        dependency: .init()
    )
 }
 
 extension CompositionRoot {
    
    static func resolve() -> CompositionRoot {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        return CompositionRoot(
            dependency: .init(window: window),
            payload: .init()
        )
    }
 }
 
