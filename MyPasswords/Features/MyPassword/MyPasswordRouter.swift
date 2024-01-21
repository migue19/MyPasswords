//
//  MyPasswordRouter.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 20/01/24.
//  
//

class MyPasswordRouter {
    var view: MyPasswordVC
    private var presenter: MyPasswordPresenter
    private var interactor: MyPasswordInteractor
    init() {
        self.view = MyPasswordVC()
        self.presenter = MyPasswordPresenter()
        self.interactor = MyPasswordInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
    convenience init(data: ListPasswordEntity) {
        self.init()
        interactor.data = data
    }
}
extension MyPasswordRouter: MyPasswordRouterProtocol {
}
