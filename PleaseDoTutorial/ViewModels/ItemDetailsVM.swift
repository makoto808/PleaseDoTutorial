//
//  ItemDetailsVM.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/19/25.
//

import Foundation

final class ItemDetailsVM: ObservableObject {
    
    
    @Published var initialItem: Item.empty()
    @Published var updatedItem = Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low)
    
}
