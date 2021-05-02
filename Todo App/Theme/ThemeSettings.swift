//
//  ThemeSettings.swift
//  Todo App
//
//  Created by TIAN MBPR on 2021/3/26.
//  Copyright © 2021 PSC. All rights reserved.
//

import SwiftUI

// MARK - THEME CLASS

final public class ThemeSettings: ObservableObject {
  @Published public var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
    didSet {
      UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
    }
  }
  
  private init() {}
  public static let shared = ThemeSettings()
}
