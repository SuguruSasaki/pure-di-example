//
//  DetailFlow.swift
//  PureDIExample
//
//  Created by sugurusasaki on 2019/01/21.
//  Copyright © 2019 sugurusasaki. All rights reserved.
//

import Pure
import RxFlow

final class DetailFlow: FactoryModule {
    
    struct Dependency {
        let window: UIWindow
        let viewController: UIViewController
    }
    
    struct Payload {}
    
    private let dependency: Dependency
    
    init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
    }
    
}

extension DetailFlow: Flow {
    
    var root: Presentable {
        return self.dependency.viewController
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        
        return .none
    }
}
