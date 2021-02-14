//
//  ListViewController.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import UIKit

class ListViewController: UIViewController {
    
    var presenter: ListPresenterProtocol?
    var collectionHandler: ListCollectionHandlerProtocol?
    var collectionView: UICollectionView!
    
    let modeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .systemGray
        label.alpha = 0.9
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        presenter?.viewDidLoad()
    }
    
    private func configureUi() {
        view.backgroundColor = .systemBackground
        
        let size = UIScreen.main.bounds.width / 2 - 10
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: size, height: size)
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.backgroundColor = .systemBackground
        
        view.addSubview(modeLabel)
        modeLabel.translatesAutoresizingMaskIntoConstraints = false
        modeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        modeLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        modeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        modeLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}

extension ListViewController: ListViewProtocol {
    func configureColletionView(_ handler: ListCollectionHandlerProtocol) {
        handler.attach(collectionView)
    }
    
    func setModeTitle(_ text: String) {
        modeLabel.text = text
    }
    
    func showDetails(data: ImageDataModel) {
        let viewController = DetailsViewController()
        let presenter = DetailsPresenter(view: viewController, data: data)
        viewController.presenter = presenter
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .automatic
        present(navigationController, animated: true)
    }

}

