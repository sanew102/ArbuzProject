//
//  Watermelon.swift
//  Arbuz
//
//  Created by Нурым Нагиметов on 29.05.2022.
//

import UIKit

typealias WatermelonCellConfigurator = TableCellConfigurator<Watermelon, String>

class Watermelon: UITableViewCell, ConfigurableCell {
    
    typealias DataType = String
    
    var array = [String]()
    
    let rowTF: UITextField = {
        let rowTF = UITextField()
        rowTF.placeholder = " Ряд"
        rowTF.layer.borderWidth = 1
        rowTF.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        rowTF.layer.cornerRadius = 15
        rowTF.setLeftPaddingPoints(16)
        rowTF.addTarget(self, action: #selector(teftFieldEdition),for: .editingChanged)
        return rowTF
    }()
    
    let columnTF: UITextField = {
        let columnTF = UITextField()
        columnTF.placeholder = " Грядка"
        columnTF.layer.borderWidth = 1
        columnTF.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        columnTF.layer.cornerRadius = 15
        columnTF.setLeftPaddingPoints(16)
        columnTF.addTarget(self, action: #selector(teftFieldEdition),for: .editingChanged)
        return columnTF
    }()
    
    let checkButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.setTitle("Проверить", for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 0.5)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(checkButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(rowTF)
        stack.addArrangedSubview(columnTF)
        stack.addArrangedSubview(checkButton)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.layer.cornerRadius = 15
        label.text = "    Описание арбуза"
        label.numberOfLines = 0
        return label
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var countStack: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(minusButton)
        stack.addArrangedSubview(countLabel)
        stack.addArrangedSubview(plusButton)
        stack.layer.cornerRadius = 15
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.backgroundColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 1)
        return stack
    }()
    
    let isSlicedSwitch: UISwitch = {
        let sliced = UISwitch()
        return sliced
    }()
    
    let slicedLabel: UILabel = {
        let label = UILabel()
        label.text = "   Порезать дольками"
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 1
        label.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(stackView, descriptionLabel, countStack, isSlicedSwitch, slicedLabel)
        selectionStyle = .none
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: String) {
    }
    
    @objc func teftFieldEdition() {
        if (rowTF.text!.isNumber && columnTF.text!.isNumber) == true {
            checkButton.isEnabled = true
            checkButton.backgroundColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 1)
        }
        else {
            checkButton.isEnabled = false
            checkButton.backgroundColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 0.5)
        }
    }
    
    @objc func checkButtonPressed() {
        var descriptionText = ""
        let randomNumberForState = Int.random(in: 1...3)
        switch randomNumberForState {
        case 1: descriptionText += "   Спелый"
        case 2: descriptionText += "  Не спелый"
        default: descriptionText += "  Уже сорван"
        }
        let randomNumberforWeight = Int.random(in: 5...15)
        descriptionText += " \(randomNumberforWeight) кг"
        descriptionLabel.text = descriptionText
    }
    
    @objc func minusButtonPressed() {
        if Int(countLabel.text!)! > 0 {
            var intCount = Int(countLabel.text!)!
            intCount -= 1
            countLabel.text = String(intCount)
            array.popLast()
        }
        descriptionLabel.text = array.joined(separator: ",")
    }
    @objc func plusButtonPressed() {
        if Int(countLabel.text!)! < 3 {
            var intCount = Int(countLabel.text!)!
            intCount += 1
            countLabel.text = String(intCount)
            array.append(descriptionLabel.text!)
        }
        descriptionLabel.text = array.joined(separator: ",")
    }
    
    private func setupConstraints() {
        rowTF.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        columnTF.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        checkButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(16)
            make.height.equalTo(50)
            make.leading.equalToSuperview()
        }
        countStack.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(16)
            make.leading.equalTo(descriptionLabel.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalToSuperview().dividedBy(3.1)
            make.trailing.equalToSuperview()
        }
        minusButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        plusButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        countLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        isSlicedSwitch.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        slicedLabel.snp.makeConstraints { make in
            make.leading.equalTo(isSlicedSwitch.snp.trailing).offset(16)
            make.height.equalTo(40)
            make.width.equalTo(190)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
        }
    }
}
