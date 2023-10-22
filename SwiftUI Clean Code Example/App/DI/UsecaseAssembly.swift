//
//  UsecaseAssembly.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//

import Foundation
import Swinject

class UsecaseAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(GetWeatherUseCase.self) { r in
            GetWeatherUseCase(repository: r.resolve(WeatherRepository.self)!)
        }
    }
}
