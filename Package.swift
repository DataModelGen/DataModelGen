// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DataModelGen",
  dependencies: [
    .package(url: "https://github.com/onevcat/Rainbow", .branch("master")),
    .package(url: "https://github.com/PoissonBallon/Stencil.git", .branch("master")),
    .package(url: "git@github.com:PoissonBallon/PathKit.git", .branch("master")),
    .package(url: "https://github.com/PoissonBallon/DataModelKit.git", .upToNextMinor(from:"1.1.0")),
    .package(url: "https://github.com/kylef/Commander.git", .upToNextMinor(from:"0.8.0")),
    .package(url: "https://github.com/JohnSundell/ShellOut.git", .upToNextMinor(from:"2.0.0"))
  ],
  targets: [
    .target(name: "DataModelGen",
            dependencies: [
              "DataModelKit",
              "Rainbow",
              "Stencil",
              "PathKit",
              "Commander",
              "ShellOut"]),
    ]
)
