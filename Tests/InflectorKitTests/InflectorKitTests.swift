import XCTest
@testable import InflectorKit

final class InflectorKitTests: XCTestCase {
    func testSingularization() {
        XCTAssertEqual("people".singularized, "person")
        XCTAssertEqual("tomatoes".singularized, "tomato")
        XCTAssertEqual("matrices".singularized, "matrix")
        XCTAssertEqual("analyses".singularized, "analysis")
        XCTAssertEqual("octopi".singularized, "octopus")
        XCTAssertEqual("fish".singularized, "fish")
        XCTAssertEqual("police".singularized, "police")
    }

    func testPluralization() {
        XCTAssertEqual("person".pluralized, "people")
        XCTAssertEqual("tomato".pluralized, "tomatoes")
        XCTAssertEqual("matrix".pluralized, "matrices")
        XCTAssertEqual("octopus".pluralized, "octopi")
        XCTAssertEqual("fish".pluralized, "fish")
        XCTAssertEqual("police".pluralized, "police")
        XCTAssertEqual("cow".pluralized, "cows")
    }

    func testStringInflector() {
        let inflector = StringInflector.default
        inflector.addSingularRule(#"^(MacBook)s (Pro|Air)?$"#, replacement: #"$1 $2"#)
        inflector.addPluralRule(#"^i(Pod|Pad)( Mini)?$"#, replacement: #"i$1s$2"#)
        inflector.addIrregular(singular: "lol", plural: "lolz")
        inflector.addUncountable("Herokai")

        XCTAssertEqual("MacBooks Air".singularized, "MacBook Air")
        XCTAssertEqual("iPad Mini".pluralized, "iPads Mini")
        XCTAssertEqual("lol".pluralized, "lolz")
        XCTAssertEqual("Herokai".pluralized, "Herokai")
    }
}
