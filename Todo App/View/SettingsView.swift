//
//  SettingsView.swift
//  Todo App
//
//  Created by TIAN MBPR on 2021/3/26.
//  Copyright © 2021 PSC. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  
  @Environment(\.presentationMode) var presentationMode
  
  // MARK: - BODY
    var body: some View {
      NavigationView {
        VStack(alignment: .center, spacing: 0) {
          // MARK: - FORM
          
          Form {
            // MARK: SECTION 3
            
            Section(header: Text("Follow Us")) {
              FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://www.google.com")
              FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://www.twitter.com")
              FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Video", link: "https://www.youtube.com")
            } //: SECTION 3
              .padding(.vertical, 3)
            
            // MARK: SECTION 4
            
            Section(header: Text("About the application")) {
              FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
              FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
              FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "John/Jane")
              FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Rober Petras")
              FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.1")
            } //: SECTION 4
            
          } //: FORM
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
          
          // MARK: - FOOTER
          Text("Copyright All rights resered.\nThis is an APP 🎲")
            .multilineTextAlignment(.center)
            .font(.footnote)
            .padding(.top, 6)
            .padding(.bottom, 8)
            .foregroundColor(Color.secondary)
        } //: VSTACK
          .navigationBarItems(trailing:
            Button(action: {
              self.presentationMode.wrappedValue.dismiss()
            }) {
              Image(systemName: "xmark")
            }
          )
          .navigationBarTitle("Settings", displayMode: .inline)
          .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
      } //: NAVIGATION
    }
}

// MARK: PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}