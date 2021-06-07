//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Stephen Wall on 6/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
          .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          .environmentObject(ModelData())
    }
}
