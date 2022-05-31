//
//  CellConfigurator.swift
//  Arbuz
//
//  Created by Нурым Нагиметов on 28.05.2022.
//

import Foundation
import UIKit

protocol CellConfigurator {
    static var reuseId: String { get }
    static var cellClass: AnyClass { get }
    func configure(cell: UIView)
}

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    
    static var reuseId: String { return CellType.reuseIdentifier }
    static var cellClass: AnyClass { return CellType.self }
    
    var item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    func setItem(item: DataType) {
        self.item = item
    }
    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item)
    }
    
}
