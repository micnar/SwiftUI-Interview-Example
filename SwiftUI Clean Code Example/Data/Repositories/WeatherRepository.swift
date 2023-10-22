//
//  WeatherRepository.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//

import Foundation

class WeatherRepository {
    
    private var apiKey = "ENTER API KEY here"
    
    func getWeather(for location: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)&units=metric"
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let error = NSError(domain: "HTTPError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "NoDataError", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(WeatherResponse.self, from: data)
                completion(.success(weather))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

