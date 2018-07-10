//
//  PaletteHelperTests.swift
//  ZeplinPaletteTests
//
//  Created by Nikola Ristic on 7/10/18.
//  Copyright © 2018 fr. All rights reserved.
//

import XCTest

class PaletteHelperTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCreateList() {
        let helper = PaletteHelper()
        let result = helper.createList("test")
        XCTAssert(result.name?.rawValue == "test")
    }

    func testPopulateList() {
        let helper = PaletteHelper()
        let list = NSColorList(name: NSColorList.Name(rawValue: "test"))
        let result = helper.populateList(list, colors: ["col1": NSColor.black,
                                                        "col2": NSColor.red])
        XCTAssert(result.color(withKey: NSColor.Name(rawValue: "col1")) != nil)
        XCTAssert(result.color(withKey: NSColor.Name(rawValue: "col2")) != nil)
    }

    func testWriteList() {
        let helper = PaletteHelper()
        let list = NSColorList(name: NSColorList.Name(rawValue: "test"))
        let result = helper.writeList(list, name: NSHomeDirectory() + "/Documents/test.clr")
        XCTAssertTrue(result)
    }
}
