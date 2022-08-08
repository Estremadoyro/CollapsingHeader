//
//  Model.swift
//  CollapsingHeader
//
//  Created by Leonardo  on 7/08/22.
//

import Foundation

struct Model {
  var name: String
}

extension Model{
  static func getSample() -> [Model] {
    return [
      Model(name: "Senku"),
      Model(name: "Yuzuriha"),
      Model(name: "Taiju"),
      Model(name: "Chrome"),
      Model(name: "Tsukasa")
    ]
  }
}
