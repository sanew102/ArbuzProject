//
//  Destination.swift
//  Arbuz
//
//  Created by Нурым Нагиметов on 28.05.2022.
//

import UIKit
typealias DestinationCellConfigurator = TableCellConfigurator<Destination, String>

class Destination: UITableViewCell, ConfigurableCell {
    
    typealias DataType = String
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "car")
        return image
    }()
    
    let title: UILabel = {
        let title = UILabel()
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: String) {
        title.text = data
    }
    
    private func setupViews() {
        selectionStyle = .none
        contentView.addSubview(image)
        contentView.addSubview(title)
        accessoryType = .disclosureIndicator
    }
    
    private func setupConstraints() {
        image.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        title.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(24)
            make.height.equalTo(150)
        }
    }

}
