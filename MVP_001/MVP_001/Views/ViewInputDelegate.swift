//
//  ViewInputDelegate.swift
//  MVP_001
//
//  Created by Nikita Shestakov on 15.11.2023.
//

import Foundation
// действие пользователя (View -> Presenter)
// реализует VC
// ссылку держит presenter

protocol ViewInputDelegate: AnyObject { //1
    // функции которые должны выполняться при взаимодействии с UI
    func setupInitialState()
    func setupData(with testData: [Crypto])
    func displayData(i: Int)
}
