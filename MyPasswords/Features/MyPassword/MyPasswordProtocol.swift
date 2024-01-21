//
//  MyPasswordProtocol.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 20/01/24.
//  
//

/// Protocolo que define los métodos y atributos para el view de MyPassword
/// PRESENTER -> VIEW
protocol MyPasswordViewProtocol {
    func showData(data: ListPasswordEntity)
}
/// Protocolo que define los métodos y atributos para el routing de MyPassword
/// PRESENTER -> ROUTING
protocol MyPasswordRouterProtocol {
}
/// Protocolo que define los métodos y atributos para el Presenter de MyPassword
/// VIEW -> PRESENTER
protocol MyPasswordPresenterProtocol {
    func requestData()
}
/// Protocolo que define los métodos y atributos para el Interactor de MyPassword
/// PRESENTER -> INTERACTOR
protocol MyPasswordInteractorInputProtocol {
    func getData()
}
/// Protocolo que define los métodos y atributos para el Interactor de MyPassword
/// INTERACTOR -> PRESENTER
protocol MyPasswordInteractorOutputProtocol {
    func sendData(data: ListPasswordEntity)
}
