//
//  DetailsViewController.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    
    var presenter: DetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        presenter?.viewDidLoad()
    }
    
    private func configureUi() {
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(didTapBack))
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
    
    @objc
    private func didTapBack() {
        dismiss(animated: true)
    }
}

extension DetailsViewController: DetailsViewProtocol {
    func setData(_ data: ImageDataModel) {
        guard let imageData = data.imageData else { return }
        let image = UIImage(data: imageData)
        mainImage.image = image
        title = data.downloadDate
    }
}



