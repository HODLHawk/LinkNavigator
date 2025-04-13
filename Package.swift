// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LinkNavigator",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(
      name: "LinkNavigator",
      targets: ["LinkNavigator"]),
  ],
  targets: [
    .target(
      name: "LinkNavigator",
    ),
    .testTarget(
      name: "LinkNavigatorTests",
      dependencies: ["LinkNavigator"]),
  ])
