//
//  HeaderTableViewCell.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 19/01/24.
//

import UIKit
class HeaderTableViewCell: UITableViewHeaderFooterView {
    lazy var titleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Prueba"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupHeader(title: String) {
        titleLabel.text = title
    }
}
extension HeaderTableViewCell: GeneralView {
    func setupView() {
        addSubviews()
        setupConstraints()
    }
    func addSubviews() {
        self.contentView.addSubview(titleLabel)
    }
    func setupConstraints() {
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16).isActive = true
    }
}
