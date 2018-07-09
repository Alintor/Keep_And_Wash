//
//  ClothesListPresenter.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import DTModelStorage

final class ClothesListPresenter {

    // MARK: - Properties

    weak var view: ClothesListViewInput! {
        didSet {
            // Configure view out
            view.viewIsReady = { [weak self] in
                self?.view.setupInitialState()
            }
            view.viewDidAppear = { [weak self] in
                self?.reloadData()
            }
            view.dataSourceIsReady = { [weak self] dataSource in
                self?.dataSource = dataSource
            }
            view.showLaundryIcons = { [weak self] in
                self?.router.openLaundryIcons()
            }
        }
    }
    var interactor: ClothesListInteractorInput!
    var router: ClothesListRouterInput!
    
    // MARK: - Private
    
    private var dataSource: MemoryStorage!
    
    private func reloadData() {
        dataSource.setItems(interactor.allClothes.map({
            ClothesListViewModel(
                withModel: $0,
                actionClosure: { [weak self] (action, model) in
                    switch action {
                    case .mark:
                        var model = model.model
                        model.isDirty = !model.isDirty
                        self?.interactor.updateClothes(model)
                        self?.reloadData()
                    case .edit:
                        // TODO:
                        break
                    case .delete:
                        self?.interactor.deleteClothes(model.model)
                        self?.reloadData()
                    }
            })
        }))
    }
}

// MARK: - ClothesListModuleInput

extension ClothesListPresenter: ClothesListModuleInput {

}
