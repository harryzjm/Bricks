<p align="center" >
  <img src="./asset/hares.jpg">
</p>  

Bricks
===============  

<p align="left">
<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
<a href="https://github.com/CocoaPods/CocoaPods/"><img src="https://img.shields.io/badge/CocoaPods-Compatible-4BC51D.svg?style=flat"></a>
<a href="https://raw.githubusercontent.com/harryzjm/SMWaterFlowLayout/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-393939.svg?style=flat"></a>
</p>


Bricks make Auto Layout easy on both iOS and OS X.

## Requirements

- iOS 9.0+
- Xcode 9.0+
- Swift 4.0

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SwipeMenu into your Xcode project using Carthage, specify it in your `Cartfile`:

```swift
github "harryzjm/Bricks"
```

Run `carthage` to build the framework.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SMWaterFlowLayout into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '7.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'bricks'
end
```

Then, run the following command:

```bash
$ pod install
```

#### Source File

Simply add the file in Source directory into your project.

## Usage

<table border="0">
  <tr>
      <td><img src="./asset/sample1.png"></td>						
      <td><img src="./asset/sample2.png"></td>		
  </tr>
</table>

```swift  
import bricks
func newView() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor(hue: CGFloat(arc4random_uniform(255)) / 255, saturation: 1, brightness: 1, alpha: 1)
    return view
}

let container1 = UIView()
let container2 = UIView()
let container3 = UIView()
let container4 = UIView()

view.make(space: 0, axis: .vertical, margin: true, views: container1, container2, container3, container4)

container1.make(length: 20, axis: .horizontal, margin: true, views: newView(), newView(), newView(), newView())
container2.make(length: 60, axis: .horizontal, views: newView(), newView(), newView(), newView())
container3.make(space: 5, axis: .horizontal, views: newView(), newView(), newView(), newView())
newView().edges(superView: container4, horizontal: 100, vertical: 5)
```  


## Communication

- If you **need help**, open an issue or send an email.
- If you **found a bug**, open an issue or send an email.
- If you'd like to **ask a question**,open an issue or send an email.
- If you **want to contribute**, submit a pull request.

## License

Bricks is released under the MIT license. See LICENSE for details.

##  Author😬  

[Hares - https://github.com/harryzjm](https://github.com/harryzjm)  
Blog:  **https://harryzjm.github.io/**  
Email: **harryzjm@live.com**  


