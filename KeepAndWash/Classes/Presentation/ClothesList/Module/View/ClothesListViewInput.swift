//
//  ClothesListViewInput.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import DTModelStorage

protocol ClothesListViewInput: class {

    // MARK: - View out

    var output: ClothesListModuleInput? { get set }
    var viewIsReady: (() -> Void)? { get set }
    var viewDidAppear: (() -> Void)? { get set }
    var dataSourceIsReady: ((_ dataSource: MemoryStorage) -> Void)? { get set }
    var itemSelected: ((_ item: ClothesListViewModel) -> Void)? { get set }
    var showLaundryIcons: (() -> Void)? { get set }

    // MARK: - View in

    func setupInitialState()
}
