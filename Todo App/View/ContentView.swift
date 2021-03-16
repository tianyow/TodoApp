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
  
  @State private var showingAddTodoView: Bool = false
  
  // MARK: - BODY
    var body: some View {
      NavigationView {
        List(0 ..< 15) { item in
          Text("Hello, World!")
        } //: LIST
          .navigationBarTitle("Todo", displayMode: .inline)
          .navigationBarItems(trailing:
            Button(action: {
              self.showingAddTodoView.toggle()
            }) {
              Image(systemName: "plus")
            } //: ADD BUTTON
              .sheet(isPresented: $showingAddTodoView) {
                AddTodoView()
            }
        
        )
      } //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
