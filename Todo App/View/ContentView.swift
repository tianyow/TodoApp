//
//  ContentView.swift
//  Todo App
//
//  Created by TIAN MBPR on 2021/1/17.
//  Copyright © 2021 PSC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  @Environment(\.managedObjectContext) var managedObjectContext
  
  @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
  
  @State private var showingAddTodoView: Bool = false
  
  // MARK: - BODY
    var body: some View {
      NavigationView {
        VStack(spacing: 25) {
            NavigationLink(destination: XView()) {
                Text("Open ContentView")
            }
          List {
            ForEach(self.todos, id: \.self) { todo in
              HStack {
                Text(todo.name ?? "Unknown")
                
                Spacer()
                
                  Text(todo.priority ?? "Unknown")
              }
            } //: FOREACH
            .onDelete(perform: deleteTodo)
            } //: LIST
              .navigationBarTitle("Todo", displayMode: .inline)
              .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                  self.showingAddTodoView.toggle()
                }) {
                  Image(systemName: "plus")
                } //: ADD BUTTON
                  .sheet(isPresented: $showingAddTodoView) {
                    AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
                }
            
            )
        }
      } //: NAVIGATION
    }
  
  // MARK: FUNCTIONS
  
  private func deleteTodo(at offsets: IndexSet) {
    for index in offsets {
      let todo = todos[index]
      managedObjectContext.delete(todo)
      
      do {
        try managedObjectContext.save()
      } catch {
        print(error)
      }
    }
  }
}
struct XView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle").imageScale(.large)
            Text("TEST").font(.largeTitle)
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
      return ContentView()
        .environment(\.managedObjectContext, context)
    }
}
