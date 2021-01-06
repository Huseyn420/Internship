//
//  PromotionalOfferView.swift
//  Internship
//
//  Created by Гусейн Агаев on 05.01.2021.
//

import UIKit

class PromotionalOfferView: UIViewController {
    
    // MARK: - Private Properties
    
    private let screenTitle = UILabel()
    private let closeButton = UIButton(type: .system)
    private let selectButton = UIButton(type: .system)
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let identifier = "PromotionalOffersCollectionView"

    private var data: PromotionalOfferModel?
    private var checkMark: Int?
    
    // MARK: - Public Properties
    
    var presenter: PromotionalOfferScreenPresenter?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods

    private func setup() {
        let configuration = UIImage.SymbolConfiguration(weight: .bold)
        
        screenTitle.font = .boldSystemFont(ofSize: 25)
        screenTitle.textColor = UIColor.ApplicationСolor.textColor
        screenTitle.numberOfLines = 0
        
        collectionView.backgroundColor = UIColor.ApplicationСolor.background
        collectionView.register(PromotionalOfferCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        closeButton.tintColor = UIColor.ApplicationСolor.tintClose
        closeButton.setImage(UIImage(systemName: "xmark", withConfiguration: configuration), for: .normal)
        closeButton.isUserInteractionEnabled = false
        
        selectButton.backgroundColor = UIColor.ApplicationСolor.buttonBackground
        selectButton.tintColor = UIColor.ApplicationСolor.buttonText
        selectButton.layer.cornerRadius = 5
        selectButton.layer.masksToBounds = true
        selectButton.addTarget(self, action: #selector(didTapSelectButton), for: .touchUpInside)
        
        [closeButton, screenTitle, collectionView, selectButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        screenLayout()
    }
    
    private func screenLayout() {
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor).isActive = true
        
        screenTitle.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 30).isActive = true
        screenTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        screenTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        screenTitle.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        selectButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        selectButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: screenTitle.bottomAnchor, constant: 20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: selectButton.topAnchor, constant: -20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}



// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension PromotionalOfferView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Public Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.result.list.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? PromotionalOfferCell,
              let cellData = data?.result.list[indexPath.row] else {
            fatalError("Cell should be not nil")
        }
        
        if indexPath.row == checkMark {
            cell.checkMark.image = UIImage(systemName: "checkmark.circle.fill")
        }
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        cell.title.text = cellData.title
        cell.price.text = cellData.price
        cell.descriptionElement.text = cellData.description
        cell.icon.downloadImage(urlString: cellData.icon.first?.value ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        checkMark =  checkMark != indexPath.row ? indexPath.row : nil
        collectionView.reloadData()
    }
}



// MARK: - UICollectionViewDelegateFlowLayout
extension PromotionalOfferView: UICollectionViewDelegateFlowLayout {
    
    // MARK: - Public Methods
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let description = data?.result.list[indexPath.row].description else {
            return CGSize(width: collectionView.frame.width, height: 83)
        }
        
        let size = CGSize(width: collectionView.frame.width - 125, height: collectionView.frame.height)
        let height = estimateFrameForText(description, kegel: 11, size: size).height + 83
        return CGSize(width: collectionView.frame.width, height: height)
    }
    
    // MARK: - Private Methods
    
    private func estimateFrameForText(_ text: String, kegel: CGFloat, size: CGSize) -> CGRect {
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: kegel)], context: nil)
    }
}



// MARK: - PromotionalOfferScreenView
extension PromotionalOfferView: PromotionalOfferScreenView {
    
    // MARK: - Public Methods
    
    func dataRefresh(dataReceived: PromotionalOfferModel) {
        for (index, element) in dataReceived.result.list.enumerated() {
            if element.isSelected == true {
                checkMark = index
                break
            }
        }
        
        data = dataReceived
        screenTitle.text = data?.result.title
        selectButton.setTitle(data?.result.selectedActionTitle, for: .normal)
        collectionView.reloadData()
    }
    
    // MARK: - Private Methods
    
    @objc
    private func didTapSelectButton() {
        guard let checkMark = checkMark, let title = data?.result.list[checkMark].title else {
            presenter?.didTapSelectButton(selectedItem: "Продолжить без изменений")
            return
        }
        
        presenter?.didTapSelectButton(selectedItem: title)
    }
}
