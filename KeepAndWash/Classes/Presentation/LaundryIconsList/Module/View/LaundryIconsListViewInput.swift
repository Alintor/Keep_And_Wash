//
//  LaundryIconsListViewInput.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import DTModelStorage

protocol LaundryIconsListViewInput: class {

    // MARK: - View out

    var output: LaundryIconsListModuleInput? { get set }
    var viewIsReady: (() -> Void)? { get set }
    var dataSourceIsReady: ((_ dataSource: MemoryStorage) -> Void)? { get set }

    // MARK: - View in

    func setupInitialState()
}
