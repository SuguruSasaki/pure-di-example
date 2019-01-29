//
//  RootService.swift
//  TDDApp1
//
//  Created by SuguruSasaki on 2019/01/13.
//  Copyright © 2019 quad. All rights reserved.
//

import RxSwift

// sample
final class SampleService {
    
    func Select() -> Observable<String> {
        return Observable<String>.create { observer in
            
            observer.onNext("success")
            observer.onCompleted()
        
            return Disposables.create()
        }
    }
}
