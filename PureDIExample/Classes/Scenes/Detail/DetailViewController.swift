//
//  DetailViewController.swift
//  TDDApp1
//
//  Created by SuguruSasaki on 2019/01/13.
//  Copyright © 2019 quad. All rights reserved.
//

import Pure
import RxSwift
import ReactorKit

class DetailViewController: UIViewController, FactoryModule, View {
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    typealias Reactor = DetailReactor
    
    struct Dependency {
        let reactor: DetailReactor.Factory
    }
    
    struct Payload {
        let title: String
    }
    
    var disposeBag: DisposeBag = DisposeBag()
    
    private let dependency: Dependency
    private let payload: Payload
    private let button: UIButton
    
    required init(dependency: Dependency, payload: Payload) {
        self.payload = payload
        self.dependency = dependency
        self.button = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 44))
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.button.backgroundColor = UIColor.black
        self.button.setTitle("back", for: .normal)
        self.view.addSubview(self.button)
        
        self.reactor = self.dependency.reactor.create(payload: .init(viewController: self))
    }
}

extension DetailViewController {
    
    func bind(reactor: DetailViewController.Reactor) {
        
        self.button.rx.tap
            .map { Reactor.Action.didTap }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
    }
}
