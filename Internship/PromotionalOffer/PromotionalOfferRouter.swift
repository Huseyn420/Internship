//
//  PromotionalOfferRouter.swift
//  Internship
//
//  Created by Гусейн Агаев on 05.01.2021.
//

import Foundation
import UIKit

class PromotionalOfferRouter: PromotionalOfferScreenWireframe {
    
    // MARK: - Public Properties
    
    weak var view: UIViewController?
    
    // MARK: - Public Methods
    
    static func assembleModule() -> UIViewController {
        let view = PromotionalOfferView()
        
        let presenter = PromotionalOfferPresenter()
        presenter.view = view
        view.presenter = presenter
        
        let interactor = PromotionalOfferInteractor()
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        let router = PromotionalOfferRouter()
        router.view = view
        presenter.router = router
        
        return view
    }
    
    func successAlert(_ alertTitle: String) {
        let alert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        DispatchQueue.main.async {
            self.view?.present(alert, animated: true, completion: nil)
        }
    }
    
    func errorAlert(_ alertMessage: String) {
        let alert = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        DispatchQueue.main.async {
            self.view?.present(alert, animated: true, completion: nil)
        }
    }
}
