//
//  AppDelegate+Injection.swift
//  MakeItSo
//
//  Created by Hem Poudyal on 6/29/20.
//  Copyright © 2020 Google LLC. All rights reserved.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { TestDataTaskRepository() as TaskRepository}.scope(application)
        //create an instance of TestDataTaskrepository and inject it wherever Taskrepository is required
    }
}
