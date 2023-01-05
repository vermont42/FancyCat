//
//  main.swift
//  FancyCat
//
//  Created by Josh Adams on 12/15/22.
//

import Foundation

BreedRequester.requestBreedsClassicWithoutInjection { breeds in
  if let breeds {
    print("Breed count using classic URLSession.dataTask without injection: \(breeds.count)")
  } else {
    fatalError("Classic breed-fetching without injection failed.")
  }
}

let delay: TimeInterval = 2.0
Thread.sleep(forTimeInterval: delay)

BreedRequester.requestBreedsClassicWithInjection(session: URLSession.stubSession, url: BreedsURL.standard.url) { breeds in
  if let breeds {
    print("Breed count using classic URLSession.dataTask with injection: \(breeds.count)")
  } else {
    fatalError("Classic breed-fetching with injection failed.")
  }
}

Thread.sleep(forTimeInterval: delay)

Task {
  if let breeds = await BreedRequester.requestBreedsSyncWithoutInjection() {
    print("Breed count using synchronous URLSession.data without injection: \(breeds.count)")
  } else {
    fatalError("Synchronous breed-fetching without injection failed.")
  }
}

Thread.sleep(forTimeInterval: delay)

Task {
  if let breeds = await BreedRequester.requestBreedsSyncWithInjection(url: BreedsURL.standard.url, session: URLSession.stubSession) {
    print("Breed count using synchronous URLSession.data with injection: \(breeds.count)")
  } else {
    fatalError("Synchronous breed-fetching with injection failed.")
  }
}

Thread.sleep(forTimeInterval: delay)
