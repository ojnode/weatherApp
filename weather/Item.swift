//
//  Item.swift
//  weather
//
//  Created by prince ojinnaka on 28/03/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
