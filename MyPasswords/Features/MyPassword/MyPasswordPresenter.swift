//
//  MyPasswordPresenter.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 20/01/24.
//  
//

import Foundation

class MyPasswordPresenter {
    var view: MyPasswordViewProtocol?
    var interactor: MyPasswordInteractorInputProtocol?
    var router: MyPasswordRouterProtocol?
}
extension MyPasswordPresenter: MyPasswordPresenterProtocol {
    func requestData() {
        interactor?.getData()
    }
}
extension MyPasswordPresenter: MyPasswordInteractorOutputProtocol {
    func sendData(data: ListPasswordEntity) {
        view?.showData(data: data)
    }
}
