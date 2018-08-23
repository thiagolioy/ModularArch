# EventBus

[![Platforms](https://img.shields.io/cocoapods/p/EventBus.svg)](https://cocoapods.org/pods/EventBus)
[![License](https://img.shields.io/cocoapods/l/EventBus.svg)](https://raw.githubusercontent.com/thiagolioy/EventBus/master/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/EventBus.svg)](https://cocoapods.org/pods/EventBus)

[![Travis](https://img.shields.io/travis/thiagolioy/EventBus/master.svg)](https://travis-ci.org/thiagolioy/EventBus/branches)
[![SwiftFrameworkTemplate](https://img.shields.io/badge/SwiftFramework-Template-red.svg)](http://github.com/RahulKatariya/SwiftFrameworkTemplate)

cookiecutter bootstrap template for swift framework

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 8.0+ / Mac OS X 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 9.0+

## Installation

### Dependency Managers
<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate EventBus into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'EventBus', '~> 0.0.1'
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
  <summary><strong>Carthage</strong></summary>

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate EventBus into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "thiagolioy/EventBus" ~> 0.0.1
```

</details>

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use EventBus as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:4.1

import PackageDescription

let package = Package(
    name: "HelloEventBus",
    dependencies: [
        .package(url: "https://github.com/thiagolioy/EventBus.git", .upToNextMajor(from: "0.0.1"))
    ],
    targets: [
        .target(name: "HelloEventBus", dependencies: ["EventBus"])
    ]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate EventBus into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add EventBus as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/thiagolioy/EventBus.git
$ git submodule update --init --recursive
```

- Open the new `EventBus` folder, and drag the `EventBus.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `EventBus.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `EventBus.xcodeproj` folders each with two different versions of the `EventBus.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `EventBus.framework`.

- And that's it!

> The `EventBus.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
  <summary><strong>Embedded Binaries</strong></summary><p>

- Download the latest release from https://github.com/thiagolioy/EventBus/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `EventBus.framework`.
- And that's it!

</p></details>

## Usage

## Contributing

Issues and pull requests are welcome!

## Author

Thiago lioy [@tplioy](https://twitter.com/tplioy)

## License

EventBus is released under the MIT license. See [LICENSE](https://github.com/thiagolioy/EventBus/blob/master/LICENSE) for details.
