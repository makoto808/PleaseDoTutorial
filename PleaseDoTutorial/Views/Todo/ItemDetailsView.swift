//
//  ItemDetailsView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/15/25.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    @Binding var path: [NavPath]
    @StateObject private var vm = ItemDetailsVM()
    
    var body: some View {
        VStack {
            TitledTextField(title: "Title", text: $vm.updatedItem.title, placeholder: "What do you need to do?")
            
            Divider()
            
            TitledTextField(title: "Description", text: $vm.updatedItem.description, placeholder: "Add a brief description")
            
            Divider()
            
            StatusMenu(status: $vm.updatedItem.status)
            
            Divider()
            
            PriorityMenu(priority: $vm.updatedItem.priority)
            
            Spacer()
            
            if vm.initialItem.isDifferent(comparedTo: vm.updatedItem) {
                CTAButton(title: "Confirm") {
                    vm.updateItem()
                }
                .alert("Alert", isPresented: $vm.updateItemError) {
                    Button("Dismiss", role: .cancel) {}
                } message: {
                    Text("Error saving new item.")
                }
                .alert("Success", isPresented: $vm.didUpdateItem) {
                    Button("Dismiss", role: .cancel) {
                        path.removeLast()
                    }
                } message: {
                    Text("New item saved successfully.")
                }
            }
        }
        .padding()
        .navigationTitle("Details")
        .onAppear {
            vm.initialItem = item
            vm.updatedItem = item
        }
    }
}

#Preview {
    ItemDetailsView(item: Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low), path: .constant([]))
}
