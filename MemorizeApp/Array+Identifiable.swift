//
//  Array+Identifiable.swift
//  MemorizeApp
//
//  Created by Kyle Shal on 2021-03-19.
//

import Foundation


//extension to match identifiable things
extension Array where Element: Identifiable{
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
}
