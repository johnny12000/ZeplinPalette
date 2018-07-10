//
//  PaletteHelper.swift
//  ZeplinPalette
//
//  Created by Nikola Ristic on 1/6/18.
//  Copyright © 2018 fr. All rights reserved.
//

import Foundation
import AppKit

class PaletteHelper {

    func createList(_ name: String) -> NSColorList {
        return NSColorList(name: NSColorList.Name(name))
    }

    func populateList(_ list: NSColorList, colors: [String: NSColor]) -> NSColorList {
        for color in colors {
            list.setColor(color.value, forKey: NSColor.Name(rawValue: color.key))
        }
        return list
    }

    func writeList(_ list: NSColorList, name: String) -> Bool {
        let url = URL(fileURLWithPath: name)
        do {
            try list.write(to: url)
        } catch {
            return false
        }
        return true
    }

}
