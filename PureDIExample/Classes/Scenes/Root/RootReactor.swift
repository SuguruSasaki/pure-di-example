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
    }
    
    struct Payload {

    }
    
    enum Action {
        case didTap
        case didLoad
    }
    
    enum Mutation {
        case navigateToDetail(Bool)
        case load(String)
    }
    
    struct State {
        var isMoveToDetail: Bool
    }
    
    let initialState = State(isMoveToDetail: false)
    
    let backgroundScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
    
    private let dependency: Dependency
    
    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
    }
}

extension RootReactor {
    
    func mutate(action: RootReactor.Action) -> Observable<RootReactor.Mutation> {
        switch action {
        case .didTap:
            return Observable.just(Mutation.navigateToDetail(true))
            
        case .didLoad:
            return self.dependency.service.Select()
                .subscribeOn(backgroundScheduler)  // ここでBackgroundに回る、非同期、Reacotr側でMain Threadに戻す処理があるはず
                .catchError { error in
                    // エラー処理、
                    return Observable.empty()
                }
                .flatMap { response in
                    return Observable.just(Mutation.load(response))
            }
        }
    }
    
    func reduce(state: RootReactor.State, mutation: RootReactor.Mutation) -> RootReactor.State {
        var newState = state
        switch mutation {
        case .navigateToDetail(let bool):
            newState.isMoveToDetail = bool
            
        case .load(let str):
            debugPrint(str)
        }
        return newState
    }
}
