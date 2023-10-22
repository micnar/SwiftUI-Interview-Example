//
//  WeatherListItem.swift
//  SwiftUI Clean Code Example
//
//  Created by Michael on 22.10.23.
//

import SwiftUI

struct WeatherListItem: View {
    @State var weather: WeatherResponse
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15.0) {
                Text("Min Temperature: \(weather.main.temp_min )°C")
                Text("Max Temperature: \(weather.main.temp_max )°C")
            }.padding(.vertical, 12)
            Spacer()
        }
    }
}
