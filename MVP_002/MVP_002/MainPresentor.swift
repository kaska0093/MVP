//
//  MainPresentor.swift
//  MVP_002
//
//  Created by Nikita Shestakov on 16.11.2023.
//

import Foundation
// типо абстрактное view
//output protocol
protocol MainViewProtocol: AnyObject { // class - для слабой ссылки
    func sucsess() // метод отправки сообщений к View
    func failure(error: Error)
}
//input protocol
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkServise: NetworkServiceProtocol, router: RouterProtocol)
    // инициализотоор для захвата ссылки на view
    func getComments()
    var comments: [Comment]? { get set }
    func tapOntTheComment(comment: Comment?)
}

class MainPresenter: MainViewPresenterProtocol {

    
    weak var view: MainViewProtocol?
    let networkServise: NetworkServiceProtocol!
    // по сути для управления View и model
    var router: RouterProtocol?
    var comments: [Comment]?
    

    
    required init(view: MainViewProtocol, networkServise: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkServise = networkServise
        self.router = router
        getComments()
    }
    
    func tapOntTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
    
    func getComments() {
        networkServise.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.sucsess()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    } 
}
