# InflectorKit
![CI][ci badge]

InflectorKit is a port of the string inflection functionality from
[Rails ActiveSupport](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflector/inflections.rb) for Swift and Objective-C.

> InflectorKit joins [FormatterKit](https://github.com/mattt/FormatterKit) & [TransformerKit](https://github.com/mattt/TransformerKit) in providing well-designed APIs for manipulating user-facing content.

## Usage

### Swift

```swift
import InflectorKit

for singular in ["person", "tomato", "matrix", "octopus", "fish"] {
    print("\(singular) → \(singular.pluralized)")
}
/*
Prints:
person → people
tomato → tomatoes
matrix → matrices
octopus → octopi
fish → fish
*/

// You can also add pluralization rules,
// including irregular and uncountable words:

let inflector = StringInflector.default
inflector.addPluralRule(#"^i(Pod|Pad)( Mini)?$"#, replacement: #"i$1s$2"#)
inflector.addIrregular(singular: "lol", plural: "lolz")
inflector.addUncountable("Herokai")

for singular in ["iPad Mini", "lol", "Herokai"] {
    print("\(singular) → \(singular.pluralized)")
}
/*
Prints:
iPad Mini → iPads Mini
lol → lolz
Herokai → Herokai
*/
```

### Objective-C

```objective-c
#import "NSString+InflectorKit.h"

for (NSString *singular in @[@"person", @"tomato", @"matrix", @"octopus", @"fish"]) {
  NSLog(@"%@ → %@", singular, [singular pluralizedString]);
}

/*
Prints:
person → people
tomato → tomatoes
matrix → matrices
octopus → octopi
fish → fish
*/

// You can also add pluralization rules,
// including irregular and uncountable words:

TTTStringInflector *inflector = [TTTStringInflector defaultInflector];
[inflector addPluralRule:@"^i(Pod|Pad)( Mini)?$" withReplacement:@"i$1s$2"];
[inflector addIrregularWithSingular:@"lol" plural:@"lolz"];
[inflector addUncountable:@"Herokai"];

for (NSString *singular in @[@"iPad Mini", @"lol", @"Herokai"]) {
  NSLog(@"%@ → %@", singular, [singular pluralizedString]);
}

/*
Prints:
iPad Mini → iPads Mini
lol → lolz
Herokai → Herokai
*/
```

## Installation

### Swift Package Manager

Add the InflectorKit package to your target dependencies in `Package.swift`:

```swift
import PackageDescription

let package = Package(
  name: "YourProject",
  dependencies: [
    .package(
        url: "https://github.com/mattt/InflectorKit",
        from: "0.0.1"
    ),
  ]
)
```

Then run the `swift build` command to build your project.

### CocoaPods

You can install `InflectorKit` via CocoaPods,
by adding the following line to your `Podfile`:

```ruby
pod 'InflectorKit', '~> 0.0.1'
```

Run the `pod install` command to download the library
and integrate it into your Xcode project.

## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))

[ci badge]: https://github.com/mattt/InflectorKit/workflows/CI/badge.svg
