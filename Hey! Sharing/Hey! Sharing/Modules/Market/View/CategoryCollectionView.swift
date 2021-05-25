//
//  CategoryCollectionViewCell.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 22.03.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
	private let categoryLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 16)
		label.textAlignment = .center
		return label
	}()

	private let whiteView = UIView()

	private let categoryImageView: UIImageView = {
		let imgView = UIImageView()
		imgView.contentMode = .scaleAspectFill
		imgView.clipsToBounds = true
		return imgView
	}()

	func set(category: CategoryModel) {
		categoryLabel.text = category.name.rawValue
		categoryImageView.image = category.backgroundImage
	}

	override func layoutSubviews() {
		addSubview(categoryImageView)
		categoryImageView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
			make.center.equalToSuperview()
		}

		addSubview(categoryLabel)
		categoryLabel.snp.makeConstraints { make in
			make.center.equalToSuperview()
		}

		categoryImageView.addSubview(whiteView)
		whiteView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
		whiteView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)

		categoryImageView.layer.cornerRadius = 4
	}
}

class CategoryCollectionView: UICollectionReusableView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	static let identifier = "CategoryCollectionViewId"
	var presenter: MarketViewControllerPresenter?
	private var collectionView: UICollectionView?
	private let cellId = "categoryCell"

	override func awakeFromNib() {
		super.awakeFromNib()
		let categoryLayout = UICollectionViewFlowLayout()
		categoryLayout.scrollDirection = .horizontal
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: categoryLayout)
		guard let collectionView = collectionView else { return }
		collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
		collectionView.delegate = self
		collectionView.dataSource = self
		addSubview(collectionView)

		collectionView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
		collectionView.backgroundColor = .white
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return Category.categories.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: cellId,
			for: indexPath
		) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
		cell.set(category: Category.categories[indexPath.row])
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 150, height: 40)
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		presenter?.setProductsByCategory(category: Category.categories[indexPath.row].name)
	}
}
