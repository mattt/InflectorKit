InflectorKit
============

**Efficiently Singularize and Pluralize Strings**

InflectorKit ports the string inflection functionality of [Rails ActiveSupport](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflector/inflections.rb) to Foundation.

> InflectorKit joins [FormatterKit](https://github.com/mattt/FormatterKit) & [TransformerKit](https://github.com/mattt/TransformerKit) in providing well-designed APIs for manipulating user-facing content.

## Usage

```objective-c
#import "NSString+InflectorKit.h"

for (NSString *singular in @[@"person", @"tomato", @"matrix", @"octopus", @"fish"]) {
  NSLog(@"%@: %@", singular, [singular pluralizedString]);
}
```

    person: people
    tomato: tomatoes
    matrix: matrices
    octopus: octopi
    fish: fish

You can also add pluralization rules, including irregular and uncountable words:

```objective-c
#import "TTTStringInflector.h"

TTTStringInflector *inflector = [TTTStringInflector defaultInflector];
[inflector addPluralRule:@"^i(Pod|Pad)( Mini)?$" withReplacement:@"i$1s$2"];
[inflector addIrregularWithSingular:@"lol" plural:@"lolz"];
[inflector addUncountable:@"Herokai"];

for (NSString *singular in @[@"iPad Mini", @"lol", @"Herokai"]) {
  NSLog(@"%@: %@", singular, [singular pluralizedString]);
}
```

    iPad Mini: iPads Mini
    lol: lolz
    Herokai: Herokai

## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))
