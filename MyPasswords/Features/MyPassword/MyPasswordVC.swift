//
//  MyPasswordVC.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 20/01/24.
//  
//

import Foundation
import UIKit
import NutUtils
import Toast_Swift
class MyPasswordVC: UIViewController {
    var presenter: MyPasswordPresenterProtocol?
    var currentData: ListPasswordEntity = ListPasswordEntity()
    var showPassword: Bool = false
    lazy var titleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Title"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var userTextLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Usuario:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var userLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "user"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var passwordTextLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Contraseña:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var passwordLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var copyButton: UIButton = {
        var button: UIButton = UIButton()
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.addTarget(self, action: #selector(copyPasswordClipboard), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var copyUserButton: UIButton = {
        var button: UIButton = UIButton()
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.addTarget(self, action: #selector(copyUserClipboard), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //eye.slash
    //eye
    lazy var eyeButton: UIButton = {
        var button: UIButton = UIButton()
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
    }
    func getData() {
        presenter?.requestData()
    }
    @objc func copyUserClipboard() {
        Utils.copyClipboard(text: currentData.user)
        self.view.makeToast("Usuario Copiado")
    }
    @objc func copyPasswordClipboard() {
        Utils.copyClipboard(text: currentData.password)
        self.view.makeToast("Contraseña Copiada")
    }
    @objc func togglePassword() {
        let password = currentData.password
        self.passwordLabel.text = showPassword ? password.secret(character: "*") : password
        let image = showPassword ? "eye" : "eye.slash"
        eyeButton.setImage(UIImage(systemName: image), for: .normal)
        showPassword = !showPassword
    }
}
extension MyPasswordVC: GeneralView {
    func setupView() {
        self.view.backgroundColor = .white
        self.addSubviews()
        self.setupConstraints()
    }
    func addSubviews() {
        self.view.addSubviews(titleLabel, userTextLabel, userLabel, copyUserButton, passwordTextLabel, passwordLabel, eyeButton, copyButton)
    }
    func setupConstraints() {
        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
        userTextLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 40).isActive = true
        userTextLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        userTextLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
        userLabel.topAnchor.constraint(equalTo: self.userTextLabel.bottomAnchor, constant: 8).isActive = true
        userLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        
        copyUserButton.centerYAnchor.constraint(equalTo: self.userLabel.centerYAnchor).isActive = true
        copyUserButton.leftAnchor.constraint(equalTo: self.userLabel.rightAnchor, constant: 16).isActive = true
        copyUserButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
        passwordTextLabel.topAnchor.constraint(equalTo: self.userLabel.bottomAnchor, constant: 16).isActive = true
        passwordTextLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        passwordTextLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
        passwordLabel.topAnchor.constraint(equalTo: self.passwordTextLabel.bottomAnchor, constant: 8).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        
        eyeButton.centerYAnchor.constraint(equalTo: self.passwordLabel.centerYAnchor).isActive = true
        eyeButton.leftAnchor.constraint(equalTo: self.passwordLabel.rightAnchor, constant: 16).isActive = true
        
        copyButton.centerYAnchor.constraint(equalTo: self.passwordLabel.centerYAnchor).isActive = true
        copyButton.leftAnchor.constraint(equalTo: self.eyeButton.rightAnchor, constant: 16).isActive = true
        copyButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
    }
}
/// Protocolo para recibir datos del presenter.
extension MyPasswordVC: MyPasswordViewProtocol {
    func showData(data: ListPasswordEntity) {
        currentData = data
        titleLabel.text = data.name
        passwordLabel.text = data.password.secret(character: "*")
        userLabel.text = data.user
    }
}
