//
//  MainProtocols.swift
//  VIPERSettingsTableView
//
//  Created by Denis Snezhko on 03.11.2021.
//
//import UIKit

protocol MainViewProtocol: AnyObject {
    func setupInputTableData(with data: [Section], rows: [Int], sections: Int, models: [[SettingsCellOption]])
}

protocol MainPresenterProtocol: AnyObject {
    func configureView()
    func getDataFromInteractor(with data: [Section])
    func giveBackRandomizedData(with data: [Section])
    func buttonUpdDidPressed()
    func buttonRndDidPressed(with data: [Section])
}

protocol MainInteractorProtocol: AnyObject {
    func randomizeTableViewData(with data: [Section])
    func getRawDataFromEntity()
    func getRawDataForConfigureViewFromEntity()
}

protocol MainRouterProtocol: AnyObject {
    //func showAboutScene()
    //func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

protocol MainConfiguratorProtocol: AnyObject {
    func configure(with viewController: MainViewController)
}
