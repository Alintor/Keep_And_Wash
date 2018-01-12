
protocol ClothesTypePickerOutput: class {
    func setType(_ type:ClothesType)
}

class ClothesTypePickerPresenter: PickerViewOutput {
    
    struct ClothesTypePickerState {
        let type:ClothesType
        let viewModel:PickerViewModel
    }
    
    let service:ClothesService
    private weak var view:PickerViewInput?
    private weak var output:ClothesTypePickerOutput?
    private var state = [ClothesTypePickerState]()
    var router:PickerRouter?
    
    init(service:ClothesService, initialType:ClothesType?, output:ClothesTypePickerOutput?) {
        self.service = service
        self.output = output
        self.state = getViewModelsWith(initialType: initialType)
    }
    
    func getViewModelsWith(initialType:ClothesType?) -> [ClothesTypePickerState] {
        var state = [ClothesTypePickerState]()
        let types = service.getClothesTypes()
        for type in types {
            let isChoosen = type.id == initialType?.id
            state.append(ClothesTypePickerState(type: type,
                                                viewModel: PickerViewModel(title: type.title,
                                                                           imageName: type.imageName,
                                                                           hexColor: Constants.Colors.mainColor.hex,
                                                                           isChoosen: isChoosen)))
        }
        return state
    }
    
    func attach(view: PickerViewInput) {
        self.view = view
        view.setTitle(Constants.Labels.typePickerTitle)
        view.hideButton()
        view.setViewModels(state.map({ $0.viewModel }))
    }
    
    func itemTapped(index: Int) {
        output?.setType(state[index].type)
        router?.closeModule()
    }
    
}
