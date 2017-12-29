
import Foundation

protocol IconsView: NSObjectProtocol {
    func setIcons(_ icons:[LaundryIcon])
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
        let icons = iconsService.getAllIcons()
        view?.setIcons(icons)
        
    }
}
