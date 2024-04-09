//
//  weatherButton.swift
//  weather
//
//  Created by prince ojinnaka on 09/04/2024.
//

import SwiftUI

struct WeatherButton: View {
    
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(buttonText)
           .frame(width: 280, height: 50)
           .background(backgroundColor)
           .foregroundColor(textColor)
           .font(.system(size: 20, weight: .bold, design: .default))
           .cornerRadius(10)
    }
}
