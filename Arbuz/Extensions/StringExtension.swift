//
//  StringExtension.swift
//  Arbuz
//
//  Created by Нурым Нагиметов on 29.05.2022.
//

import Foundation
extension String {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
