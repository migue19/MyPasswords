//
//  MyPasswordInteractor.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 20/01/24.
//  
//

class MyPasswordInteractor {
    var presenter: MyPasswordInteractorOutputProtocol?
    var data: ListPasswordEntity?
}
extension MyPasswordInteractor: MyPasswordInteractorInputProtocol {
    func getData() {
        guard let data = data else {
            return
        }
        presenter?.sendData(data: data)
    }
}
