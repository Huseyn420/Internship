//
//  PromotionalOfferCell.swift
//  Internship
//
//  Created by Гусейн Агаев on 05.01.2021.
//

import Foundation
import UIKit

final class PromotionalOfferCell: UICollectionViewCell {
    
    // MARK: - Public Properties

    let title = UILabel()
    let price = UILabel()
    let descriptionElement = UILabel()
    var checkMark = UIImageView()
    let icon = UIImageView()
    
    // MARK: - Private Properties
    
    private let containerView = UIView()
    
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        title.text = nil
        price.text = nil
        descriptionElement.text = nil
        checkMark.image = nil
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        icon.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 52).isActive = true
        icon.widthAnchor.constraint(equalTo: icon.heightAnchor).isActive = true
        
        checkMark.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        checkMark.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        checkMark.heightAnchor.constraint(equalToConstant: 20).isActive = true
        checkMark.widthAnchor.constraint(equalTo: checkMark.heightAnchor).isActive = true
        
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        containerView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15).isActive = true
        containerView.trailingAnchor.constraint(equalTo: checkMark.leadingAnchor, constant: -15).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        
        title.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        price.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        price.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        price.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        price.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        descriptionElement.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2).isActive = true
        descriptionElement.bottomAnchor.constraint(equalTo: price.topAnchor, constant: -5).isActive = true
        descriptionElement.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        descriptionElement.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        [containerView, icon, checkMark].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        [title, price, descriptionElement].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview($0)
        }
        
        icon.layer.masksToBounds = true
        icon.layer.cornerRadius = 26
        icon.contentMode = .scaleAspectFill
        
        title.numberOfLines = 2
        title.font = .boldSystemFont(ofSize: 20)
        price.font = .boldSystemFont(ofSize: 13)
        descriptionElement.font = .systemFont(ofSize: 11)
        descriptionElement.numberOfLines = 0
        
        checkMark.tintColor = UIColor.ApplicationСolor.checkMark
        backgroundColor = UIColor.ApplicationСolor.interfaceUnit
        title.textColor = UIColor.ApplicationСolor.textColor
        price.textColor = UIColor.ApplicationСolor.textColor
        descriptionElement.textColor = UIColor.ApplicationСolor.textColor
        
        title.minimumScaleFactor = 0.5
        title.adjustsFontSizeToFitWidth = true
    }
}

