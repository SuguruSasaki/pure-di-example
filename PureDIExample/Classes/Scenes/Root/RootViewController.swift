//
//  ViewController.swift
//  TDDApp1
//
//  Created by SuguruSasaki on 2019/01/03.
//  Copyright © 2019 quad. All rights reserved.
//

import UIKit
import Pure
import RxSwift
import RxCocoa
import ReactorKit

class RootViewController: UIViewController, View, FactoryModule  {
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    typealias Reactor = RootReactor
    
    var disposeBag: DisposeBag = DisposeBag()

    struct Dependency {
        let window: UIWindow
        let reactor: RootReactor.Factory
    }
    
    struct Payload {
        let title: String
    }
    
    private let dependency: Dependency
    private let payload: Payload
    private let button: UIButton
    
    /// 初期化
    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
        self.button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 55))
        super.init(nibName: nil, bundle: nil)
        
        self.reactor = self.dependency.reactor.create(payload: .init(viewController: self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        
        button.backgroundColor = UIColor.red
        button.center = self.view.center
        self.view.addSubview(button)
    }
}

extension RootViewController {
    
    func bind(reactor: RootReactor) {
        
        self.button.rx.tap
            .map { Reactor.Action.didTap }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
    }
}
