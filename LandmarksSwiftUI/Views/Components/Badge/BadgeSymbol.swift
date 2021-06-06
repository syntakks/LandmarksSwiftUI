//
//  BadgeSymbol.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/5/21.
//

import SwiftUI

struct BadgeSymbol: View {
  static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
  
    var body: some View {
      GeometryReader { geometry in
        Path { path in
          let width = min(geometry.size.width, geometry.size.height)
          let height = width * 0.75
          let spacing = width * 0.030
          let middle = width * 0.5
          let topWidth = width * 0.226
          let topHeight = height * 0.488
          // Top Shape
          let top = [
            CGPoint(x: middle, y: spacing),
            CGPoint(x: middle - topWidth, y: topHeight - spacing),
            CGPoint(x: middle, y: topHeight / 2 + spacing),
            CGPoint(x: middle + topWidth, y: topHeight - spacing),
            CGPoint(x: middle, y: spacing)
          ]
          //printLineCoordinates(lines: top, description: "TOP")
          path.addLines(top)
          // Move to Bottom Shape Start
          path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
          // Bottom Shape
          let bottom = [
            CGPoint(x: middle - topWidth, y: topHeight + spacing),
            CGPoint(x: spacing, y: height - spacing),
            CGPoint(x: width - spacing, y: height - spacing),
            CGPoint(x: middle + topWidth, y: topHeight + spacing),
            CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
          ]
          //printLineCoordinates(lines: bottom, description: "BOTTOM")
          path.addLines(bottom)
        }
        .fill(Self.symbolColor)
      }
      
    }
  
  func printLineCoordinates(lines: [CGPoint], description: String) {
    lines.forEach { line in
      print("\(description) x:\(line.x)y:\(line.y)")
    }
  }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
