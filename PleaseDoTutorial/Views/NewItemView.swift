//
//  NewItemView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/15/25.
//

import SwiftUI

struct NewItemView: View {
    @State private var text = ""
    @State private var description = ""
    @State private var item = Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low)
    
    var body: some View {
        VStack(spacing: 10) {
            
            Spacer()
            
            TitledTextField(title: "Title", text: $text, placeholder: "What do you need to do?")
            
            Divider()
            
            TitledTextField(title: "Description", text: $description, placeholder: "Add a brief description")
            
            Divider()
            
            StatusMenu(status: $item.status)
            
            Divider()
            
            PriorityMenu(priority: $item.priority)
            
            Spacer()
            
            CTAButton(title: "Confirm") {
                print("CTAButton Tapped")
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NewItemView()
}
