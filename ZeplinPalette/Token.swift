//
//  Token.swift
//  ZeplinPalette
//
//  Created by Nikola Ristic on 1/14/18.
//  Copyright © 2018 fr. All rights reserved.
//

import Foundation

enum Token {
    case define
    case number(Float)
    case parensOpen
    case parensClose
    case comma
    case other(String)
    case `extension`
    case identifier(String)
    case `class`
    case `var`
    case varType(String?)
    case type
    case `return`
    case divide
    case red
    case green
    case blue
    case alpha

    /// Compares the type of the tokens.
    /// - parameter token: Token to compare
    /// returns: True if types are the same, otherwise false.
    func isTypeOf(_ token: Token) -> Bool {
        switch (self, token) {
        case (.number, .number),
             (.define, .define),
             (.parensOpen, .parensOpen),
             (.parensClose, .parensClose),
             (.comma, .comma),
             (.other, .other),
             (.extension, .extension),
             (.identifier, .identifier),
             (.class, .class),
             (.var, .var),
             (.varType, .varType),
             (.type, .type),
             (.return, .return),
             (.divide, .divide),
             (.red, .red),
             (.green, .green),
             (.blue, .blue),
             (.alpha, .alpha):
            return true
        default:
            return false
        }
    }

    /// Gets the number from the type
    /// returns: Float value from the token. 0 if token has no value.
    func numberValue() -> Float {
        switch self {
        case let .number(num):
            return num
        default:
            return 0
        }
    }
}
