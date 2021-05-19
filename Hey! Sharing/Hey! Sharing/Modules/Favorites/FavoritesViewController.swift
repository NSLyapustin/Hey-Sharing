//
//  FavoritesViewController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.05.2021.
//

import UIKit

class FavoritesViewController: UIViewController {
    var presenter: FavoritesPresenter?
    weak var coordinator: FavoritesCoordinator?

    let tableView = UITableView()
    let productCellId = "ProductCellId"
    let headerCellId = "HeaderCellId"

    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoriteProductCell.self, forCellReuseIdentifier: productCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.snp.top)
        }
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }

    func setProducts(products: [Product]) {
        self.products = products
        tableView.reloadData()
    }

    @objc private func refreshData() {
        presenter?.setProducts()
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.moveToDetailViewController(forProductWith: indexPath.row)
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: productCellId, for: indexPath) as? FavoriteProductCell else { fatalError("Cannot deque cell") }
        cell.product = products[indexPath.row]
        cell.deleteAction = {
            self.presenter?.removeFromFavorites(id: self.products[indexPath.row].id)
        }
        return cell
    }
}
