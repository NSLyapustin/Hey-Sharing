//
//  ProfileViewController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 01.03.2021.
//

import UIKit
import SnapKit

protocol ProfileViewControllerPresenter: AnyObject {
    var products: [Product] { get set }
    func loadData()
    func viewDidLoad()
	func moveToDetail(for productId: Int)
}

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, Storyboarded {
	var presenter: ProfileViewControllerPresenter?
    weak var coordinator: ProfileCoordinator?
    let profileService = ProfileServiceMock()

    let tableView = UITableView()
    let productCellId = "ProductCellId"
	let headerCellId = "HeaderCellId"
    var header = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 170))

    var products: [Product] = []

    override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.viewDidLoad()
		configureTableView()
    }

    @objc private func refreshData() {
		presenter?.loadData()
    }

    func setProducts(products: [Product]) {
		self.products = products
		tableView.reloadData()
    }

    func setIncome(income: Int) {
        header.income = income
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: productCellId, for: indexPath)
			as? ProfileProductCell else { fatalError("Cannot deque cell") }
		cell.product = products[indexPath.row]
		return cell
    }

	private func configureTableView() {
		navigationController?.navigationBar.backgroundColor = UIColor.themeColor

		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(ProfileProductCell.self, forCellReuseIdentifier: productCellId)
		tableView.tableHeaderView = header
		tableView.rowHeight = UITableView.automaticDimension
		tableView.refreshControl = UIRefreshControl()
		tableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
		view.addSubview(tableView)
		tableView.snp.makeConstraints { make in
			make.bottom.equalTo(view.snp.bottom)
			make.leading.equalTo(view.snp.leading)
			make.trailing.equalTo(view.snp.trailing)
			make.top.equalTo(view.snp.top)
		}
    }

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		presenter?.moveToDetail(for: products[indexPath.row].id)
	}
}
