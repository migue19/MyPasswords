//
//  AddPasswordRouter.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 21/01/24.
//  
//

class AddPasswordRouter {
    var view: AddPasswordVC
    private var presenter: AddPasswordPresenter
    private var interactor: AddPasswordInteractor
    init() {
        self.view = AddPasswordVC()
        self.presenter = AddPasswordPresenter()
        self.interactor = AddPasswordInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension AddPasswordRouter: AddPasswordRouterProtocol {
}
