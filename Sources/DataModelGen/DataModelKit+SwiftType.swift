//
//  DataModelKit+SwiftType.swift
//  DataModelGen
//
//  Created by Allan Vialatte on 17/11/2017.
//

import Foundation
import DataModelKit

extension AttributeType {
  var swiftType: String {
    switch self {
    case .undefined, .transformable:
      return "Any"
    case .integer16, .integer32, .integer64:
      return "Int"
    case .decimal, .double:
      return "Double"
    case .float:
      return "Float"
    case .string, .uuid:
      return "String"
    case .boolean:
      return "Bool"
    case .date:
      return "Date"
    case .binaryData:
      return "Data"
    case .uri:
      return "URL"
    }
  }
}

