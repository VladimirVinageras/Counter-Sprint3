//
//  CounterRecord.swift
//  Counter-Sprint3
//
//  Created by Vladimir Vinageras on 11.11.2023.
//

import Foundation

enum CounterEvent{
    case increaseValue
    case decreaseValue
    case resetCounter
    case belowZero
}

struct CounterRecord {
    var dateRecord : Date
    var counterEvent : CounterEvent
    var eventRecord : String {
        switch counterEvent{
        case .increaseValue:
            return "[ \(dateRecord.formatted(date: .abbreviated, time: .shortened))]: Значение изменено на +1 "
        case .decreaseValue:
            return "[ \(dateRecord.formatted(date: .abbreviated, time: .shortened))]: Значение изменено на -1 "
        case .resetCounter:
            return "[ \(dateRecord.formatted(date: .abbreviated, time: .shortened))]: Значение сброшено"
        case .belowZero:
            return "[ \(dateRecord.formatted(date: .abbreviated, time: .shortened))]: Попытка уменьшить значение счётчика ниже 0"
        }
    }
}
