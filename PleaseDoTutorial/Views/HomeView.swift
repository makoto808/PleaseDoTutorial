//
//  HomeView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/9/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = ListVM()
    @State private var path: [NavPath] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                TabView {
                    ListView(title: "To Do", items: $vm.todoItems)
                    
                    ListView(title: "In Progress", items: $vm.inProgressItems)
                    
                    ListView(title: "Done", items: $vm.doneItems)
                    
                }
                .tabViewStyle(.page)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            print("LogOut")
                        } label: {
                            Image(systemName: "person.circle")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing)
                    {
                        Button {
                            path.append(.newItem)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .navigationDestination(for: NavPath.self) {
                    path in
                    switch path {
                    case .newItem:
                        NewItemView()
                    case .details(let item):
                        ItemDetailsView(item: item)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
