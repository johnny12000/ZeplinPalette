//
//  ColorParser.swift
//  ZeplinPalette
//
//  Created by Nikola Ristic on 1/13/18.
//  Copyright © 2018 fr. All rights reserved.
//

import Foundation
import AppKit

class ColorParser {

    let colorDefinition: [Token] = [
        Token.class, Token.var, Token.identifier(""), Token.define, Token.varType("UIColor"), Token.parensOpen,
        Token.return, Token.varType("UIColor"), Token.parensOpen,
        Token.red, Token.define, Token.number(0), Token.comma,
        Token.green, Token.define, Token.number(0), Token.comma,
        Token.blue, Token.define, Token.number(0), Token.comma,
        Token.alpha, Token.define, Token.number(0), Token.parensClose,
        Token.parensClose ]

    func findColorDefinitions(_ list: [Token]) -> [NSColor] {
        let listEnd = list.count - colorDefinition.count
        guard listEnd > 0 else { return [] }
        var result: [NSColor] = []
        for i in 0...listEnd {
            let slice = list[i...(i + colorDefinition.count)]
            if isSliceColorDefinition(slice) {
                result.append(createColor(slice))
            }
        }
        return result
    }

    func isSliceColorDefinition(_ slice: ArraySlice<Token>) -> Bool {
        var result = true
        for index in 0...slice.count {
            result = result && slice[index].isTypeOf(colorDefinition[index])
            if !result { break }
        }
        return result
    }

    func createColor(_ slice: ArraySlice<Token>) -> NSColor {
        return NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 0)
    }

}
