//
//  ClothesListAssemblyContainer.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import Swinject
import SwinjectStoryboard

final class ClothesListAssemblyContainer: Assembly {

	func assemble(container: Container) {
		container.register(ClothesListInteractor.self) { r in
            let interactor = ClothesListInteractor(service: r.resolve(ClothesServiceType.self))

			return interactor
		}

		container.register(ClothesListRouter.self) { (_, viewController: ClothesListViewController) in
			let router = ClothesListRouter()
			router.transitionHandler = viewController

			return router
		}

		container.register(ClothesListPresenter.self) { (r, viewController: ClothesListViewController) in
			let presenter = ClothesListPresenter()
			presenter.view = viewController
			presenter.interactor = r.resolve(ClothesListInteractor.self)
			presenter.router = r.resolve(ClothesListRouter.self, argument: viewController)

			return presenter
		}

		container.storyboardInitCompleted(ClothesListViewController.self) { r, viewController in
			viewController.output = r.resolve(ClothesListPresenter.self, argument: viewController)
		}
	}
}
