import Commander
import PathKit

let datamodelPathArgument = Option("datamodel", Path.current.absolute().string, flag: "d", description: "The path where .xcdatamodel is")
let outputPathOption = Option("output", Path.current.absolute().string, flag: "o", description: "The path where file will be generate")

let main = Commander.command(datamodelPathArgument, outputPathOption) { datamodelPath, outputPath in
  guard let context = Context(from: datamodelPath, output: outputPath) else {
    return
  }
}

main.run()

