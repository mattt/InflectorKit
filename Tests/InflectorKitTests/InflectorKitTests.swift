import XCTest
@testable import InflectorKit

final class InflectorKitTests: XCTestCase {
    func testSingularization() {
        XCTAssertEqual("people".singularized, "person")
        XCTAssertEqual("tomatoes".singularized, "tomato")
        XCTAssertEqual("matrices".singularized, "matrix")
        XCTAssertEqual("octopi".singularized, "octopus")
        XCTAssertEqual("fish".singularized, "fish")
    }

    func testPluralization() {
        XCTAssertEqual("person".pluralized, "people")
        XCTAssertEqual("tomato".pluralized, "tomatoes")
        XCTAssertEqual("matrix".pluralized, "matrices")
        XCTAssertEqual("octopus".pluralized, "octopi")
        XCTAssertEqual("fish".pluralized, "fish")
    }

    func testCustomPluralization() {
        let inflector = TTTStringInflector.default()
        inflector.addPluralRule(#"^i(Pod|Pad)( Mini)?$"#, withReplacement: #"i$1s$2"#)
        inflector.addIrregular(withSingular: "lol", plural: "lolz")
        inflector.addUncountable("Herokai")

        XCTAssertEqual("iPad Mini".pluralized, "iPads Mini")
        XCTAssertEqual("lol".pluralized, "lolz")
        XCTAssertEqual("Herokai".pluralized, "Herokai")
    }
}
