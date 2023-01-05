//
//  BreedsRequester.swift
//  FancyCat
//
//  Created by Josh Adams on 1/4/23.
//

import Foundation

enum BreedRequester {
  static func requestBreedsClassicWithoutInjection(completion: @escaping ([Breed]?) -> ()) {
    URLSession.shared.dataTask(with: URL(string: "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/CatFancy/breeds.json")!) { data, _, error in
      if
        let data = data,
        error == nil
      {
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let breeds = try decoder.decode(Breeds.self, from: data)
          completion(breeds.breeds)
        } catch {
          completion(nil)
        }
      } else {
        completion(nil)
      }
    }.resume()
  }

  static func requestBreedsClassicWithInjection(session: URLSession, url: URL, completion: @escaping ([Breed]?) -> ()) {
    session.dataTask(with: url) { data, _, error in
      if
        let data = data,
        error == nil
      {
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let breeds = try decoder.decode(Breeds.self, from: data)
          completion(breeds.breeds)
        } catch {
          completion(nil)
        }
      } else {
        completion(nil)
      }
    }.resume()
  }

  static func requestBreedsSyncWithoutInjection() async -> [Breed]? {
    do {
      let (data, _) = try await URLSession.shared.data(from: URL(string: "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/CatFancy/breeds.json")!)
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let breeds = try decoder.decode(Breeds.self, from: data)
      return breeds.breeds
    } catch {
      return nil
    }
  }

  static func requestBreedsSyncWithInjection(url: URL, session: URLSession = URLSession.stubSession) async -> [Breed]? {
    do {
      let (data, _) = try await session.data(from: url)
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let breeds = try decoder.decode(Breeds.self, from: data)
      return breeds.breeds
    } catch {
      return nil
    }
  }
}
