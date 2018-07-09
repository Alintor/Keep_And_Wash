//
//  LaundryIconsListInteractor.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import Foundation

final class LaundryIconsListInteractor {

}

// MARK: - LaundryIconsListInteractorInput

extension LaundryIconsListInteractor: LaundryIconsListInteractorInput {

    var allIcons: [LaundryIconsProtocol] {
        var icons = [LaundryIconsProtocol]()
        icons.append(contentsOf: WhiteningIcon.allValues)
        icons.append(contentsOf: DryingIcon.allValues)
        icons.append(contentsOf: IroningIcon.allValues)
        icons.append(contentsOf: CleaningIcon.allValues)
        icons.append(contentsOf: WhiteningIcon.allValues)
        return icons
    }
}
