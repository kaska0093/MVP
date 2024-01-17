//
//  DetailViewController.swift
//  MVP_002
//
//  Created by Nikita Shestakov on 22.11.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var commentlabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    @IBAction func tapAction(_ sender: Any) {
        presenter.tap()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentlabel.numberOfLines = 0
        presenter.startComment()
        //вызов presenter после загрузки VC
    }
}

extension DetailViewController: DetailViewProtocol {
    
    func setComment(comment: Comment?) {
        commentlabel.text = comment?.body
    }
    
    
}
