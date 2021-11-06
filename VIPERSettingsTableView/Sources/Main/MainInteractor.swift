//
//  MainInteractor.swift
//  VIPERSettingsTableView
//
//  Created by Denis Snezhko on 03.11.2021.
//

import Foundation

class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol!
    var entityData: SettingsModel?
    var data = [Section]() {
        didSet {
            print("В интеракторе изменились сырые данные. Можно отправлять в Presenter")
            presenter.getDataFromInteractor(with: data)
        }
    }
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        entityData = SettingsModel()
    }
    
    // MARK: - MainInteractorProtocol methods
    
    func getRawDataFromEntity() {
        print("Интерактор берет сырые данные из сущности")
        guard let data = entityData?.createOptions() else { return }
        self.data = data // !
    }
    
    func getRawDataForConfigureViewFromEntity() {
        print("Интерактор берет сырые данные из сущности когда Вью была загружена и попросила об этом презентера и тд...")
        guard let data = entityData?.createOptions() else { return }
        self.data = data
    }
    
    func randomizeTableViewData(with data: [Section]) {
        print("Интерактор получает команду от Презентера что нужно зарандомить полученные данные и рандомит их")
        var dataCopy = data
        for i in 0..<data.count {
            var indexes = [Int]()
            for j in 0..<data[i].option.count {
                var index = Int.random(in: 0..<data[i].option.count)
                while indexes.contains(index) {
                    index = Int.random(in: 0..<data[i].option.count)
                }
                indexes.append(index)
                dataCopy[i].option[j] = data[i].option[index]
            }
        }
        print("Интерактор отправляет зарандомленные данные Презентеру")
        presenter.giveBackRandomizedData(with: dataCopy)
    }
}
