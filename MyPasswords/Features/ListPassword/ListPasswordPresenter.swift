//
//  ListPasswordPresenter.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 20/01/24.
//
import Foundation
class ListPasswordPresenter {
    var interactor: ListPasswordInteractorInputProtocol?
    var view: ListPasswordViewProtocol?
    var router: ListPasswordRouterProtocol?
}
extension ListPasswordPresenter: ListPasswordPresenterProtocol {
    func tapPassword(data: ListPasswordEntity) {
        router?.showPassword(data: data)
    }
    func requestData() {
        interactor?.getData()
    }
}
extension ListPasswordPresenter: ListPasswordInteractorOutputProtocol {
    func sendData(data: [ListPasswordEntity]) {
        view?.showData(data: data)
    }
}
