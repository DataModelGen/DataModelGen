//
//  Tools.swift
//  DataModelGenPackageDescription
//
//  Created by Allan Vialatte on 08/10/2017.
//

import Foundation
import Rainbow

let logo = "[DataModelGen] : "

func printSuccess(message:String) {
  print("\(logo) \(message)".green)
}

func printInfo(message:String) {
  print("\(logo) \(message)".yellow)
}

func printError(message:String, error:Error?) {
  if let error = error {
    print("\(logo) \(message) | Error : \(error)".red)
  } else {
    print("\(logo) \(message)".red)
  }
}
