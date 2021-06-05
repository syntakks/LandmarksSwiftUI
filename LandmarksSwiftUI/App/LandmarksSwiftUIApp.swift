//
//  LandmarksSwiftUIApp.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/4/21.
//

import SwiftUI

@main
struct LandmarksSwiftUIApp: App {
  @StateObject private var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(modelData)
    }
  }
}
