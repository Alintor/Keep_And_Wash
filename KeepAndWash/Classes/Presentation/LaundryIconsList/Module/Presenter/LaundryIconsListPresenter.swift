//
//  LaundryIconsListPresenter.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import DTModelStorage

final class LaundryIconsListPresenter {

    // MARK: - Properties

    weak var view: LaundryIconsListViewInput! {
        didSet {
            // Configure view out
            view.viewIsReady = { [weak self] in
                self?.view.setupInitialState()
            }
            view.dataSourceIsReady = { [weak self] dataSource in
                self?.dataSource = dataSource
                self?.reloadData()
            }
        }
    }
    var interactor: LaundryIconsListInteractorInput!
    var router: LaundryIconsListRouterInput!
    
    // MARK: - Private
    
    private var dataSource: MemoryStorage!
    
    private func reloadData() {
        dataSource.setItems(interactor.allIcons.map({ LaundryIconsViewModel(with: $0) }))
    }
}

// MARK: - LaundryIconsListModuleInput

extension LaundryIconsListPresenter: LaundryIconsListModuleInput {

}
