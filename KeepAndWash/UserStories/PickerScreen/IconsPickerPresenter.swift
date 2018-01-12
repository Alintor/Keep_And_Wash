
protocol IconsPickerOutput {
    func setIcons(_ icons:[LaundryIcon])
}

class IconsPickerPresenter: PickerPresenter {
    
    struct IconsPickerState {
        let icon: LaundryIcon
        var viewModel:PickerViewModel
    }
    
    let service:LaundryIconService
    weak var view:PickerView?
    var router:PickerRouter?
    var output:IconsPickerOutput?
    var state = [IconsPickerState]()
    
    init(service:LaundryIconService, intitialIcons:[LaundryIcon]?, output:IconsPickerOutput?) {
        self.service = service
        self.output = output
        state = getState(intitialIcons: intitialIcons)
    }
    
    func getState(intitialIcons:[LaundryIcon]?) -> [IconsPickerState] {
        var state = [IconsPickerState]()
        let icons = service.getAllIcons()
        
        for icon in icons {
            let isChoosen = intitialIcons?.contains(where: { $0.id == icon.id }) ?? false
            state.append(IconsPickerState(icon: icon,
                                          viewModel: PickerViewModel(title: nil,
                                                                     imageName: icon.imageName,
                                                                     hexColor: "",
                                                                     isChoosen: isChoosen)))
        }
        
        return state
        
    }
    
    func attach(view: PickerView) {
        self.view = view
        view.setTitle(Constants.Labels.iconsPickerTitle)
        view.setViewModels(state.map({ $0.viewModel }))
    }
    
    func buttonTapped() {
        output?.setIcons(state.filter { $0.viewModel.isChoosen == true }.map { $0.icon })
        router?.closeModule()
    }
    
    func itemTapped(index: Int) {
        let viewModel = state[index].viewModel
        state[index].viewModel = PickerViewModel(title: viewModel.title,
                                            imageName: viewModel.imageName,
                                            hexColor: viewModel.hexColor,
                                            isChoosen: !viewModel.isChoosen)
        view?.setViewModels(state.map({ $0.viewModel }))
    }
    
}
