//
//  DescriptionView.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/4/21.
//

import SwiftUI

struct DescriptionView: View {
  @EnvironmentObject var modelData: ModelData
  var landmark: Landmark
  
  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(landmark.name)
          .font(.title)
        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
      }
      HStack {
        Text(landmark.park)
          .font(.subheadline)
        Spacer()
        Text(landmark.state)
      }
      .font(.subheadline)
      .foregroundColor(.secondary)
      Divider()
      Text("About \(landmark.name)")
        .font(.title2)
      Text(landmark.description)
    }
    .padding()
  }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
      DescriptionView(landmark: ModelData().landmarks[1])
        .environmentObject(ModelData())
    }
}
