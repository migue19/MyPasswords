//
//  MyPasswordVC.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 20/01/24.
//  
//

import Foundation
import UIKit

class MyPasswordVC: UIViewController {
    var presenter: MyPasswordPresenterProtocol?
    lazy var titleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Contraseña"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
    }
    func getData() {
        presenter?.requestData()
    }
}
extension MyPasswordVC: GeneralView {
    func setupView() {
        self.view.backgroundColor = .white
        self.addSubviews()
        self.setupConstraints()
    }
    func addSubviews() {
        self.view.addSubview(titleLabel)
    }
    func setupConstraints() {
        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
    }
}
/// Protocolo para recibir datos del presenter.
extension MyPasswordVC: MyPasswordViewProtocol {
    func showData(data: ListPasswordEntity) {
        titleLabel.text = data.name
    }
}
