//
//  SwiftUI_Clean_Code_ExampleApp.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//

import SwiftUI

@main
struct SwiftUI_Clean_Code_ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherView(viewModel: DIContainer.shared.container.resolve(WeatherViewModel.self)!)
        }
    }
}
