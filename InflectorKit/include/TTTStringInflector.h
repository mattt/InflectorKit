// TTTStringInflector.h
//
// Copyright (c) 2013 - 2020 Mattt (https://mat.tt)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 
 */
NS_SWIFT_NAME(StringInflector)
__attribute__((objc_subclassing_restricted))
@interface TTTStringInflector : NSObject

/**
 Returns a shared instance of the default inflector,
 which is initialized with standard pluralization rules for the `en-US` locale.
 */
@property(readonly, class, strong) TTTStringInflector *defaultInflector;

///=========================
/// @name Inflecting Strings
///=========================

/**
 Singularizes a given string according to the provided rules.

 @param string The string to singularize.
 */
- (NSString *)singularize:(NSString *)string;

/**
 Pluralizes a given string according to the provided rules.

 @param string The string to pluralize.
 */
- (NSString *)pluralize:(NSString *)string;

///===================
/// @name Adding Rules
///===================

/**
 Adds a singularization rule.

 @param rule A regular expression pattern on which to match plural expressions.
 @param replacement The replacement pattern used to substitute matches with their singularized form.
 */
- (void)addSingularRule:(NSString *)rule
        withReplacement:(NSString *)replacement
    NS_SWIFT_NAME(addSingularRule(_:replacement:));

/**
 Adds a pluralization rule.

 @param rule A regular expression pattern on which to match singular expressions.
 @param replacement The replacement pattern used to substitute matches with their pluralized form.
 */
- (void)addPluralRule:(NSString *)rule
      withReplacement:(NSString *)replacement
    NS_SWIFT_NAME(addPluralRule(_:replacement:));

/**
 Adds an irregular plural rule.

 @param singular The singular form.
 @param plural The irregular plural form.
 */
- (void)addIrregularWithSingular:(NSString *)singular
                          plural:(NSString *)plural
    NS_SWIFT_NAME(addIrregular(singular:plural:));

/**
 Adds an uncountable plural rule.

 @param word The uncountable word.
 */
- (void)addUncountable:(NSString *)word;

@end

NS_ASSUME_NONNULL_END
