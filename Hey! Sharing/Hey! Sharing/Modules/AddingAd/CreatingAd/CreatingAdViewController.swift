//
//  CreatingAdViewController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.04.2021.
//

import UIKit

class CreatingAdViewController: UIViewController {

	var presenter: CreatingAdPresenter?
	let addingSerivce: AddingService = RestAddingService()

	private let productImageView = UIImageView()
	let scrollView = UIScrollView()
	private let productNameTextField: RoundedTextField = {
		let textField = RoundedTextField()
		textField.placeholder = "Название"
		return textField
	}()

	private let productPriceTextField: RoundedTextField = {
		let textField = RoundedTextField()
		textField.placeholder = "Цена"
		return textField
	}()

	private let categoryTextField: RoundedTextField = {
		let textField = RoundedTextField()
		textField.placeholder = "Категория"
		return textField
	}()
	private let categoryPicker = UIPickerView()

	private let forPeriodTextField: RoundedTextField = {
		let textField = RoundedTextField()
		textField.placeholder = "За период"
		return textField
	}()
	private let forPeriodPicker = UIPickerView()

	private let addressTextField: RoundedTextField = {
		let textField = RoundedTextField()
		textField.placeholder = "Адрес"
		return textField
	}()
	private let addressPicker = UIPickerView()

	private let descriptionTextView: RoundedTextView = {
		let textView = RoundedTextView()
		textView.text = "Описание"
		textView.textColor = .lightGray
		return textView
	}()

	private let saveButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .purple
		button.setTitle("Сохранить", for: .normal)
		button.layer.cornerRadius = 22
		button.titleLabel?.textColor = .white
		button.titleLabel?.textAlignment = .center
		button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
		return button
	}()

	private let addresses = ["Деревня Универсиады 5", "Кремлёвская 35", "Оренбургский тракт 10"]
	private let periods = ["В день", "В неделю", "В месяц"]

	override func viewDidLoad() {
		super.viewDidLoad()

		setup()
	}

	private func setup() {
		view.backgroundColor = .white

		view.addSubview(scrollView)
		scrollView.snp.makeConstraints { make in
			make.leading.trailing.bottom.equalToSuperview()
			make.top.equalTo(view.safeAreaLayoutGuide)
		}

		scrollView.addSubview(productImageView)
		productImageView.snp.makeConstraints { make in
			make.width.equalToSuperview()
			make.top.equalToSuperview()
			make.centerX.equalToSuperview()
			make.height.equalTo(productImageView.snp.width).dividedBy(1.5)
		}
		let tapGestureRecognizer = UITapGestureRecognizer()
		tapGestureRecognizer.addTarget(self, action: #selector(choosePictureButtonTapped))
		productImageView.isUserInteractionEnabled = true
		productImageView.addGestureRecognizer(tapGestureRecognizer)
		if #available(iOS 13.0, *) {
			productImageView.backgroundColor = .secondarySystemFill
		} else {
			productImageView.backgroundColor = UIColor(displayP3Red: 233 / 255, green: 233 / 255, blue: 235 / 255, alpha: 1)
		}

		view.addSubview(productNameTextField)
		productNameTextField.snp.makeConstraints { make in
			make.top.equalTo(productImageView.snp.bottom).offset(10)
			make.centerX.equalToSuperview()
			make.width.equalToSuperview().multipliedBy(0.9)
			make.height.equalTo(44)
		}
		productNameTextField.delegate = self

		view.addSubview(categoryTextField)
		categoryTextField.snp.makeConstraints { make in
			make.top.equalTo(productNameTextField.snp.bottom).offset(10)
			make.centerX.equalToSuperview()
			make.width.equalToSuperview().multipliedBy(0.9)
			make.height.equalTo(44)
		}
		categoryPicker.delegate = self
		categoryPicker.dataSource = self
		categoryTextField.inputView = categoryPicker

		view.addSubview(productPriceTextField)
		productPriceTextField.snp.makeConstraints { make in
			make.top.equalTo(categoryTextField.snp.bottom).offset(10)
			make.centerX.equalToSuperview()
			make.width.equalToSuperview().multipliedBy(0.9)
			make.height.equalTo(44)
		}
		productPriceTextField.keyboardType = .numberPad

		view.addSubview(forPeriodTextField)
		forPeriodTextField.snp.makeConstraints { make in
			make.top.equalTo(productPriceTextField.snp.bottom).offset(10)
			make.centerX.equalToSuperview()
			make.width.equalToSuperview().multipliedBy(0.9)
			make.height.equalTo(44)
		}
		forPeriodTextField.delegate = self
		forPeriodPicker.delegate = self
		forPeriodPicker.dataSource = self
		forPeriodTextField.inputView = forPeriodPicker

		view.addSubview(addressTextField)
		addressTextField.snp.makeConstraints { make in
			make.top.equalTo(forPeriodTextField.snp.bottom).offset(10)
			make.centerX.equalToSuperview()
			make.width.equalToSuperview().multipliedBy(0.9)
			make.height.equalTo(44)
		}
		addressPicker.delegate = self
		addressPicker.dataSource = self
		addressTextField.inputView = addressPicker

		view.addSubview(descriptionTextView)
		descriptionTextView.snp.makeConstraints { make in
			make.top.equalTo(addressTextField.snp.bottom).offset(10)
			make.centerX.equalToSuperview()
			make.width.equalToSuperview().multipliedBy(0.9)
			make.height.equalTo(100)
		}
		descriptionTextView.delegate = self

		scrollView.addSubview(saveButton)
		saveButton.snp.makeConstraints { make in
			make.top.equalTo(descriptionTextView.snp.bottom).offset(10)
			make.centerX.equalToSuperview()
			make.width.equalToSuperview().multipliedBy(0.9)
			make.height.equalTo(44)
			make.bottom.equalToSuperview().offset(-10)
		}
	}

	@objc private func saveButtonTapped() {
		print(#function)
		guard let name = productNameTextField.text,
			  let image = productImageView.image,
			  let price = productPriceTextField.text,
			  let period = forPeriodTextField.text,
			  let category = categoryTextField.text,
			  let description = descriptionTextView.text,
			  let address = addressTextField.text else { return }

		guard !name.isEmpty, !price.isEmpty, !period.isEmpty, !period.isEmpty, !category.isEmpty, !description.isEmpty, !address.isEmpty else {
			return
		}

		let product = ProductAddingDto(
			name: name,
			image: image,
			price: price,
			forPeriod: period,
			category: category,
			description: description,
			address: address
		)

		addingSerivce.saveAd(product: product) { result in
			switch result {
			case .success:
                print("123")
			case .failure:
				print("err")
			}
		}
	}

	@objc private func choosePictureButtonTapped() {
		let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

		alert.addAction(UIAlertAction(title: "Сделать фото", style: .default, handler: {_ in
			self.loadPicture(fromLibrary: false)
		}))
		alert.addAction(UIAlertAction(title: "Выбрать из галереи", style: .default, handler: {_ in
			self.loadPicture(fromLibrary: true)
		}))

		alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

		self.present(alert, animated: true)
	}

	private func loadPicture(fromLibrary: Bool) {
		let picker = UIImagePickerController()
		picker.delegate = self
		if fromLibrary {
			picker.sourceType = .photoLibrary
		} else {
			picker.sourceType = .camera
		}
		present(picker, animated: true, completion: nil)
	}

    private func nameOf(category: String) -> String {
        switch category {
        case "Хобби и отдых":
            return "HOBBIES_AND_LEISURE"
        case "Все":
            return "ALL"
        case "Транспорт":
            return "VEHICLE"
        case "Бытовая техника":
            return "APPLIANCES"
        case "Электроника":
            return "ELECTRONICS"
        case "Мебель":
            return "FURNITURE"
        case "Одежда":
            return "CLOTHES"
        default:
            return ""
        }
    }
}

extension CreatingAdViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true, completion: nil)
	}

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		picker.dismiss(animated: true, completion: nil)

		guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
		productImageView.image = image
	}
}

extension CreatingAdViewController: UIPickerViewDataSource, UIPickerViewDelegate {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		if pickerView == forPeriodPicker {
			return periods.count
		}
		if pickerView == addressPicker {
			return addresses.count
		} else {
			return CategoryName.allCases.count
		}
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		if pickerView == forPeriodPicker {
			return periods[row]
		} else if pickerView == addressPicker {
			return addresses[row]
		} else {
			return CategoryName.allCases[row].rawValue
		}
	}

	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		if pickerView == forPeriodPicker {
			forPeriodTextField.text = periods[row]
		} else if pickerView == addressPicker {
			addressTextField.text = addresses[row]
		} else {
			categoryTextField.text = CategoryName.allCases[row].rawValue
		}
	}
}

extension CreatingAdViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}

extension CreatingAdViewController: UITextViewDelegate {
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor == UIColor.lightGray {
			textView.text = nil
			textView.textColor = UIColor.black
		}
	}

	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.isEmpty {
			textView.text = "Описание"
			textView.textColor = UIColor.lightGray
		}
	}
}
