//
//  CategoryHome.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/5/21.
//

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var modelData: ModelData
  @State private var showingProfile = false
  
    var body: some View {
      NavigationView {
        List {
          // First featured landmark
          modelData.features[0].image
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .clipped()
            .listRowInsets(EdgeInsets())
          // Sets the edge instets to zero so the content can extend to the edges of the display.
          
          ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
            CategoryRow(categoryName: key, items: modelData.categories[key]!)
          }
          .listRowInsets(EdgeInsets())
        }
        .navigationTitle("Featured")
        .toolbar {
          Button(action: { showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
              .accessibilityLabel("User Profile")
          }
        }
        .sheet(isPresented: $showingProfile) {
          ProfileHost()
            .environmentObject(modelData)
        }
      }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
          .environmentObject(ModelData())
    }
}
