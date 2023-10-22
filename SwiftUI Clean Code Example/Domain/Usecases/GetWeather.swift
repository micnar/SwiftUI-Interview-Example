//
//  GetWeather.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//

import Foundation

class GetWeatherUseCase {
    
    let repository: WeatherRepository
    
    init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    func getWeather(for location: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void){
        return repository.getWeather(for: location) { (result: Result<WeatherResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
