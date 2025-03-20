//
//  ListVM.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/15/25.
//

import Foundation

final class ListVM: ObservableObject {
    @Published var todoItems: [Item] = []
    @Published var inProgressItems: [Item] = []
    @Published var doneItems: [Item] = []
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
        
    }
    
    func didUpdateItem(_ item: Item) {
    
    }
    
    func didDeleteItem(_ item: Item) {
        
    }
    
    
}
