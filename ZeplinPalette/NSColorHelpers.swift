//
//  NSColorHelpers.swift
//  ZeplinPalette
//
//  Created by Nikola Ristic on 1/14/18.
//  Copyright © 2018 fr. All rights reserved.
//

import Foundation
import AppKit

extension NSColor {

    /// Creates new color instance from tokens slice.
    /// - parameter slice: Array slice
    convenience init(slice: ArraySlice<Token>) {
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
        self.init(calibratedRed: red, green: green, blue: blue, alpha: alpha)
    }

}
