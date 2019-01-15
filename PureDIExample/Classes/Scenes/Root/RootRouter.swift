//
//  RootRouter.swift
//  TDDApp1
//
//  Created by SuguruSasaki on 2019/01/14.
//  Copyright © 2019 quad. All rights reserved.
//

import UIKit
import Pure
import RxSwift
import RxCocoa

struct RootRouter: FactoryModule {

    struct Dependency {
        let factory: DetailViewController.Factory
    }
    
    struct Payload {
        let viewController: UIViewController
    }
    
    enum Action {
        case detail
    }
    
    private let dependency: Dependency
    private let payload: Payload
    
    init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
    }
    
    func navigateTo(action: Action) -> Void {
        switch action {
        case .detail:
            let vc = self.dependency.factory.create(payload: .init(title: "detail done."))
            self.payload.viewController.present(vc, animated: true, completion: nil)
            break
        }
    }
}
