//
//  ClientInfoCell.swift
//  Arbuz
//
//  Created by Нурым Нагиметов on 29.05.2022.
//

import UIKit
typealias ClientInfoCellConfigurator = TableCellConfigurator<ClientInfoCell, String>

class ClientInfoCell: UITableViewCell, ConfigurableCell {
    typealias DataType = String
    
    let nameTF: UITextField = {
        let nameTF = UITextField()
        nameTF.placeholder = " Имя пользователя"
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        nameTF.layer.cornerRadius = 15
        nameTF.setLeftPaddingPoints(16)
        nameTF.addTarget(self, action: #selector(teftFieldEdition),for: .editingChanged)
        return nameTF
    }()
    
    let emailTF: UITextField = {
        let emailTF = UITextField()
        emailTF.placeholder = " Введите почту"
        emailTF.layer.borderWidth = 1
        emailTF.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        emailTF.layer.cornerRadius = 15
        emailTF.setLeftPaddingPoints(16)
        emailTF.addTarget(self, action: #selector(teftFieldEdition),for: .editingChanged)
        return emailTF
    }()
    
    let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подтвердить заказ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.backgroundColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 0.5)
        button.layer.cornerRadius = 20
        button.isEnabled = false
        button.addTarget(self, action: #selector(orderButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(nameTF, emailTF, orderButton)
        selectionStyle = .none
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: String) {
    }
    
    @objc func orderButtonPressed() {
    }
    
    @objc func teftFieldEdition() {
        if !((nameTF.text?.isEmpty)!) && isValidEmail(emailTF.text!) {
            orderButton.isEnabled = true
            orderButton.backgroundColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 1)
        }
        else {
            orderButton.isEnabled = false
            orderButton.backgroundColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 0.5)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func setupConstraints() {
        nameTF.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            make.height.equalTo(50)
        }
        emailTF.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(nameTF.snp.bottom).offset(16)
            make.height.equalTo(50)
        }
        orderButton.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
