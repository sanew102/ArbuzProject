//
//  TextFieldExtension.swift
//  Arbuz
//
//  Created by Нурым Нагиметов on 29.05.2022.
//

import Foundation
import UIKit
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
