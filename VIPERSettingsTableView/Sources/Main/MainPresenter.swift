//
//  MainPresenter.swift
//  VIPERSettingsTableView
//
//  Created by Denis Snezhko on 03.11.2021.
//
import Foundation

class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    var data: [Section] {
        didSet {
            print("Данные для таблицы в Презентере изменились, можно отправлять их во View")
            
            var countRows = [Int]()
            var coockedData = [[SettingsCellOption]]()
            for i in 0..<data.count {
                coockedData.append(data[i].option)
                countRows.append(data[i].option.count)
            }
            view.setupInputTableData(with: data, rows: countRows, sections: data.count, models: coockedData)
        }
    }
    
    required init(view: MainViewProtocol) {
        self.view = view
        data = [Section]()
    }
    
    // MARK: - MainPresenterProtocol methods

    func configureView() {
        print("Вью просит сконфигурировать ее у Презентера (первоначально)")
        print("Презентер просит данные у Интерактора")
        interactor.getRawDataForConfigureViewFromEntity()
    }
    
    func getDataFromInteractor(with data: [Section]) {
        print("Презентер получил данные у интерактора")
        self.data = data
    }
    
    func buttonRndDidPressed(with data: [Section]) {
        print("Презентер говорит интерактору что нужно зарандомить УЖЕ СУЩЕСТВУЮЩУЮ таблицу (передает данные Интерактору)")
        interactor.randomizeTableViewData(with: data)
    }
    
    func buttonUpdDidPressed() {
        print("Презентер просит данные у интерактора")
        interactor.getRawDataFromEntity()
    }
    
    func giveBackRandomizedData(with data: [Section]) {
        print("Презентер получил зарандомленные данные для таблицы")
        self.data = data
    }
}
