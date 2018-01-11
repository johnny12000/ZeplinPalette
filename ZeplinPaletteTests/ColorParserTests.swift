//
//  ColorParserTests.swift
//  ZeplinPaletteTests
//
//  Created by Nikola Ristic on 1/13/18.
//  Copyright © 2018 fr. All rights reserved.
//

import XCTest
@testable import ZeplinPalette

class ColorParserTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIsSliceColorDefinition() {
        let colorDefinition: [Token] = [
            Token.class, Token.var, Token.identifier("testColor"), Token.define, Token.varType("UIColor"), Token.parensOpen,
            Token.return, Token.varType("UIColor"), Token.parensOpen,
            Token.red, Token.define, Token.number(0.5), Token.comma,
            Token.green, Token.define, Token.number(0.4), Token.comma,
            Token.blue, Token.define, Token.number(0.1), Token.comma,
            Token.alpha, Token.define, Token.number(1.0), Token.parensClose,
            Token.parensClose ]
        let slice: ArraySlice<Token> = colorDefinition[0...colorDefinition.count-1]
        
        let parser = ColorParser()
        let result = parser.isSliceColorDefinition(slice)
        XCTAssertTrue(result)
    }


}
