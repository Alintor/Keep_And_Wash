//
//  ClothesListRouter.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import LightRoute

final class ClothesListRouter {

    weak var transitionHandler: TransitionHandler!
}

// MARK: - ClothesListRouterInput

extension ClothesListRouter: ClothesListRouterInput {

    func openLaundryIcons() {
        try? transitionHandler.forStoryboard(
            factory: StoryboardFactory(storyboard: R.storyboard.laundryIconsList()),
            to: LaundryIconsListModuleInput.self
        )
        .to(preferred: .navigation(style: .push))
        .perform()
    }
}
