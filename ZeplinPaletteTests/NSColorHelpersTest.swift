//
//  NSColorHelpersTest.swift
//  ZeplinPaletteTests
//
//  Created by Nikola Ristic on 1/14/18.
//  Copyright © 2018 fr. All rights reserved.
//

import XCTest

class NSColorHelpersTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCreateColor() {
        let colorDefinition: [Token] = [
            Token.class, Token.var, Token.identifier("testColor"),
            Token.define, Token.varType("UIColor"), Token.parensOpen,
            Token.return, Token.varType("UIColor"), Token.parensOpen,
            Token.red, Token.define, Token.number(0.5), Token.comma,
            Token.green, Token.define, Token.number(0.4), Token.comma,
            Token.blue, Token.define, Token.number(0.1), Token.comma,
            Token.alpha, Token.define, Token.number(1.0), Token.parensClose,
            Token.parensClose ]
        let slice: ArraySlice<Token> = colorDefinition[0...colorDefinition.count-1]

        let result = NSColor(slice: slice)
        XCTAssertEqual(result.redComponent, 0.5, accuracy: 0.01)
        XCTAssertEqual(result.greenComponent, 0.4, accuracy: 0.01)
        XCTAssertEqual(result.blueComponent, 0.1, accuracy: 0.01)
        XCTAssertEqual(result.alphaComponent, 1.0, accuracy: 0.01)
    }

}
