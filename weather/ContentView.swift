//
//  ContentView.swift
//  weather
//
//  Created by prince ojinnaka on 28/03/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var isNight = false
    var weekDays: [String] = ["TUE",
                    "WED",
                    "THUR",
                    "FRI",
                    "SAT"]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherView(imageName: isNight ? "moon.stars" :
                                "cloud.sun.fill",
                                temperature: 76)
                
                HStack (spacing: 20) {
                    ForEach(weekDays, id: \.self) { day in
                        WeatherDayView(dayOfWeek: day)
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonText: "Change Day Time",
                                      textColor: .blue,
                                      backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .light))
                .foregroundColor(.white)
            
            Image(systemName: eachDayWeather[dayOfWeek]!.0)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height:  40)
            
            Text("\(eachDayWeather[dayOfWeek]!.1)°")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
        
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
