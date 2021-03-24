//
//  ProfileViewController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 01.03.2021.
//

import UIKit
import SnapKit

protocol ProfilePresenter: AnyObject {
    var products: [Product] { get set }
    func loadData()
}

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, Storyboarded {
	var presenter: ProfilePresenter?
    weak var coordinator: ProfileCoordinator?
    let profileService = ProfileServiceMock()

    let tableView = UITableView()
    let productCellId = "ProductCellId"
	let headerCellId = "HeaderCellId"

    var products: [Product] = []

    override func viewDidLoad() {
		super.viewDidLoad()

		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(ProductCell.self, forCellReuseIdentifier: productCellId)
		tableView.register(ProfileHeaderCell.self, forCellReuseIdentifier: headerCellId)
		tableView.rowHeight = UITableView.automaticDimension
		configure()
    }

    func set(products: [Product]) {
		self.products = products
		tableView.reloadData()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		products.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: headerCellId, for: indexPath) as? ProfileHeaderCell else { fatalError("Cannot deque cell") }
			return cell
		}

		guard let cell = tableView.dequeueReusableCell(withIdentifier: productCellId, for: indexPath) as? ProductCell else { fatalError("Cannot deque cell") }
		cell.product = products[indexPath.row - 1]
		return cell
    }

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 {
			return 170
		}

		return 76
	}

	private func configure() {
		navigationController?.navigationBar.backgroundColor = UIColor.themeColor

		view.addSubview(tableView)
		tableView.snp.makeConstraints { make in
			make.bottom.equalTo(view.snp.bottom)
			make.leading.equalTo(view.snp.leading)
			make.trailing.equalTo(view.snp.trailing)
			make.top.equalTo(view.snp.top)
		}
    }
}
