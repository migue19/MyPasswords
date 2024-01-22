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
        let passwords: [ListPasswordEntity] = [
            ListPasswordEntity(name: "Google", user: "miguelmexicano18@gmail.com", password: "%3e,!6J<U=Klp^>)I5XE"),
            ListPasswordEntity(name: "Apple", user: "miguelmexicano18@gmail.com", password: "mf.UG@7o!Q8DM2oXKA6JdiLv")
        ]
        return passwords
    }
}
extension ListPasswordInteractor: ListPasswordInteractorInputProtocol {
    func getData() {
        presenter?.sendData(data: getPasswords())
    }
}
