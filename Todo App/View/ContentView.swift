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
        VStack(spacing: 25) {
            NavigationLink(destination: XView()) {
                Text("Open ContentView")
            }
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
        }
      } //: NAVIGATION
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
        ContentView()
    }
}
