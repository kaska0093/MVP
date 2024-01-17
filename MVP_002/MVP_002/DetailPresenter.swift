//
//  DetailPresenter.swift
//  MVP_002
//
//  Created by Nikita Shestakov on 22.11.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func startComment()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {

    

    
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    let networkServise: NetworkServiceProtocol!
    // по сути для управления View и model
    var comment: Comment?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkServise = networkService
        self.comment = comment
        self.router = router
    }
    
    func startComment() {
        self.view?.setComment(comment: comment)
    }
    
    func tap() {
        router?.popToRoot()
    }
    
    
}
