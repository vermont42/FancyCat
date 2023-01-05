//
//  BreedsURL.swift
//  FancyCat
//
//  Created by Josh Adams on 1/4/23.
//

import Foundation

enum BreedsURL: String, CaseIterable {
  case standard
  case empty
  case malformed
  case withMore

  var url: URL {
    let standardURLString = "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/CatFancy/breeds.json"
    let emptyURLString = "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/CatFancy/breeds_empty.json"
    let malformedURLString = "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/CatFancy/breeds_malformed.json"
    let withMoreURLString = "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/CatFancy/breeds_with_more.json"

    let urlString: String

    switch self {
    case .standard:
      urlString = standardURLString
    case .empty:
      urlString = emptyURLString
    case .malformed:
      urlString = malformedURLString
    case .withMore:
      urlString = withMoreURLString
    }

    if let url = URL(string: urlString) {
      return url
    } else {
      fatalError("Could not initialize URL from \(urlString).")
    }
  }
}