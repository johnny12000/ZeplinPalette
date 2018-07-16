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
var fileContents: String = ""

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
    if let fileURL = FileManager.default.url(forUbiquityContainerIdentifier: colorFileName) {
        do {
            fileContents = try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            writeError("Could not read file \(colorFileName)")
            exit(EXIT_FAILURE)
        }
    } else {
        writeError("Could not find file \(colorFileName)")
        exit(EXIT_FAILURE)
    }
}

// 2. Tokenize it
func tokenize() {
    let lexer = ExtensionLexer()
    tokens = lexer.tokenize(input: fileContents)
    tokens = lexer.simplify(tokens: tokens)
}

// 3. Simplify it
func simplify() {
    print("simplify")
}

// 4. Parse colors
func parseColors() {
    let parser = ColorParser()
    let colrs = parser.findColorDefinitions(tokens)
    for colr in colrs {
        colors[colr.description] = colr
    }
    print("parse")
}

// 5. Write colors
func writeColors() {
    let palette = PaletteHelper()
    let list = palette.createList(paletteFileName)
    _ = palette.populateList(list, colors: colors)
    _ = palette.writeList(list, name: paletteFileName)
    print("write")
}

// 6. Inform user
func informUser() {
    print("inform")
    writeError("Color list created")
    exit(EXIT_SUCCESS)
}

parseArguments()
readFile()
tokenize()
simplify()
parseColors()
writeColors()
informUser()
