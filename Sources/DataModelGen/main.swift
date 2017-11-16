import Commander
import PathKit

let dataModelPathArgument = Option("datamodel", default :Path.current.absolute().string, flag: "d", description: "The path where .xcdatamodel is")
let outputPathOption = Option("output", default: Path.current.absolute().string, flag: "o", description: "The path where file will be generate")



let codableCommand = command(dataModelPathArgument, outputPathOption) { datamodelPath, outputPath in
  guard let context = Context(from: datamodelPath, output: outputPath) else { return }
  context.start()
}

let vapor3Command = command(dataModelPathArgument, outputPathOption) { datamodelPath, outputPath in
  guard let context = Context(from: datamodelPath, output: outputPath) else { return }
  context.start()
}

let realmCommand = command(dataModelPathArgument, outputPathOption) { datamodelPath, outputPath in
  guard let context = Context(from: datamodelPath, output: outputPath) else { return }
  context.start()
}

let groupCommand = Group { (group) in
  group.addCommand("codable", codableCommand)
  group.addCommand("vapor3", vapor3Command)
  group.addCommand("realm", realmCommand)
}

try! groupCommand.run(
  ["codable",
   "--datamodel","/Users/allanvialatte/Developer/poissonballon-project/DataModelGen/Exemple/Sample.xcdatamodel",
   "--output","/Users/allanvialatte/Developer/poissonballon-project/DataModelGen/Exemple/Exemple-Codable/Gen-Exemple-Codable/DataModelGen",
   ]
)
