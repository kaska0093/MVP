//
//  ModuleBilder.swift
//  MVP_002
//
//  Created by Nikita Shestakov on 16.11.2023.
//

import UIKit

// сборщик
protocol AssemblyBuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?,  router: RouterProtocol) -> UIViewController
}

class AssemblyModelBuilder: AssemblyBuilderProtocol {

    func createMainModule(router: RouterProtocol) -> UIViewController {
        // внедрение зависимостей
        // создаются не внутри сущностей, а снаружи
        // делаем инъекцию извне
        let view = ViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkServise: networkService, router: router)//инжект снаружи для возможности тестирования
        // и SOLID так говорит
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
        view.presenter = presenter
        return view
    }
}

// навигация из Presentor в Presentor
