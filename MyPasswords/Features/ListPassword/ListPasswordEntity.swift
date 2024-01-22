//
//  ListPasswordEntity.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 19/01/24.
//
import Foundation
struct ListPasswordEntity {
    let name: String
    let user: String
    let password: String
    init() {
        self.name = ""
        self.user = ""
        self.password = ""
    }
    init(name: String, user: String, password: String) {
        self.name = name
        self.user = user
        self.password = password
    }
}
