//
//  ViewController.swift
//  MVP_001
//
//  Created by Nikita Shestakov on 15.11.2023.
//

import UIKit
// 1 этап - действия пользователя
class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ticketLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.viewOutpuDelegate?.getRandomCount()
    }
    
    private var count = 0
    private var testData: [Crypto] = []
    private let presenter = Presenter() //1
    weak private var viewOutpuDelegate: ViewOutputDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewInputDelegate(viewInputDelegate: self) //1
        self.viewOutpuDelegate = presenter
        self.viewOutpuDelegate?.getData()
    }


}

extension ViewController: ViewInputDelegate {
    func setupInitialState() { //1
        displayData(i: count)
    }
    
    func setupData(with testData: [Crypto]) { //1
        self.testData = testData
    }
    
    func displayData(i: Int) { //1
        if testData.count >= 0 && count <= (testData.count - 1) && count >= 0 {
            nameLabel.text = testData[i].name
            ticketLabel.text = testData[i].ticket
            valueLabel.text = String(testData[i].value)
        } else {
            print("Sorry. No data")
        }
    }
    
    
}

