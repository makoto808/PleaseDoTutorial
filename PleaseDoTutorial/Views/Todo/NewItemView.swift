//
//  NewItemView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/15/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject private var vm = NewItemVM()
    @Binding var path: [NavPath]
    
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
                vm.saveNewItem()
            }
            .alert("Alert", isPresented: $vm.saveItemError) {
                Button("Dismiss", role: .cancel) {}
            } message: {
                Text("Error saving new item.")
            }
            .alert("Success", isPresented: $vm.didSaveItem) {
                Button("Dismiss", role: .cancel) {
                    path.removeLast()
                }
            } message: {
                Text("New item saved successfully.")
            }
        }
        
        .padding(.horizontal)
    }
}

#Preview {
    NewItemView(path: .constant([]))
}
