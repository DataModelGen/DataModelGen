//
//  File.swift
//  DataModelGenPackageDescription
//
//  Created by Allan Vialatte on 17/11/2017.
//

import Foundation
import PathKit
import ShellOut


struct Template {
  static let templatesRepository = URL(string: "https://github.com/DataModelGen/Template.git")!
  
  static let applicationSupport: Path = {
    let paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory,.userDomainMask, true)
    guard let path = paths.first else {
      fatalError("Unable to locate the Application Support directory on your machine!")
    }
    return Path(path)
  }()
  
  static let cachesPath: Path = {
    let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory,.userDomainMask, true)
    guard let path = paths.first else {
      fatalError("Unable to locate the Application Support directory on your machine!")
    }
    return Path(path)
  }()


  static func update(from path:String) {
    print("Cache Repo : \(path)")
    print("Application Support template : \(Template.applicationSupport)")

    do {
      try shellOut(to: ["rsync", "-av", "\(path)/templates", "\(Template.applicationSupport)"])
    } catch {
      let error = error as! ShellOutError
      print(error.message) // Prints STDERR
      print(error.output) // Prints STDOUT
    }
    
  }
  
  static func download() {
    print("Template Repo : \(templatesRepository)")
    print("Caches Path : \(Template.cachesPath.absolute().string)")
    let folder = "datamodelgen"
    let gitCaches = Path(components: Template.cachesPath.components + [folder])
    do {
      try shellOut(to: .gitClone(url: Template.templatesRepository, to: gitCaches.absolute().string))
    } catch {
      let error = error as! ShellOutError
      print(error.message) // Prints STDERR
      print(error.output) // Prints STDOUT
    }
    Template.update(from: gitCaches.absolute().string)
  }
}
