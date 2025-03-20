//
//  NewItemView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/15/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject private var vm = NewItemVM()
    
    var body: some View {
        VStack(spacing: 10) {
            
            Spacer()
            
            TitledTextField(title: "Title", text: $vm.newItem.title, placeholder: "What do you need to do?")
            
            Divider()
            
            TitledTextField(title: "Description", text: $vm.newItem.description, placeholder: "Add a brief description")
            
            Divider()
            
            StatusMenu(status: $vm.newItem.status)
            
            Divider()
            
            PriorityMenu(priority: $vm.newItem.priority)
            
            Spacer()
            
            CTAButton(title: "Confirm") {
                Task {
                    do {
                        try await vm.saveNewItem()
                    } catch {
                        
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NewItemView()
}
