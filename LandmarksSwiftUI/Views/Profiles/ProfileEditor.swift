//
//  ProfileEditor.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/6/21.
//

import SwiftUI
/// This view will have a binding to the draft copy of the user profile. This will prevent multiple updates to the viewmodel while the user is editing the fields.
struct ProfileEditor: View {
  @Binding var profile: Profile
  
  var dateRange: ClosedRange<Date> {
    let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
    let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
    return min...max
  }
  
  var body: some View {
    List {
      // Username
      HStack {
        Text("Username").bold()
        Divider()
        TextField("Username", text: $profile.username)
          .autocapitalization(.none)
      }
      // Notifications
      Toggle(isOn: $profile.prefersNotifications) {
        Text("Enable Notifications").bold()
      }
      // Season Photo
      VStack(alignment: .leading, spacing: 20) {
        Text("Seasonal Photo").bold()
        Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
          ForEach(Profile.Season.allCases) { season in
            Text(season.rawValue).tag(season)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
      }
      // Goal Date
      DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
        Text("Goal Date").bold()
      }
    }
  }
}

struct ProfileEditor_Previews: PreviewProvider {
  static var previews: some View {
    ProfileEditor(profile: .constant(.default))
  }
}
