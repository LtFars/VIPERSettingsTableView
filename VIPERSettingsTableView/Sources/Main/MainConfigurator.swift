//
//  MainConfigurator.swift
//  VIPERSettingsTableView
//
//  Created by Denis Snezhko on 03.11.2021.
//

class MainConfigurator: MainConfiguratorProtocol {
        
    func configure(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
