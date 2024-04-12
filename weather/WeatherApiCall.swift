//
//  WeatherAPICall.swift
//  weather
//
//  Created by prince ojinnaka on 12/04/2024.
//


//struct Forecast: Codable {
//    var temperateInstant: Double
//    var temperatureMax: Double
//    var precipitationProbability: Int
//}
//
//func getWeatherForcast() async throws -> Forecast {
//    let endpoint = "https://my.meteoblue.com/packages/basic-day?apikey=x5f9O0nQBWRNgqKL&lat=50.799&lon=-1.09125&asl=6&format=json"
//    
//    guard let url = URL(string: endpoint) else {throw WError.invalidUrl}
//    
//    let (data, response) = try await URLSession.shared.data(from: url)
//    
//    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw WError.invalidResponse}
//    
//    do {
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        return try decoder.decode(Forecast.self, from: data)
//    } catch {
//        throw WError.invalidData
//    }
//    
//}
//
//enum WError: Error {
//    case invalidUrl
//    case invalidResponse
//    case invalidData
//}

import Foundation



struct RainData {
    let time: [String]
    let rain: [Any] // Can be String or Double
    
    init?(from json: [String: Any]) {
        guard
            let hourlyJson = json["hourly"] as? [String: Any],
            let hourly_time = hourlyJson["time"] as? [String],
            let hourly_rain = hourlyJson["rain"] as? [Any]
        else {
            return nil
        }
        self.time = hourly_time
        self.rain = hourly_rain
    }
}

if let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=50.799&longitude=-1.0913&current=temperature_2m,rain&hourly=temperature_2m,rain,wind_speed_10m") {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let rainData = RainData(from: json) {
                        // Access rainData properties here
                        print("Time:", rainData.time)
                        print("Rain:", rainData.rain)
                    } else {
                        print("Failed to parse rain data")
                    }
                } else {
                    print("Failed to parse JSON")
                }
            } catch {
                print(error)
            }
        } else {
            print("No data received")
        }
    }.resume()
} else {
    print("Invalid URL")
