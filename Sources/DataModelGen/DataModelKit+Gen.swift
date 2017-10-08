//
//  DataModelKit+Gen.swift
//  DataModelGen
//
//  Created by Allan Vialatte on 08/10/2017.
//

import Foundation
import DataModelKit

extension Attribute {
  // Support `jsonKeyPath` userInfos
  var jsonKeyPath: String? {
    let jsonKeyPath = self.userInfo.first { return ($0.key == "jsonKeyPath") }
    return jsonKeyPath?.value
  }
}
