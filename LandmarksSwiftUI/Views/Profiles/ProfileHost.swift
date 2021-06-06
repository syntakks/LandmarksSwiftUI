//
//  ProfileHost.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/5/21.
//

import SwiftUI

struct ProfileHost: View {
  @Environment(\.editMode) var editMode
  @EnvironmentObject var modelData: ModelData
  @State private var draftProfile = Profile.default
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        if editMode?.wrappedValue == .active {
          Button("Cancel") {
            // Reset draft to current and apply animation to editMode change.
            draftProfile = modelData.profile
            editMode?.animation().wrappedValue = .inactive
          }
        }
        Spacer()
        EditButton()
      }
      /*
       Note: To avoid updating the gobal app state before confiming any edits
       -- Such as while the user enters their name --
       the editing view operates on a copy of itself.
       */
      if editMode?.wrappedValue == .inactive {
        ProfileSummary(profile: modelData.profile)
      } else {
        ProfileEditor(profile: $draftProfile)
          .onAppear {
            // Set up the editor draft with current profile
            draftProfile = modelData.profile
          }
          .onDisappear {
            // Save the changes from the draft to the model data profile.
            modelData.profile = draftProfile
          }
      }
    }
    .padding()
  }
}

struct ProfileHost_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHost()
      .environmentObject(ModelData())
  }
}
