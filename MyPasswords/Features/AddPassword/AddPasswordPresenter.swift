//
//  AddPasswordPresenter.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 21/01/24.
//  
//

import Foundation

class AddPasswordPresenter {
    var view: AddPasswordViewProtocol?
    var interactor: AddPasswordInteractorInputProtocol?
    var router: AddPasswordRouterProtocol?
}
extension AddPasswordPresenter: AddPasswordPresenterProtocol {
}
extension AddPasswordPresenter: AddPasswordInteractorOutputProtocol {
}
