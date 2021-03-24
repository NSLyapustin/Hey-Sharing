//
//  MarketViewController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 01.03.2021.
//

import UIKit

protocol MarketPresenter {
	
}

class MarketViewController: UIViewController, Storyboarded, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
	}


    weak var coordinator: MarketCoordinator?
	let searchController = UISearchController(searchResultsController: nil)
	private var productCollectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = "Найти"
		navigationItem.searchController = searchController
		definesPresentationContext = true
		
		setup()
    }

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 100
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath)
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: self.view.frame.width / 2 - 11,
			   height: self.view.frame.width / 2 - 5)
	}

	func setup() {
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

//		categoryCollectionView.snp.makeConstraints { make in
//			make.top.equalTo(view.safeAreaLayoutGuide)
//			make.leading.equalToSuperview().offset(5)
//			make.trailing.equalToSuperview().inset(5)
//			make.height.equalTo(35)
//		}
//		categoryCollectionView.backgroundColor = .white

		productsCollectionView.snp.makeConstraints { make in
			make.bottom.equalToSuperview()
			make.top.equalTo(view.safeAreaLayoutGuide)
			make.leading.equalToSuperview().offset(5)
			make.trailing.equalToSuperview().inset(5)
		}
		productsCollectionView.backgroundColor = .white
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		guard let header = collectionView.dequeueReusableSupplementaryView(
			ofKind: UICollectionView.elementKindSectionHeader,
			withReuseIdentifier: CategoryCollectionView.identifier,
				for: indexPath) as? CategoryCollectionView else { fatalError() }
		header.awakeFromNib()
		return header
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		CGSize(width: view.frame.width, height: 55)
	}
}
