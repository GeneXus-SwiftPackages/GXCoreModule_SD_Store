// swift-tools-version: 5.9
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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "2.2.0-beta.12"),
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreModule_SD_Store-2.2.0-beta.12.xcframework.zip",
			checksum: "8833d73f409f36d375990393095d39b1ee3b7fb6b6bee9419507b9c3e47427aa"
		)
	]
)