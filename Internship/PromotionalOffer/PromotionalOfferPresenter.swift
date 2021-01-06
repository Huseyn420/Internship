//
//  PromotionalOfferPresenter.swift
//  Internship
//
//  Created by Гусейн Агаев on 05.01.2021.
//

import Foundation

final class PromotionalOfferPresenter: PromotionalOfferScreenPresenter {

    // MARK: - Public Properties
    
    weak var view: PromotionalOfferScreenView?
    var interactor: PromotionalOfferScreenInteractor?
    var router: PromotionalOfferScreenWireframe?
    
    // MARK: - Public Methods
    
    func viewDidLoad() {
        guard let data = interactor?.getData() else {
            return
        }
        
        view?.dataRefresh(dataReceived: data)
    }
    
    func didTapSelectButton(selectedItem: String) {
        router?.successAlert(selectedItem)
    }
    
    func displayErrorMessage(message: String) {
        router?.errorAlert(message)
    }
}
