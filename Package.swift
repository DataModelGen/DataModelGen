// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DataModelGen",
  dependencies: [
    .package(url: "https://github.com/onevcat/Rainbow", .branch("master")),
    .package(url: "git@github.com:PoissonBallon/DataModelKit.git", .branch("master")),
    .package(url: "git@github.com:PoissonBallon/Stencil.git", .branch("master")),
    .package(url: "git@github.com:PoissonBallon/PathKit.git", .branch("master")),
    .package(url: "https://github.com/kylef/Commander.git", .upToNextMinor(from:"0.7.1"))
  ],
  targets: [
    .target(name: "DataModelGen", dependencies: ["DataModelKit", "Rainbow", "Stencil", "Commander", "PathKit"]),
    ]
)
