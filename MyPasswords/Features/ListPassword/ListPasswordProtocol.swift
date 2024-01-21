//
//  ListPasswordProtocol.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 20/01/24.
//

import Foundation
/// Protocolo que define los métodos y atributos para el Presenter de MyPassword
/// VIEW -> PRESENTER
protocol ListPasswordPresenterProtocol {
    func requestData()
    func tapPassword(data: ListPasswordEntity)
}
/// Protocolo que define los métodos y atributos para el Interactor de MyPassword
/// PRESENTER -> INTERACTOR
protocol ListPasswordInteractorInputProtocol {
    func getData()
}
/// Protocolo que define los métodos y atributos para el Interactor de MyPassword
/// INTERACTOR -> PRESENTER
protocol ListPasswordInteractorOutputProtocol {
    func sendData(data: [ListPasswordEntity])
}
/// Protocolo que define los métodos y atributos para el view de MyPassword
/// PRESENTER -> VIEW
protocol ListPasswordViewProtocol {
    func showData(data: [ListPasswordEntity])
}
/// Protocolo que define los métodos y atributos para el routing de MyPassword
/// PRESENTER -> ROUTING
protocol ListPasswordRouterProtocol {
    func showPassword(data: ListPasswordEntity)
}
