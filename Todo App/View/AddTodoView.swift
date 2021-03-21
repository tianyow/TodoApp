//
//  AddTodoView.swift
//  Todo App
//
//  Created by TIAN MBPR on 2021/1/17.
//  Copyright © 2021 PSC. All rights reserved.
//

import SwiftUI
import CoreData

struct AddTodoView: View {
  // MARK: - PROPERTIES
  
  @Environment(\.managedObjectContext) var managedObjectContext
  @Environment(\.presentationMode) var presentationMode
  
  @State private var name: String = ""
  @State private var priority: String = "Normal"
  
  let priorities = ["High", "Normal", "Low"]
  
  @State private var errorShowing: Bool = false
  @State private var errorTitle: String = ""
  @State private var errorMessage: String = ""
  
  // MARK: - BODY
    var body: some View {
      NavigationView {
        VStack {
          Form {
            // MARK: - TODO NAME
            TextField("Todo", text: $name)
            // MARK: - TODO PRIORITY
            Picker("Priority", selection: $priority) {
              ForEach(priorities, id: \.self) {
                Text($0)
              }
            }
          .pickerStyle(SegmentedPickerStyle())
            
          // MARK: - SAVE BUTTON
            Button(action: {
              if self.name != "" {
                let todo = Todo(context: self.managedObjectContext)
                todo.name = self.name
                todo.priority = self.priority
                
                do {
                  try self.managedObjectContext.save()
                  print("New todo: \(todo.name ?? ""), Priority: \(todo.priority ?? "")")
                } catch {
                  print(error)
                }
              } else {
                self.errorShowing = true
                self.errorTitle = "Invalid Name"
                self.errorMessage = "請輸入 for the new todo item"
                return
              }
              self.presentationMode.wrappedValue.dismiss()
            }) {
              Text("Save")
            } //: SAVE BUTTON
          } //: FORM
          
          Spacer()
        } //: VSTACK
          .navigationBarTitle("New Todo", displayMode: .inline)
        .navigationBarItems(trailing:
          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
          }) {
            Image(systemName: "xmark")
          }
        )
          .alert(isPresented: $errorShowing) {
            Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
      } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
