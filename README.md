# RTL

Right to left flipped for UIKit's object, such as UIImage, UIEdgeInsets.

## Install
```
swift
dependencies: [
    .Package(url: "https://github.com/hytaoist/RTL.git", majorVersion: 0.1)
]
```

## Usage

UIImage like an Arrow, backBarItem image need flip when it's in Right to left layout.
```
// For UIImage
let image = UIImage(named: "XXX").rightToLeftFlip()
```

Other's layout object, like a UIEdgeInsets, need flip.
```
// For UIEdgeInsets
let edge = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20).rightToLeftFlip()
```

## Contributing

PRs accepted.

## License

MIT © License