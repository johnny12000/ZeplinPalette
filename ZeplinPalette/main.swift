//
//  main.swift
//  ZeplinPalette
//
//  Created by Nikola Ristic on 1/5/18.
//  Copyright © 2018 fr. All rights reserved.
//

import Foundation
import AppKit

var programArguments: String = ""
var colorFileName: String = ""
var paletteFileName: String = ""
var tokens: [Token] = []
var colors: [String: NSColor] = [:]
var resultCode: Int = 0
var resultText: String = ""

func writeError(_ str: String) {
    if let data = str.data(using: String.Encoding.utf8) {
        FileHandle.standardError.write(data)
    }
}

func parseArguments() {
    guard CommandLine.arguments.count == 3 else {
        writeError("Argument number is invalid")
        exit(EXIT_FAILURE)
    }
    colorFileName = CommandLine.arguments[1]
    paletteFileName = CommandLine.arguments[2]
}

// 1. Read file
func readFile() {
    print("read file")
}
// 2. Tokenize it
func tokenize() {
    print("tokenize")
}
// 3. Simplify it
func simplify() {
    print("simplify")
}

// 4. Parse colors
func parseColors() {
    print("parse")
}
// 5. Write colors
func writeColors() {
    print("write")
}
// 6. Inform user
func informUser() {
    print("inform")
}

parseArguments()
readFile()
tokenize()
simplify()
parseColors()
writeColors()
informUser()
