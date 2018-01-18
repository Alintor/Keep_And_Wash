
protocol PhotoPickerOutput: class {
    func setPhotoPath(_ path:String?)
}

enum PhotoPickerActions {
    case camera
    case library
    case delete
}

struct PhotoPickerState {
    let action:PhotoPickerActions
    let viewModel: PickerViewModel
}

class PhotoPickerPresenter: PickerViewOutput {

    private var helper:PhotoPickerHelper!
    private weak var view:PickerViewInput?
    private weak var output:PhotoPickerOutput?
    private var state = [PhotoPickerState]()
    var router:PhotoPickerRouter?
    
    init(initialPhotoPath:String?, output:PhotoPickerOutput) {
        self.output = output
        helper = PhotoPickerHelper(initialPhotoPath: initialPhotoPath, output: self)
        state = helper.getState()
    }
    
    func attach(view: PickerViewInput) {
        self.view = view
        view.hideButton()
        view.setTitle(Constants.Labels.photoPickerTitle)
        view.setViewModels(state.map({ $0.viewModel }))
    }
    
    func itemTapped(index: Int) {
        switch state[index].action {
        case .library:
            router?.openPhotoLibrary(delegate: helper)
        case .camera:
            router?.openCamera(delegate: helper)
        case .delete:
            helper.deletePhoto()
        }
    }
}

extension PhotoPickerPresenter: PhotoPickerHelperOutput {
    func closeImagePicker() {
        router?.closeModule()
    }
    
    func setPhotoPath(_ path: String?) {
        output?.setPhotoPath(path)
        router?.closeModule()
    }
    
    
}
