//
//  URLProtocolStub.swift
//  CatFancy
//
//  Created by Josh Adams on 9/16/22.
//

import Foundation

class URLProtocolStub: URLProtocol {
  // 1
  static var urlDataDict: [URL: Data] = [:]

  // 2
  override class func canInit(with request: URLRequest) -> Bool {
    return true
  }

  // 2
  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    return request
  }

  // 2
  override func startLoading() {
    if
      let url = request.url,
      let data = URLProtocolStub.urlDataDict[url]
    {
      client?.urlProtocol(self, didReceive: URLResponse(), cacheStoragePolicy: .notAllowed)
      client?.urlProtocol(self, didLoad: data)
    } else {
      client?.urlProtocol(self, didFailWithError: LoadingError.loadFailed)
    }
    client?.urlProtocolDidFinishLoading(self)
  }

  // 2
  override func stopLoading() {}

  // 3
  enum LoadingError: Error {
    case loadFailed
  }
}
