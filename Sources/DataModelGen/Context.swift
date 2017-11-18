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
  static let templatePath = Path("/Users/allanvialatte/Developer/poissonballon-project/DataModelGen/Templates/")
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
    let template = FileSystemLoader(paths: [Context.templatePath])
    let env = Environment(loader: template)
    
    self.dataModel.entities.forEach {
      let context = ["entitie":$0]
      let rendered = try! env.renderTemplate(name: "codable.stencil", context: context)
      try! self.file(for: $0)?.write(rendered, encoding: .utf8)
      //      print(rendered)
    }
  }
}


extension Context {
  
  func file(for entitie: Entity) -> Path? {

    guard self.outputPath.isDirectory == true else {
      printError(message: "Dossier introuvable", error: nil)
      return nil
    }
    
    var components = self.outputPath.components
    components.append("\(entitie.name).swift")
    let file = Path(components: components)

    if file.exists == false { FileManager.default.createFile(atPath: file.string, contents: nil, attributes: nil) }
    
    guard self.outputPath.isWritable == true else {
      printError(message: "Fichier not writable", error: nil)
      return nil
    }
    return file
  }
  
}
