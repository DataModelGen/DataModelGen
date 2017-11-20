//
//  DataModelKit+SwiftType.swift
//  DataModelGen
//
//  Created by Allan Vialatte on 17/11/2017.
//

import Foundation
import DataModelKit



//def to_s
//items = [
//  "name=#{@name}",
//  "type=#{@type}",
//  "optional=#{@optional}",
//  "default=#{@default}",
//  "indexed=#{@indexed}"
//]
//"\tAttribute => " + items.join(' | ') + "\n"
//end
//
//def decimal?
//(@type == :decimal) || (@type == :double) || (@type == :float)
//end
//
//def integer?
//(@type == :integer_16) || (@type == :integer_32) || (@type == :integer_64)
//end
//
//def number?
//decimal? || integer?
//end
//
//def bool?
//@type == :boolean
//end

extension Attribute {
  var swiftType: String {
    switch self.type {
    case <#pattern#>:
      <#code#>
    default:
      <#code#>
    }
  }
}
