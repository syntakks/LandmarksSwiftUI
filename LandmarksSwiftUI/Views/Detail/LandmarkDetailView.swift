//
//  ContentView.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/4/21.
//

import SwiftUI

struct LandmarkDetailView: View {
  var landmark: Landmark
  
  var body: some View {
    ScrollView {
      MapView(coordinate: landmark.locationCoordinate)
        .ignoresSafeArea(edges: .top)
        .frame(height: 300)
      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
      DescriptionView(landmark: landmark)
    }
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LandmarkDetailView_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkDetailView(landmark: ModelData().landmarks[0])
  }
}
