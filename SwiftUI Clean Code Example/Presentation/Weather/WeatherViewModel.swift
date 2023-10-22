//
//  WeatherViewModel.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private let getWeatherUsecase: GetWeatherUseCase
    
    // INPUT
    @Published var location: String = ""
    
    // OUTPUT
    @Published var weather: WeatherResponse?
    @Published var isLoading: Bool = false
    @Published var loadingText = ""
    
    init(getWeatherUsecase: GetWeatherUseCase) {
        self.getWeatherUsecase = getWeatherUsecase
    }
    
    public func loadWeather() {
        DispatchQueue.main.async {
            self.weather = nil
            self.isLoading = true
        }
        getWeatherUsecase.getWeather(for: location) { result in
            DispatchQueue.main.async {
                switch(result) {
                case .success(let weather):
                    self.weather = weather
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self.isLoading = false
            }
        }
    }
}
