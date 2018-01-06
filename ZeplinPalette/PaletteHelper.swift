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
    
    func populateList(_ list: NSColorList) -> NSColorList {
        return list
    }
    
    func writeList(_ list: NSColorList) {
        list.write(toFile:"result")
    }
    
}
