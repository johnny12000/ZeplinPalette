//
//  ExtensionLexerTests.swift
//  ZeplinPaletteTests
//
//  Created by Nikola Ristic on 1/6/18.
//  Copyright © 2018 fr. All rights reserved.
//

import XCTest
@testable import ZeplinPalette

class ExtensionLexerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTokenize() {
        let example = stringFromFile("ExtensionExample")
        let lexer = ExtensionLexer()
        let result = lexer.tokenize(input: example!)
        XCTAssert(result.count != 0)
    }

    func testSimplify() {
        let colorDefinition: [Token] = [
            Token.class, Token.var, Token.identifier("testColor"), Token.define,
            Token.varType("UIColor"), Token.parensOpen,
            Token.return, Token.varType("UIColor"), Token.parensOpen,
            Token.red, Token.define, Token.number(0.5), Token.divide, Token.number(2), Token.comma,
            Token.green, Token.define, Token.number(0.4), Token.comma,
            Token.blue, Token.define, Token.number(0.1), Token.comma,
            Token.alpha, Token.define, Token.number(1.0), Token.parensClose,
            Token.parensClose ]
        let lexer = ExtensionLexer()
        let result = lexer.simplify(tokens: colorDefinition)
        XCTAssert(result[11].numberValue() == 0.25)
        XCTAssert(result[12].isTypeOf(.comma))
    }

    // MARK: - Helper methods

    func stringFromFile(_ filename: String) -> String? {
        guard let file = Bundle(for: ExtensionLexerTests.classForCoder())
            .url(forResource: filename, withExtension: "txt") else {
            return nil
        }
        let result = try? String(contentsOf: file)
        return result
    }

}
