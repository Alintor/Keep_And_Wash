

struct IconGroup {
    let category:LaundryIconCategory
    let icons:[LaundryIcon]
}

protocol LaundryIconsViewInput: class {
    func setIcons(_ icons:[IconGroup])
}

protocol LaundryIconsViewOutput {
    func attachView(_ view:LaundryIconsViewInput)
}

class LaundryIconsPresenter: LaundryIconsViewOutput {
    
    private let iconsService: LaundryIconService
    private weak var view:LaundryIconsViewInput?
    
    init(service:LaundryIconService) {
        iconsService = service
    }
    
    func attachView(_ view:LaundryIconsViewInput) {
        self.view = view
        updateIcons()
    }
    
    private func updateIcons() {
        var groupedIcons = [IconGroup]()
        let categories = iconsService.getIconsCategories()
        for category in categories {
            groupedIcons.append(IconGroup(category: category,
                                  icons: iconsService.getIconsFor(category: category)))
        }
        view?.setIcons(groupedIcons)
    }
}


