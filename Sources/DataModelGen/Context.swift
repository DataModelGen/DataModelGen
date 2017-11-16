//
//  Command.swift
//  DataModelGenPackageDescription
//
//  Created by Allan Vialatte on 08/10/2017.
//

import Foundation
import Commander
import PathKit
import Rainbow
import DataModelKit
import Stencil

struct Context {
  let inputPath: Path
  let outputPath: Path
  let dataModel: DataModel
  
//  var stencilTemplate:
  
  init?(from input:String, output:String) {
    self.inputPath = Path(input).absolute()
    self.outputPath = Path(output).absolute()
    printSuccess(message: "DataModel Path : \(self.inputPath)")
    printSuccess(message: "Output Path : \(self.outputPath)")
    do {
      self.dataModel = try DataModel(with: self.inputPath.string)
    } catch {
      printError(message: "Failed to create DataModel", error: error)
      return nil
    }
  }
  
  func start() {
    print("Prout")
  }
}
