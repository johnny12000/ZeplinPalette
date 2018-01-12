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
        for index in 0...slice.count-1 {
            result = result && slice[index].isTypeOf(colorDefinition[index])
            if !result { break }
        }
        return result
    }

    func createColor(_ slice: ArraySlice<Token>) -> NSColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        if let redInd = slice.index(where: { $0.isTypeOf(.red) })?.advanced(by: 2) {
            red = CGFloat(slice[redInd].numberValue())
        }
        if let greenInd = slice.index(where: { $0.isTypeOf(.green) })?.advanced(by: 2) {
            green = CGFloat(slice[greenInd].numberValue())
        }
        if let blueInd = slice.index(where: { $0.isTypeOf(.blue) })?.advanced(by: 2) {
            blue = CGFloat(slice[blueInd].numberValue())
        }
        if let alphaInd = slice.index(where: { $0.isTypeOf(.alpha) })?.advanced(by: 2) {
            alpha = CGFloat(slice[alphaInd].numberValue())
        }
        return NSColor(calibratedRed: red, green: green, blue: blue, alpha: alpha)
    }

}
