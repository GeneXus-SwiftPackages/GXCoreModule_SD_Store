// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCoreModule_SD_Store",
	platforms: [.iOS("15.0"), .tvOS("18.0")],
	products: [
		.library(
			name: "GXCoreModule_SD_Store",
			targets: ["GXCoreModule_SD_StoreWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "3.0.0-beta.13"),
		.package(url: "https://github.com/genexuslabs/openssl-apple", .upToNextMinor(from: "1.2.101"))
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreModule_SD_Store-3.0.0-beta.13.xcframework.zip",
			checksum: "7322bab299c07bec079de7d1b58774478829db085d611f8d67d664edd7c2150a"
		)
	]
)