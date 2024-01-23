//
//  AddPasswordVC.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 21/01/24.
//  
//

import Foundation
import UIKit

class AddPasswordVC: UIViewController {
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    var presenter: AddPasswordPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addPassword(_ sender: Any) {
        let name = nameTxt.text ?? ""
        let user = userTxt.text ?? ""
        let password = passwordTxt.text ?? ""
        let data = ListPasswordEntity(name: name, user: user, password: password)
        CoreDataManager.shared.savePassword(password: data)
    }
}
/// Protocolo para recibir datos del presenter.
extension AddPasswordVC: AddPasswordViewProtocol {
}
