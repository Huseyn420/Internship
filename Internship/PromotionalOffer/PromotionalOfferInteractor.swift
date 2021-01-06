//
//  PromotionalOfferInteractor.swift
//  Internship
//
//  Created by Гусейн Агаев on 05.01.2021.
//

import Foundation

final class PromotionalOfferInteractor: PromotionalOfferScreenInteractor {

    // MARK: - Private Properties
    
    private let filename = "DataReceived"
    
    // MARK: - Private Properties
    
    weak var view: PromotionalOfferScreenView?
    var presenter: PromotionalOfferScreenPresenter?

    // MARK: - Public Methods
    
    func getData() -> PromotionalOfferModel? {
        guard let data = loadJson(fileName: filename) else {
            return nil
        }
        
        return data
    }
    
    // MARK: - Private Methods
    
    private func loadJson(fileName: String) -> PromotionalOfferModel? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(PromotionalOfferModel.self, from: data)
                return jsonData
            } catch {
                presenter?.displayErrorMessage(message: error.localizedDescription)
            }
        } else {
            presenter?.displayErrorMessage(message: "Error while receiving data")
        }
        
        return nil
    }
}

