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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.0.0-beta.20230717155910"),
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreModule_SD_Store-1.0.0-beta.20230717155910.xcframework.zip",
			checksum: "0b16e5b43b8e95d11e728f86fa2f3f96132bbc82fbae8e522967f7f5d84cf712"
		)
	]
)