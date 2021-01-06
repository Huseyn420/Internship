//
//  PromotionalOfferModel.swift
//  Internship
//
//  Created by Гусейн Агаев on 05.01.2021.
//

import Foundation

// MARK: - PromotionalOfferModel
struct PromotionalOfferModel: Codable {
    
    // MARK: - Element
    struct Element: Codable {
        
        // MARK: - Public Properties
        
        let id: String
        let title: String
        let description: String?
        let icon: [String: String]
        let price: String
        let isSelected: Bool
    }
    
    // MARK: - Result
    struct Result: Codable {
        
        // MARK: - Public Properties
        
        let title: String
        let actionTitle: String
        let selectedActionTitle: String
        let list: [Element]
    }

    // MARK: - Public Properties
    
    let status: String
    let result: Result
}
