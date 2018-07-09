//
//  LaundryIconsListAssemblyContainer.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import Swinject
import SwinjectStoryboard

final class LaundryIconsListAssemblyContainer: Assembly {

	func assemble(container: Container) {
		container.register(LaundryIconsListInteractor.self) { r in
			let interactor = LaundryIconsListInteractor()

			return interactor
		}

		container.register(LaundryIconsListRouter.self) { (_, viewController: LaundryIconsListViewController) in
			let router = LaundryIconsListRouter()
			router.transitionHandler = viewController

			return router
		}

		container.register(LaundryIconsListPresenter.self) { (r, viewController: LaundryIconsListViewController) in
			let presenter = LaundryIconsListPresenter()
			presenter.view = viewController
			presenter.interactor = r.resolve(LaundryIconsListInteractor.self)
			presenter.router = r.resolve(LaundryIconsListRouter.self, argument: viewController)

			return presenter
		}

		container.storyboardInitCompleted(LaundryIconsListViewController.self) { r, viewController in
			viewController.output = r.resolve(LaundryIconsListPresenter.self, argument: viewController)
		}
	}
}
