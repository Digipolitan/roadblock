import PackageDescription

let package = Package(
  name: "Roadblock",
  dependencies: [
    .Package(url: "https://github.com/Digipolitan/localization-toolkit.git", versions: Version(1, 0, 0)..<Version(2, 0, 0))
  ],
  exclude: [
    "Tests",
    "Samples"
  ]
)
