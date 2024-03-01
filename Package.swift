// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXCoreModule_SD_Store",
	platforms: [.iOS("12.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXCoreModule_SD_Store",
			targets: ["GXCoreModule_SD_StoreWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.5.0-beta.11"),
		.package(url: "https://github.com/genexuslabs/openssl-apple", .upToNextMinor(from: "1.1.101"))
	],
	targets: [
		.target(name: "GXCoreModule_SD_StoreWrapper",
				dependencies: [
					"GXCoreModule_SD_Store",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXOpenSSL", package: "openssl-apple", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCoreModule_SD_Store",
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreModule_SD_Store-1.5.0-beta.11.xcframework.zip",
			checksum: "4b24f86a51a8eda324797cf1f5eb7de2e01b88e6df0abf0b4c15ed4038c604cc"
		)
	]
)