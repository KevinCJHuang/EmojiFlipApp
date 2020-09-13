//
//  Array+Identifiable.swift
//  MyEmojiFlipGame
//
//  Created by Kevin Huang on 2020-09-12.
//  Copyright © 2020 Chengjie Huang. All rights reserved.
//

import Foundation


extension Array where Element: Identifiable {
    func findIndex(lookingFor: Element) -> Int {
        for i in 0..<self.count {
            if self[i].id == lookingFor.id {
                return i
            }
        }
        return -1;
    }
}
