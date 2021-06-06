//
//  Profile.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/5/21.
//

import Foundation

struct Profile {
  var username: String
  var prefersNotifications = true
  var seasonalPhoto = Season.winter
  var goalDate = Date()
  
  static let `default` = Profile(username: "swall")
  
  enum Season: String, CaseIterable, Identifiable {
    case spring = "🌷"
    case summer = "🌞"
    case autumn = "🍂"
    case winter = "⛄️"
    
    var id: String { self.rawValue }
  }
}
