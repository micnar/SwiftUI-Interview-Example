//
//  DIContainer.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//

import Foundation
import Swinject

public class DIContainer {
    static var shared = DIContainer()
    
    let container = Container()
    let assembler: Assembler
    
    private init() {
        assembler = Assembler([
            RepositoryAssembly(),
            UsecaseAssembly(),
            ViewModelAssembly(),
        ], container: container)
    }
}
