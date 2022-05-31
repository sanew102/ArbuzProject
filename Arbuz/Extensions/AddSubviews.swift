//
//  AddSubviews.swift
//  Arbuz
//
//  Created by Нурым Нагиметов on 28.05.2022.
//

import Foundation
import UIKit
extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}

