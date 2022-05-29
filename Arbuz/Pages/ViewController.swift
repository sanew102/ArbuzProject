//
//  ViewController.swift
//  Arbuz
//
//  Created by Нурым Нагиметов on 28.05.2022.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    private let items: [CellConfigurator] = [DestinationCellConfigurator(item: "Адрес доставки")]
    private let days: [CellConfigurator] = [DateCellConfigurator(item: "")]
    private let watermelonConf: [CellConfigurator] = [WatermelonCellConfigurator(item: "")]
    private let clientInfo: [CellConfigurator] = [ClientInfoCellConfigurator(item: "")]
    
    let myTableView: UITableView = {
        let table = UITableView()
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = 600
        view.addSubview(myTableView)
        setupConstrainst()
        setupNavigationBar()
        setupView()
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    private func setupView(){
        self.myTableView.separatorStyle = .none
        myTableView.estimatedRowHeight = 100
        myTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Оформление заказа"
    }
    
    private func setupConstrainst() {
        myTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: extension of UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: CellConfigurator
        switch indexPath.section {
        case 0: item = items[indexPath.row]
        case 1: item = days[indexPath.row]
        case 2: item = watermelonConf[indexPath.row]
        case 3: item = clientInfo[indexPath.row]
        default: item = items[indexPath.row]
        }
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        item.configure(cell: cell)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Адрес доставки"
        case 1: return "Дата доставки"
        case 2: return "Выбрать арбуз"
        case 3: return "Личные данные"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 8, y: 8, width: 320, height: 20)
        myLabel.font = UIFont.boldSystemFont(ofSize: 18)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        let headerView = UIView()
        headerView.addSubview(myLabel)
        return headerView
    }
}

//MARK: extension of UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && indexPath.section == 0 {
            navigationController?.pushViewController(Adres(), animated: true)       }
    }
}

