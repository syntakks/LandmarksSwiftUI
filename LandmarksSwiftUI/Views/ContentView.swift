//
//  ContentView.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/4/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    LandmarkList()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ModelData())
  }
}
