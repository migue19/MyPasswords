//
//  ListPasswordViewController.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 19/01/24.
//
import UIKit
class ListPasswordViewController: UIViewController {
    let interactor = ListPasswordInteractor()
    @IBOutlet weak var tableView: UITableView!
    var passwords: [ListPasswordEntity] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        getData()
    }
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    func getData() {
        passwords = interactor.getPasswords()
        tableView.reloadData()
    }
}
extension ListPasswordViewController: UITableViewDelegate {
}
extension ListPasswordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passwords.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
