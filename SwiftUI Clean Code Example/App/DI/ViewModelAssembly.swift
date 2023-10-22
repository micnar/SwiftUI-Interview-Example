//
//  ViewModelAssembly.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//

import Swinject

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(WeatherViewModel.self) { r in
            WeatherViewModel(getWeatherUsecase: r.resolve(GetWeatherUseCase.self)!)
        }
    }
}
