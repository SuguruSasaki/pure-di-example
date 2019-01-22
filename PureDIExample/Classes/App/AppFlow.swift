//
//  AppFlow.swift
//  PureDIExample
//
//  Created by sugurusasaki on 2019/01/22.
//  Copyright © 2019 sugurusasaki. All rights reserved.
//

import Pure
import RxFlow

enum AppStep: Step {
    case index
}

final class AppFlow: FactoryModule {
    struct Dependency {
        let window: UIWindow
        let rootFactory: Pure.Factory<RootViewController>
        let indexFlowFactory: Pure.Factory<IndexFlow>
    }
    
    struct Payload {}
    
    private let dependency: Dependency
    
    init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        
        // Root ViewControllerの設定
        self.dependency.window.rootViewController = self.dependency.rootFactory.create(payload: .init(title: "title"))
        self.dependency.window.makeKeyAndVisible()
    }
}

// MARK: - Flow
extension AppFlow: Flow {
    
    var root: Presentable {
        return self.dependency.window
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? AppStep else { return .none }
        
        let nextFlow: Flow
        let nextStepper: Stepper
        
        switch step {
        case .index:
            nextFlow = self.dependency.indexFlowFactory.create(payload: IndexFlow.Payload())
            nextStepper = OneStepper(
                withSingleStep: IndexStep.present
            )
        }
        return .one(
            flowItem: NextFlowItem(nextPresentable: nextFlow, nextStepper: nextStepper)
        )
    }
}
