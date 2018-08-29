//
//  ViewController.swift
//  SDWebImagePrefetcherCompletionBug
//
//  Created by Eric Denman on 8/24/18.
//  Copyright © 2018 Coffee Train. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    prefetch()
  }

  private func prefetch() {
    NSLog("OMG called prefetch")
    let bogusURL = URL(string: "https://not_a_domain/lazy_bear.jpg")!
    SDWebImagePrefetcher.shared().prefetchURLs([bogusURL], progress: nil, completed: { numFinished, numSkipped in
      NSLog("OMG finished \(numFinished) skipped \(numSkipped)")
      self.prefetch()
    })
  }
}
