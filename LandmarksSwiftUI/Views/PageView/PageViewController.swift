//
//  PageViewController.swift
//  LandmarksSwiftUI
//
//  Created by Steve Wall on 6/6/21.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
  var pages: [Page]
  @Binding var currentPage: Int
  
  /*
   SwiftUI calls this makeCoordinator() method before makeUIViewController(context:),
   so that you have access to the coordinator object when configuring your view controller.
   Tip:
   You can use this coordinator to implement common Cocoa patterns, such as delegates,
   data sources, and responding to user events via target-action.
   */
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal
    )
    pageViewController.dataSource = context.coordinator
    pageViewController.delegate = context.coordinator
    return pageViewController
  }
  
  func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
    pageViewController.setViewControllers(
      [context.coordinator.controllers[currentPage]], direction: .forward, animated: true
    )
  }
  
  //MARK: - Coordinator to handle UIViewRepresentable
  class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var parent: PageViewController
    var controllers = [UIViewController]()
    
    init(_ pageViewController: PageViewController) {
      parent = pageViewController
      controllers = parent.pages.map { UIHostingController(rootView: $0) }
    }
    // MARK: - Data Source
    // These Data source methods allow the pages to loop infinitely
    /// Returns the previous Page Controller  from the current.
    func pageViewController(
      _ pageViewController: UIPageViewController,
      viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
      guard let index = controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index == 0 {
        return controllers.last
      }
      return controllers[index - 1]
    }
    
    /// Returns the next Page Controller from the current.
    func pageViewController(
      _ pageViewController: UIPageViewController,
      viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
      guard let index = controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index + 1 == controllers.count {
        return controllers.first
      }
      return controllers[index + 1]
    }
    
    // MARK: - Delegate
    // Persisting the current page index
    func pageViewController(
      _ pageViewController: UIPageViewController,
      didFinishAnimating finished: Bool,
      previousViewControllers: [UIViewController],
      transitionCompleted completed: Bool) {
      if completed,
         let visibleViewController = pageViewController.viewControllers?.first,
         let index = controllers.firstIndex(of: visibleViewController) {
        parent.currentPage = index
      }
    }
  }
  
}
