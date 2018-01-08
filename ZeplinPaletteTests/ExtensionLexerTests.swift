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
        var result = lexer.tokenize(input: example!)
        XCTAssert(result.count != 0)
    }

    func stringFromFile(_ filename: String) -> String? {
        guard let file = Bundle(for: ExtensionLexerTests.classForCoder())
            .url(forResource: filename, withExtension: "txt") else {
            return nil
        }
        let result = try? String(contentsOf: file)
        return result
    }

}
