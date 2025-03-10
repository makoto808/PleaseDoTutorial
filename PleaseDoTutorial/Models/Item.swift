//
//  Item.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/9/25.
//

import Foundation

struct Item: Identifiable {
    let id: String
    let authorId: String
    var title: String
    var description: String
    var startDate: Date = .now
    
    
}

enum Status: String {
    case todo = "To Do"
    case inProgress = "In Progress"
    case done = "Done"
    case unknown = "Unknown"
    
    init(_ str: String) {
        self = switch str.lowercased() {
        case "todo": .todo
        case "in progress": .inProgress
        case "done": .done
        default: .unknown
        }
    }
}

enum Priority: String {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    case unknown = "Unknown"
    
    init(_ str: String) {
        self = switch str.lowercased() {
        case "low": .low
        case "medium": .medium
        case "high": .high
        default: .unknown
        }
    }
}
