//
//  PageControl.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/6/21.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
  var numberOfPages: Int
  @Binding var currentPage: Int
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIView(context: Context) -> UIPageControl {
    let control = UIPageControl()
    control.numberOfPages = numberOfPages
    /*
     Add the coordinator as the target for the valueChanged event, specifying
     the updateCurrentPage(sender:) method as the action to perform.
     */
    control.addTarget(
      context.coordinator,
      action: #selector(Coordinator.updateCurrentPage(sender:)),
      for: .valueChanged
    )
    return control
  }
  
  func updateUIView(_ uiView: UIPageControl, context: Context) {
    uiView.currentPage = currentPage
  }
  
  // MARK: - Coordinator
  class Coordinator: NSObject {
    var control: PageControl
    
    init(_ control: PageControl) {
      self.control = control
    }
    
    /*
     Because UIControl subclasses like UIPageControl use the target-action pattern
     instead of delegation, this Coordinator implements an @objc method
     to update the current page binding.
     */
    @objc
    func updateCurrentPage(sender: UIPageControl) {
      control.currentPage = sender.currentPage
    }
  }
  
}
