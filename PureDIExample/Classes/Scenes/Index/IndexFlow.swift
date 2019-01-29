//
//  IndexFlow.swift
//  PureDIExample
//
//  Created by sugurusasaki on 2019/01/22.
//  Copyright © 2019 sugurusasaki. All rights reserved.
//

import Pure
import RxFlow
import RxSwift

enum IndexStep: Step {
    case present
}

final class IndexFlow: FactoryModule {
    
    struct Dependency {
        let indexFactory: Pure.Factory<IndexViewController>
    }
    
    struct Payload {
        
    }
    
    private let dependency: Dependency
    private let rootViewController: IndexViewController
    
    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.rootViewController = self.dependency.indexFactory.create(payload: .init())
    }
}


// MARK: - Flow
extension IndexFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? IndexStep else { return .none }
        
        switch step {
        case .present:
            return .one(
                flowItem: NextFlowItem(
                    nextPresentable: self.rootViewController,
                    nextStepper: self.rootViewController
                )
            )
        }
    }
}
