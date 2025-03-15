//
//  HomeView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/9/25.
//

import SwiftUI

struct HomeView: View {
    @State private var path: [NavPath] = []
    @State private var todoItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "def456", authorId: "John Doe", title: "Second Name", description: "Second Description", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "ghi789", authorId: "John Doe", title: "Third Name", description: "Third Description", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @State private var inProgressItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "def456", authorId: "John Doe", title: "Second Name", description: "Second Description", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "ghi789", authorId: "John Doe", title: "Third Name", description: "Third Description", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @State private var doneItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "def456", authorId: "John Doe", title: "Second Name", description: "Second Description", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "ghi789", authorId: "John Doe", title: "Third Name", description: "Third Description", startDate: .now + 10, status: .todo, priority: .low)
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                TabView {
                    ListView(title: "To Do", items: $todoItems)
                    
                    ListView(title: "In Progress", items: $inProgressItems)
                    
                    ListView(title: "Done", items: $doneItems)
                    
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
                        Text("New item view here")
                    case .details(let item):
                        Text(item.title)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
