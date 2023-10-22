//
//  WeatherView.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//
import SwiftUI

struct WeatherView: View {
    
    @StateObject var viewModel: WeatherViewModel
    
    init(viewModel: WeatherViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Please enter a city", text: $viewModel.location)
                    .padding()
                Button(action: {
                    viewModel.loadWeather()
                }) {
                    Text("Get Weather")
                }
                Divider()
                
                LoadingContainer(isShowing: $viewModel.isLoading, text: $viewModel.loadingText) {
                    VStack {
                        if let weather = viewModel.weather {
                            WeatherListItem(weather: weather)
                        }
                    }
                }
                .navigationBarTitle("Weather Forecast", displayMode: .automatic)
            }
        }
    }
    
    private func getWeather() {
        viewModel.loadWeather()
    }
}
