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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "4.0.0-beta.48"),
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreModule_SD_Store-4.0.0-beta.48.xcframework.zip",
			checksum: "80c270f608771d93712e722345de8a41107732578e2fcc96953650f4f7502abc"
		)
	]
)