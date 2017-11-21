import Commander
import PathKit


let templatePathArgument = Argument<String>("template", description: "The template used", validator: nil)
let dataModelPathArgument = Argument<String>("datamodel", description: "The path where .xcdatamodel is", validator: nil)
let outputPathOption = Option("output", default: Path.current.absolute().string, flag: "o", description: "The path where file will be generate")


let genCommand = command(templatePathArgument, dataModelPathArgument, outputPathOption) { templatePath, datamodelPath, outputPath in
  guard let context = Context(from: datamodelPath, output: outputPath) else { return }
  context.start()
}

let updateCommand = command {
  Template.download()
}

let groupCommand = Group { (group) in
  group.addCommand("gen", genCommand)
  group.addCommand("update", updateCommand)
}



//try! groupCommand.run(
//  ["gen",
//   "--datamodel","/Users/allanvialatte/Developer/poissonballon-project/DataModelGen/Exemple/Sample.xcdatamodel",
//   "--output","/Users/allanvialatte/Developer/poissonballon-project/DataModelGen/Exemple/Exemple-Codable/Gen-Exemple-Codable/DataModelGen",
//   ]
//)

try! groupCommand.run(["update"])
