//
//  MarketViewController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 01.03.2021.
//

import UIKit

protocol MarketViewControllerPresenter: AnyObject {
    func viewDidLoad()
	func setProducts()
	func setProductsByCategory(category: CategoryName)
    func moveToDetailViewController(forProductWith id: Int)
    func addToFavorite(id: Int)
}

class MarketViewController: UIViewController {

	var presenter: MarketViewControllerPresenter?
	var products: [Product] = []
    weak var coordinator: MarketCoordinator?
	let searchController = UISearchController(searchResultsController: nil)
	var productCollectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
//        presenter?.viewDidLoad()
    }

	func setProducts(products: [Product]) {
		self.products = products
		productCollectionView?.reloadData()
	}

	func setup() {
		navigationController?.navigationBar.backgroundColor = .white
		view.backgroundColor = .white
		let productsLayout = UICollectionViewFlowLayout()
		productsLayout.scrollDirection = .vertical
		productCollectionView = UICollectionView(frame: .zero, collectionViewLayout: productsLayout)
		guard let productsCollectionView = productCollectionView else { return }
		productsCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "productCell")
		productCollectionView?.register(CategoryCollectionView.self,
										forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
										withReuseIdentifier: CategoryCollectionView.identifier)
		productsCollectionView.delegate = self
		productsCollectionView.dataSource = self
		view.addSubview(productsCollectionView)

		productsCollectionView.snp.makeConstraints { make in
			make.bottom.equalToSuperview()
			make.top.equalTo(view.safeAreaLayoutGuide)
			make.leading.equalToSuperview().offset(5)
			make.trailing.equalToSuperview().inset(5)
		}
		productsCollectionView.backgroundColor = .white
        productCollectionView?.refreshControl = UIRefreshControl()
        productCollectionView?.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Найти"
        navigationItem.searchController = searchController
        definesPresentationContext = true
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		guard let header = collectionView.dequeueReusableSupplementaryView(
			ofKind: UICollectionView.elementKindSectionHeader,
			withReuseIdentifier: CategoryCollectionView.identifier,
				for: indexPath) as? CategoryCollectionView else { fatalError() }
		header.awakeFromNib()
		header.presenter = presenter
		return header
	}

    @objc private func refreshData() {
        presenter?.setProducts()
    }
}

extension MarketViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
	}
}

extension MarketViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		products.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCollectionViewCell else { return ProductCollectionViewCell() }
		cell.product = products[indexPath.row]
        cell.addToFavorite = {
            self.presenter?.addToFavorite(id: self.products[indexPath.row].id)
        }
		return cell
	}
}

extension MarketViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		CGSize(width: view.frame.width, height: 55)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        #warning("content size in cell")
		return CGSize(width: self.view.frame.width / 2 - 11,
			   height: self.view.frame.width / 2 - 5)
	}
}

extension MarketViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		productCollectionView?.deselectItem(at: indexPath, animated: true)
        presenter?.moveToDetailViewController(forProductWith: indexPath.row)
	}
}
