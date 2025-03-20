//
//  ListVM.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/15/25.
//

import Foundation

final class ListVM: ObservableObject {
    @Published var todoItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "def456", authorId: "John Doe", title: "Second Name", description: "Second Description", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "ghi789", authorId: "John Doe", title: "Third Name", description: "Third Description", startDate: .now + 10, status: .todo, priority: .low)]
    @Published var inProgressItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "def456", authorId: "John Doe", title: "Second Name", description: "Second Description", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "ghi789", authorId: "John Doe", title: "Third Name", description: "Third Description", startDate: .now + 10, status: .todo, priority: .low)]
    @Published var doneItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "def456", authorId: "John Doe", title: "Second Name", description: "Second Description", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "ghi789", authorId: "John Doe", title: "Third Name", description: "Third Description", startDate: .now + 10, status: .todo, priority: .low)]
    @Published var unknown: [Item] = []
    
    init() {
        IM.shared.delegate = self
    }
    
    func fetchItems() {
        IM.shared.fetchItems()
    }
}

extension ListVM: ItemsManagerDelegate {
    func didFetchBatchItems(_ items: [Status: [Item]]) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            for status in items.keys {
                switch status {
                case .todo:
                    todoItems = items[status]!
                case .inProgress:
                    inProgressItems = items[status]!
                case .done:
                    doneItems = items[status]!
                case .unknown:
                    continue
                }
            }
        }
    }
    
    func didAddItem(_ item: Item) {
        <#code#>
    }
    
    func didUpdateItem(_ item: Item) {
        <#code#>
    }
    
    func didDeleteItem(_ item: Item) {
        <#code#>
    }
    
    
}
