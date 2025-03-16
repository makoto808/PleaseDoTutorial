//
//  ItemDetailsView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/15/25.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    @State private var updatedItem = Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low)
    
    var body: some View {
        VStack {
            TitledTextField(title: "Title", text: $updatedItem.title, placeholder: "What do you need to do?")
            
            Divider()
            
            TitledTextField(title: "Description", text: $updatedItem.description, placeholder: "Add a brief description")
            
            Divider()
            
            StatusMenu(status: $updatedItem.status)
            
            Divider()
            
            PriorityMenu(priority: $updatedItem.priority)
            
            Spacer()
            
            CTAButton(title: "Confirm") {
                print("CTAButton Tapped")
            }
        }
        .padding()
        .navigationTitle("Details")
    }
}

#Preview {
    ItemDetailsView(item: Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low))
}
