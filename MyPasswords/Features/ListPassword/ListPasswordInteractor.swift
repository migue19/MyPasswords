//
//  ListPasswordInteractor.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 19/01/24.
//

import Foundation
class ListPasswordInteractor {
    var presenter: ListPasswordInteractorOutputProtocol?
    func getPasswords() -> [ListPasswordEntity] {
        let passwords: [ListPasswordEntity] = CoreDataManager.shared.fetchData()
        return passwords
    }
}
extension ListPasswordInteractor: ListPasswordInteractorInputProtocol {
    func getData() {
        presenter?.sendData(data: getPasswords())
    }
}
