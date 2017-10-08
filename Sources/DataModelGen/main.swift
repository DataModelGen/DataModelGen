import Commander
import PathKit

let datamodelPathArgument = Option("datamodel", Path.current.absolute().string, flag: "d", description: "The path where .xcdatamodel is")
let outputPathOption = Option("output", Path.current.absolute().string, flag: "o", description: "The path where file will be generate")
let templatePathOption = Option("template", Path.current.absolute().string, flag: "t", description: "The template path")

let main = Commander.command(datamodelPathArgument, outputPathOption, templatePathOption) { datamodelPath, outputPath, templatePath in
  guard let context = Context(from: datamodelPath, output: outputPath) else {
    return
  }
  
}

main.run()

