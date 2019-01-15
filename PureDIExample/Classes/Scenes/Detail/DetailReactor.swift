//
//  DetailReactor.swift
//  TDDApp1
//
//  Created by SuguruSasaki on 2019/01/14.
//  Copyright © 2019 quad. All rights reserved.
//

import Pure
import RxSwift
import ReactorKit

final class DetailReactor: Reactor, FactoryModule {
    
    struct Dependency {
        let router: DetailRouter.Factory
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
    
    let initialState: DetailReactor.State = State()
    private let dependency: Dependency
    private let router: DetailRouter
    
    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.router = self.dependency.router.create(payload: .init(viewController: payload.viewController))
    }
    
}

extension DetailReactor {
    func mutate(action: DetailReactor.Action) -> Observable<DetailReactor.Mutation> {
        switch action {
        case .didTap:
            self.router.navigateTo(action: .back)
            return Observable.empty()
        }
    }
    
    func reduce(state: DetailReactor.State, mutation: DetailReactor.Mutation) -> DetailReactor.State {
        return state
    }
}
