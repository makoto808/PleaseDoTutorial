//
//  ItemDetailsVM.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/19/25.
//

import Foundation

final class ItemDetailsVM: ObservableObject {
    
    
    @Published var initialItem = Item.empty()
    @Published var updatedItem = Item.empty()
    @Published var didUpdateItem = false
    @Published var updateItemError = false
    
    func updateItem() {
        Task {
            do {
                try await IM.shared.save(updatedItem)
                DispatchQueue.main.async { [weak self] in
                    self?.didUpdateItem = true
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.updateItemError = true
                }
            }
        }
    }
}
