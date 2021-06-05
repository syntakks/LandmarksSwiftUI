//
//  BadgeBackground.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/5/21.
//

import SwiftUI

struct BadgeBackground: View {
  var body: some View {
    GeometryReader { geometry in
      Path { path in
        var width: CGFloat = min(geometry.size.width, geometry.size.height)
        let height = width
        let xScale: CGFloat = 0.832
        let xOffset = (width * (1.0 - xScale)) / 2.0
        width *= xScale
        // Add a starting point to the path assuming a container with size 100x100px.
        path.move(
          to: CGPoint(
            x: width * 0.95 + xOffset,
            y: height * (0.20 + HexagonParameters.adjustment)
          )
        )
        
        // Draw the lines for each point of the shape data to create a rough hexagonal shape.
        HexagonParameters.segments.forEach { segment in
          // Add the lines
          path.addLine(
            to: CGPoint(
              x: width * segment.line.x + xOffset,
              y: height * segment.line.y
            )
          )
          
          // Add the curves
          path.addQuadCurve(
            to: CGPoint(
              x: width * segment.curve.x + xOffset,
              y: height * segment.curve.y
            ),
            control: CGPoint(
              x: width * segment.control.x + xOffset,
              y: height * segment.control.y
            )
          )
          
        }
      }
      .fill(
        LinearGradient(
          gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
          startPoint: UnitPoint(x: 0.5, y: 0),
          endPoint: UnitPoint(x: 0.5, y: 0.6)
        )
      )
    }
  }
  static let gradientStart = Color(red: 239.0/255, green: 120.0/255, blue: 221.0/255)
  static let gradientEnd = Color(red: 239.0/255, green: 172.0/255, blue: 120.0/255)
}

struct BadgeBackground_Previews: PreviewProvider {
  static var previews: some View {
    BadgeBackground()
  }
}
