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
}
extension HeaderTableViewCell: GeneralView {
    func setupView() {
    }
    func addSubviews() {
    }
    func setupConstraints() {
    }
}
