//
//  RoastersRouter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class RoastersRouter {
    private unowned var dependencyManager: DependencyManager
    weak var navigationController: UINavigationController?

    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }

    func presentLoginView() {
        let loginViewController = dependencyManager.loginBuilder().buildInNavigationController()
        navigationController?.present(loginViewController, animated: true, completion: nil)
    }
}