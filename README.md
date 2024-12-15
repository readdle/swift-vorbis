# swift-vorbis
A basic Swift Package wrapper for `libvorbis` from [xiph/vorbis](https://github.com/xiph/vorbis).

# Usage
Add a dependency to your Swift Package definition.
The example below is in `swift-tools-version: 5.4` syntax:
```swift
let package = Package(
    name: "MyPackage",
    products: [.library(name: "MyLib", targets: ["MyLib"])],
    dependencies: [
        .package(url: "https://github.com/readdle/swift-vorbis.git", .upToNextMinor(from: "1.3.7")),
    ],
    targets: [
        .target(
            name: "MyLib",
            dependencies: [
                .product(name: "Vorbis", package: "swift-vorbis"),
            ],
…
```
Import C module in your code and use [vorbis API](https://xiph.org/vorbis/doc/libvorbis/reference.html):
```swift
import CVorbis

var info = vorbis_info()
var dspState = vorbis_dsp_state()
var block = vorbis_block()
var comment = vorbis_comment()

guard vorbis_encode_init(&info, …) == 0 else {
    throw …
}

vorbis_analysis_init(&dspState, &info)
vorbis_block_init(&dspState, &vblock)
vorbis_comment_init(&comment)
```

# Versioning
As it is only a wrapper, versioning strictly follows the original.
Version `1.3.7` would correspond to official [v1.3.7](https://github.com/xiph/vorbis/releases/tag/v1.3.7) release
and so on.

# Licenses
This project is under MIT license. `libvorbis` sources are
from [xiph/vorbis repository](https://github.com/xiph/vorbis) and are licensed under
the [BSD-3-Clause license](https://github.com/xiph/vorbis?tab=License-1-ov-file).
