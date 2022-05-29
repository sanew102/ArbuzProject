//
//  DateCell.swift
//  Arbuz
//
//  Created by Нурым Нагиметов on 28.05.2022.
//

import UIKit

typealias DateCellConfigurator = TableCellConfigurator<DateCell, String>

class DateCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = String

    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        let minDate = calendar.date(byAdding: components, to: currentDate)!
        components.day = 9
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        picker.minimumDate = minDate
        picker.maximumDate = maxDate
        return picker
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(datePicker)
        setupConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(data: String) {
        
    }
    
    private func setupConstraints() {
        datePicker.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
        }
    }
}


