//
//  ExtensionLexer.swift
//  ZeplinPalette
//
//  Created by Nikola Ristic on 1/6/18.
//  Copyright © 2018 fr. All rights reserved.
//

import Foundation

enum Token {
    case Define
    case Identifier(String)
    case Number(Float)
    case ParensOpen
    case ParensClose
    case Comma
    case Other(String)
}

class ExtensionLexer {
    
    typealias TokenGenerator = (String) -> Token?
    
    let tokenList: [(String, TokenGenerator)] = [
        ("[ \t\n]", { _ in nil }),
        ("[a-zA-Z][a-zA-Z0-9]*", { $0 == "def" ? .Define : .Identifier($0) }),
        ("[0-9.]+", { (r: String) in .Number((r as NSString).floatValue) }),
        ("\\(", { _ in .ParensOpen }),
        ("\\)", { _ in .ParensClose }),
        (",", { _ in .Comma }),
        ]
    
    
    func tokenize(input: String) -> [Token] {
        var tokens = [Token]()
        var content = input
        
        while (content.count > 0) {
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
                tokens.append(.Other(String(content[..<index])))
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
