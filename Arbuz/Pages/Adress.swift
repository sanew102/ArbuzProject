//
//  Adres.swift
//  Arbuz
//
//  Created by Нурым Нагиметов on 28.05.2022.
//

import UIKit

class Adres: UIViewController {
    
    let cityTF: UITextField = {
        let cityTF = UITextField()
        cityTF.placeholder = " Город"
        cityTF.layer.borderWidth = 1
        cityTF.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        cityTF.layer.cornerRadius = 15
        cityTF.setLeftPaddingPoints(16)
        cityTF.addTarget(self, action: #selector(teftFieldEdition),for: .editingChanged)
        return cityTF
    }()
    
    let streetTF: UITextField = {
        let streetTF = UITextField()
        streetTF.placeholder = " Улица и номер дома"
        streetTF.layer.borderWidth = 1
        streetTF.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        streetTF.layer.cornerRadius = 15
        streetTF.setLeftPaddingPoints(16)
        streetTF.addTarget(self, action: #selector(teftFieldEdition),for: .editingChanged)
        return streetTF
    }()
    
    let flatTF: UITextField = {
        let flatTF = UITextField()
        flatTF.placeholder = " Квартира"
        flatTF.layer.borderWidth = 1
        flatTF.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        flatTF.layer.cornerRadius = 15
        flatTF.setLeftPaddingPoints(16)
        flatTF.addTarget(self, action: #selector(teftFieldEdition),for: .editingChanged)
        return flatTF
    }()
    
    let floarTF: UITextField = {
        let floarTF = UITextField()
        floarTF.placeholder = " Этаж"
        floarTF.layer.borderWidth = 1
        floarTF.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        floarTF.layer.cornerRadius = 15
        floarTF.setLeftPaddingPoints(16)
        floarTF.addTarget(self, action: #selector(teftFieldEdition),for: .editingChanged)
        return floarTF
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 0.5)
        button.setTitle("Подтвердить адрес", for: .normal)
        button.titleLabel?.textColor = UIColor(red: 48/255, green: 159/255, blue: 78/255, alpha: 1)
        button.isEnabled = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Adres")
        image.contentMode  = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews(cityTF, streetTF, flatTF, floarTF, button, image)
        setupConstraints()
    }
    
    @objc func teftFieldEdition() {
        let checkCityTf = cityTF.text?.isEmpty
        let checkStreetTF = streetTF.text?.isEmpty
        let checkFlatTF = flatTF.text?.isEmpty
        let checkFloarTF = floarTF.text?.isEmpty
        if !(checkCityTf! || checkStreetTF! || checkFlatTF! || checkFloarTF!) {
            button.isEnabled = true
            button.backgroundColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 1)
        }
        else {
            button.isEnabled = false
            button.backgroundColor = UIColor(red: 0/255, green: 204/255, blue: 0/255, alpha: 0.5)
        }
    }
    
    @objc func buttonPressed() {
        self.navigationController?.popViewController(animated: true)
        let adresName = streetTF.text
    }

    private func setupConstraints() {
        cityTF.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.height.equalTo(50)
        }
        streetTF.snp.makeConstraints { make in
            make.top.equalTo(cityTF.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        flatTF.snp.makeConstraints { make in
            make.top.equalTo(streetTF.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(50)
        }
        floarTF.snp.makeConstraints { make in
            make.top.equalTo(streetTF.snp.bottom).offset(16)
            make.leading.equalTo(flatTF.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(70)
        }
        image.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(floarTF.snp.bottom)
            make.bottom.equalTo(button.snp.top)
        }
    }
}

