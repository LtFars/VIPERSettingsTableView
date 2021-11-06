//
//  MainViewController.swift
//  VIPERSettingsTableView
//
//  Created by Denis Snezhko on 02.11.2021.
//
import UIKit

class MainViewController: UIViewController, MainViewProtocol {

    var presenter: MainPresenterProtocol!
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    var models = [Section]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    // !
    var countSections = Int()
    var countRows = [Int]()
    var modelsStructs = [[SettingsCellOption]]()
    
    //  MARK: - Elements
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var buttonRdm = createButton(with: "Randomize")
    private lazy var buttonUpd = createButton(with: "Reload")
    
    //  MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        setupHierarchy()
        setupLayout()
        setupView()
        presenter.configureView()
    }
    
    //  MARK: - Private functions
    
    private func setupHierarchy() {
        self.view?.addSubview(tableView)
        self.view?.addSubview(buttonRdm)
        self.view?.addSubview(buttonUpd)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            buttonRdm.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.size.width * 0.1),
            buttonRdm.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            buttonRdm.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            buttonRdm.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.30),
            
            buttonUpd.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.size.width * 0.1),
            buttonUpd.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            buttonUpd.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            buttonUpd.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.30)
        ])
        
    }
    
    private func setupView() {
        self.view?.backgroundColor = .systemBackground
        buttonRdm.addTarget(self, action: #selector(buttonRndDidPressed), for: .touchUpInside)
        buttonUpd.addTarget(self, action: #selector(buttonUpdDidPressed), for: .touchUpInside)
    }
    
    private func createButton(with name: String) -> UIButton {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.tintColor = .black
        button.backgroundColor = .cyan
        button.setTitle(name, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    // MARK: - Action methods
    
    func setupInputTableData(with data: [Section], rows: [Int], sections: Int, models: [[SettingsCellOption]]) {
        print("Данные пришли во View. Таблица обновлена")
        self.models = data
        self.countRows = rows
        self.countSections = sections
        self.modelsStructs = models
        tableView.reloadData()
    }
    
    @objc func buttonUpdDidPressed() {
        print("Пользователь нажал на кнопку Обновить таблицу. View сообщает презентеру об этом")
        presenter.buttonUpdDidPressed()
    }
    
    @objc func buttonRndDidPressed() {
        print("Пользователь нажал на кнопку Зарандомить таблицу. View сообщает презентеру об этом")
        presenter.buttonRndDidPressed(with: models)
    }
}

//  MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countRows[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modelsStructs[indexPath.section][indexPath.row]

        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model) //!
        return cell
    }
}

//  MARK: - UITableViewDataSource

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Была нажата ячейка \(modelsStructs[indexPath.section][indexPath.row].title)")
    }
}
