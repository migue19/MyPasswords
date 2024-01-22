//
//  ListPasswordVC.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 19/01/24.
//
import UIKit
class ListPasswordVC: UIViewController {
    var presenter: ListPasswordPresenterProtocol?
    lazy var tableView: UITableView = {
        var tableView: UITableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: "HeaderTableViewCell")
        tableView.register(TitleViewCell.self, forCellReuseIdentifier: "TitleViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    var passwords: [ListPasswordEntity] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
    }
    func getData() {
        presenter?.requestData()
    }
    func setupNavigation() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addPassword))
        navigationItem.rightBarButtonItem = addButton
    }
    @objc func addPassword() {
        presenter?.tapAddPassword()
    }
}
extension ListPasswordVC: GeneralView {
    func setupView() {
        self.view.backgroundColor = .white
        addSubviews()
        setupConstraints()
        setupNavigation()
    }
    func addSubviews() {
        self.view.addSubview(tableView)
    }
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
extension ListPasswordVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell
        header?.setupHeader(title: "Mis Contraseñas")
        return header
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let password = passwords[indexPath.row]
        self.presenter?.tapPassword(data: password)
    }
}
extension ListPasswordVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passwords.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleViewCell") as? TitleViewCell else {
            return UITableViewCell()
        }
        let password = passwords[indexPath.row]
        cell.setupCell(title: password.name)
        return cell
    }
}
extension ListPasswordVC: ListPasswordViewProtocol {
    func showData(data: [ListPasswordEntity]) {
        passwords = data
        tableView.reloadData()
    }
}
