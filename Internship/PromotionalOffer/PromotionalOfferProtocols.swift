//
//  PromotionalOfferProtocols.swift
//  Internship
//
//  Created by Гусейн Агаев on 05.01.2021.
//

import Foundation
import UIKit

protocol PromotionalOfferScreenView: class {
    var presenter: PromotionalOfferScreenPresenter? { get set }
    func dataRefresh(dataReceived: PromotionalOfferModel)
}

protocol PromotionalOfferScreenPresenter {
    var view: PromotionalOfferScreenView? { get set }
    var interactor: PromotionalOfferScreenInteractor? { get set }
    var router: PromotionalOfferScreenWireframe? { get set }
    
    func viewDidLoad()
    func didTapSelectButton(selectedItem: String)
    func displayErrorMessage(message: String)
}

protocol PromotionalOfferScreenWireframe {
    var view: UIViewController? { get set }
    
    func successAlert(_ alertTitle: String)
    func errorAlert(_ alertMessage: String)
}

protocol PromotionalOfferScreenInteractor {
    var presenter: PromotionalOfferScreenPresenter? { get set }
    func getData() -> PromotionalOfferModel?
}

