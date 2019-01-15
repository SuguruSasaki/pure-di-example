//
//  RootReactor.swift
//  TDDApp1
//
//  Created by SuguruSasaki on 2019/01/14.
//  Copyright © 2019 quad. All rights reserved.
//

import ReactorKit
import RxSwift
import Pure

final class RootReactor: Reactor, FactoryModule {
    
    struct Dependency {
        let service: SampleService
        let router: RootRouter.Factory
    }
    
    struct Payload {
        let viewController: UIViewController
    }
    
    enum Action {
        case didTap
    }
    
    enum Mutation {
        
    }
    
    struct State {
        
    }
    
    let initialState = State()
    
    private let dependency: Dependency
    private let router: RootRouter
    
    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.router = self.dependency.router.create(payload: .init(viewController: payload.viewController))
    }
    
}

extension RootReactor {
    
    func mutate(action: RootReactor.Action) -> Observable<RootReactor.Mutation> {
        switch action {
        case .didTap:
            self.router.navigateTo(action: .detail)
            return Observable.empty()
        }
    }
    
    func reduce(state: RootReactor.State, mutation: RootReactor.Mutation) -> RootReactor.State {
        return state
    }
}
