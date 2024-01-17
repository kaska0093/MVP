//
//  Presenter.swift
//  MVP_001
//
//  Created by Nikita Shestakov on 15.11.2023.
//

import Foundation
// не зависит от UIKit (за исключением возможно UIImaageView)
// выполняет логику

class Presenter {
    // держит ссылку
    weak private var viewInputDelegate: ViewInputDelegate? //1
    var testdata = Crypto.testData //1
    func setViewInputDelegate(viewInputDelegate: ViewInputDelegate) { //1
        self.viewInputDelegate = viewInputDelegate
    }
    
    private func loadTsetData() {
        self.viewInputDelegate?.setupData(with: self.testdata)
        //self.viewInputDelegate?.displayData(i: 0)
    }
    
    private func random() {
        let randomCount = Int.random(in: 0 ..< testdata.count)
        self.viewInputDelegate?.displayData(i: randomCount)
    }
}
extension Presenter: ViewOutputDelegate {
    func getRandomCount() {
        random()
    }
    func getData() {
        self.loadTsetData()
        self.viewInputDelegate?.setupInitialState()
    }
    
    func saveData() {
        
    }
    
    
}
