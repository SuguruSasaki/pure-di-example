//
//  DetailRouter.swift
//  TDDApp1
//
//  Created by SuguruSasaki on 2019/01/14.
//  Copyright © 2019 quad. All rights reserved.
//

import UIKit
import Pure

struct DetailRouter: FactoryModule {
    
    struct Dependency {

    }
    
    struct Payload {
        let viewController: UIViewController
    }
    
    enum Action {
        case back
    }
    
    private let payload: Payload
    
    init(dependency: Dependency, payload: Payload) {
        self.payload = payload
    }
    
    func navigateTo(action: Action) -> Void {
        switch action {
        case .back:
            self.payload.viewController.dismiss(animated: true, completion: nil)
            break
        }
    }
}
