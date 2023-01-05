//
//  Breed.swift
//  FancyCat
//
//  Created by Josh Adams on 12/15/22.
//

import Foundation

import Foundation

struct Breed: Decodable {
  let name: String
  let knownFor: String
  let popularity: Int
  let photoUrl: URL
  let infoUrl: URL
  let credit: String
  let license: String
  let description: String
}
