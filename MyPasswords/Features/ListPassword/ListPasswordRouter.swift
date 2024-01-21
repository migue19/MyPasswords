//
//  ListPasswordRouter.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 20/01/24.
//

import Foundation
class ListPasswordRouter {
    var view: ListPasswordVC
    private var presenter: ListPasswordPresenter
    private var interactor: ListPasswordInteractor
    init() {
        self.view = ListPasswordVC()
        self.presenter = ListPasswordPresenter()
        self.interactor = ListPasswordInteractor()
        view.presenter = self.presenter
        presenter.interactor = self.interactor
        presenter.view = self.view
        interactor.presenter = self.presenter
        presenter.router = self
    }
}
extension ListPasswordRouter: ListPasswordRouterProtocol {
    func showPassword(data: ListPasswordEntity) {
        let myPassword = MyPasswordRouter(data: data)
        self.view.navigationController?.pushViewController(myPassword.view, animated: true)
    }
}
