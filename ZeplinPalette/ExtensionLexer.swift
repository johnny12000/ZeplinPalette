//
//  ExtensionLexer.swift
//  ZeplinPalette
//
//  Created by Nikola Ristic on 1/6/18.
//  Copyright © 2018 fr. All rights reserved.
//

import Foundation

class ExtensionLexer {

    typealias TokenGenerator = (String) -> Token?

    let tokenList: [(String, TokenGenerator)] = [
        ("[ \t\n]", { _ in nil }),
        ("extension", { _ in .extension }),
        ("class", { _ in .class }),
        ("var", { _ in .var }),
        ("return", { _ in .return }),
        ("UIColor", { .varType($0) }),
        ("red", { _ in .red }),
        ("green", { _ in .green }),
        ("blue", { _ in .blue }),
        ("alpha", { _ in .alpha }),
        ("[a-zA-Z][a-zA-Z0-9]*", {
            return .identifier($0)
        }),
        ("[0-9.]+", { numberStr in .number(Float(numberStr) ?? 0) }),
        ("[\\(\\{]", { _ in .parensOpen }),
        ("[\\)\\}]", { _ in .parensClose }),
        (",", { _ in .comma }),
        (":", { _ in .define }),
        ("/", { _ in .divide })
        ]

    func tokenize(input: String) -> [Token] {
        var tokens = [Token]()
        var content = input

        while content.count > 0 {
            var matched = false

            for (pattern, generator) in tokenList {
                if let m = content.match(regex: pattern) {
                    if let t = generator(m) {
                        tokens.append(t)
                    }
                    let indx = content.index(content.startIndex, offsetBy: m.count)
                    content = String(content[indx...])
                    matched = true
                    break
                }
            }

            if !matched {
                let index = content.index(content.startIndex, offsetBy: 1)
                tokens.append(.other(String(content[..<index])))
                content = String(content[index...])
            }
        }
        return tokens
    }

}

var expressions = [String: NSRegularExpression]()
public extension String {
    public func match(regex: String) -> String? {
        let expression: NSRegularExpression
        if let exists = expressions[regex] {
            expression = exists
        } else {
            expression = try! NSRegularExpression(pattern: "^\(regex)", options: [])
            expressions[regex] = expression
        }

        let range = expression.rangeOfFirstMatch(in: self, options: [], range: NSMakeRange(0, self.utf16.count))
        if range.location != NSNotFound {
            return (self as NSString).substring(with: range)
        }
        return nil
    }
}
