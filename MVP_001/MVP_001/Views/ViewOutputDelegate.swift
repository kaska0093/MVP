//
//  ViewOutputDelegate.swift
//  MVP_001
//
//  Created by Nikita Shestakov on 15.11.2023.
//

import Foundation
// действие пользователя (Presenter -> View)

// реализует presentor
// ссылку держит VC

protocol ViewOutputDelegate: AnyObject {
    func getData()
    func saveData()
    func getRandomCount()

}
