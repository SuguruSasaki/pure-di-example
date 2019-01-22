//
//  IndexViewController.swift
//  PureDIExample
//
//  Created by sugurusasaki on 2019/01/22.
//  Copyright © 2019 sugurusasaki. All rights reserved.
//

import UIKit
import Pure
import RxFlow

class IndexViewController: UIViewController, FactoryModule, Stepper  {
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    struct Dependency {
        
    }
    
    struct Payload {
        
    }
    
    private let dependency: Dependency
    
    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        super.init(nibName: nil, bundle: nil)
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
    }
    
}

