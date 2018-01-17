
import Foundation

struct IconGroup {
    let category:LaundryIconCategory
    let icons:[LaundryIcon]
}

protocol IconsView: NSObjectProtocol {
    func setIcons(_ icons:[IconGroup])
}

class LaundryIconsPresenter {
    
    private let iconsService: LaundryIconService
    private weak var view:IconsView?
    
    init(service:LaundryIconService = LaundryIconServiceImpl(), view:IconsView) {
        iconsService = service
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


