// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "swift-vorbis",
    products: [
        .library(
            name: "Vorbis",
            targets: ["CVorbis"]
        ),
    ],
    dependencies: [
       .package(url: "https://github.com/readdle/swift-ogg.git", .upToNextMajor(from: "1.3.5")),
    ],
    targets: [
        .target(
            name: "CVorbis",
            dependencies: [
                .product(name: "Ogg", package: "swift-ogg"),
            ],
            exclude: [
                "./vorbis/macosx/Info.plist",
                "./vorbis/macosx/English.lproj/InfoPlist.strings",
            ],
            sources: [
                "./vorbis/lib/mdct.c",
                "./vorbis/lib/smallft.c",
                "./vorbis/lib/block.c", 
                "./vorbis/lib/envelope.c",
                "./vorbis/lib/window.c",
                "./vorbis/lib/lsp.c",
                "./vorbis/lib/lpc.c",
                "./vorbis/lib/analysis.c",
                "./vorbis/lib/synthesis.c", 
                "./vorbis/lib/psy.c",
                "./vorbis/lib/info.c",
                "./vorbis/lib/floor1.c",
                "./vorbis/lib/floor0.c",
                "./vorbis/lib/res0.c",
                "./vorbis/lib/mapping0.c",
                "./vorbis/lib/registry.c",
                "./vorbis/lib/codebook.c",
                "./vorbis/lib/sharedbook.c",
                "./vorbis/lib/lookup.c",
                "./vorbis/lib/bitrate.c",
                "./vorbis/lib/vorbisfile.c",
                "./vorbis/lib/vorbisenc.c",
            ],
            cSettings: [
                .headerSearchPath("./vorbis/lib"),
            ]
        ),
        .executableTarget(
            name: "CVorbisTests",
            dependencies: [
                .target(name: "CVorbis"),
                .product(name: "Ogg", package: "swift-ogg"),
            ],
            path: "Tests/CVorbisTests",
            cSettings: [
                .headerSearchPath("../../Sources/CVorbis/vorbis/test"),
                .unsafeFlags([
                    "-Wno-shorten-64-to-32",
                    "-Wno-conversion",
                ]),
            ]
        ),
    ]
)
