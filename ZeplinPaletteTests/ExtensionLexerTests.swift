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
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        let example = stringFromFile("ExtensionExample")
        
        let lexer = ExtensionLexer()
        
    }

    func stringFromFile(_ filename:String) -> String?
    {
        let file = Bundle(for: ExtensionLexerTests.classForCoder())
            .url(forResource: filename, withExtension: "txt")!
        let result = try? String(contentsOf: file)
        return result
    }
    
}
