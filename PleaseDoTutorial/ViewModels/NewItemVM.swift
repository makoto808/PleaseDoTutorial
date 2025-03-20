//
//  NewItemVM.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/19/25.
//

import Foundation

final class NewItemVM: ObservableObject {
    
    @Published var newItem = Item.empty()
    
    func saveNewItem() async throws {
        try await IM.shared.save(newItem)
    }
}
