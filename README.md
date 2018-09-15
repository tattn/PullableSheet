<h1 align="center">PullableSheet</h1>

<h5 align="center">Pullable sheet like a default map app or bottom sheets (Android).</h5>

<div align="center">
  <a href="https://github.com/Carthage/Carthage">
    <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible" />
  </a>
  <a href="http://cocoapods.org/pods/PullableSheet">
    <img src="https://img.shields.io/cocoapods/v/PullableSheet.svg" alt="CocoaPods" />
  </a>
  <a href="http://cocoapods.org/pods/PullableSheet">
    <img src="https://img.shields.io/cocoapods/p/PullableSheet.svg" alt="Platform" />
  </a>
  <a href="https://developer.apple.com/swift">
    <img src="https://img.shields.io/badge/Swift-4-F16D39.svg" alt="Swift Version" />
  </a>
  <a href="./LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-green.svg?style=flat-square" alt="license:MIT" />
  </a>
</div>

<br />

<img src="https://github.com/tattn/PullableSheet/raw/master/docs/assets/demo1.gif" width=300px />
<img src="https://github.com/tattn/PullableSheet/raw/master/docs/assets/demo2.gif" width=300px />


# Installation

## Carthage

```ruby
github "tattn/PullableSheet"
```

## CocoaPods

```ruby
pod 'PullableSheet'
```

# Usage

```swift
import PullableSheet

// ....

override func viewDidLoad() {
    super.viewDidLoad()
    
    let content = UIViewController() // your view controller
    content.view.backgroundColor = .clear

    let sheet = PullableSheet(content: content)
    sheet.snapPoints = [.min, .custom(y: 300), .max] // snap points (if needed)
    sheet.add(to: self)
}
```

## Customize top bar

```swift
let topBar = UIView(frame: .init(x: 0, y: 5, width: 300, height: 30))
topBar.backgroundColor = .green
let sheet = PullableSheet(content: content, topBarStyle: .custom(topBar))
```


# Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

# License

PullableSheet is released under the MIT license. See LICENSE for details.
