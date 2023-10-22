//
//  RepositoryAssembly.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(WeatherRepository.self) { r in
            WeatherRepository()
        }
    }
}
