import UIKit
protocol ColorPickerOutput: class {
    func setColor(_ hexColor:String)
}


class ColorPickerPresenter: PickerViewOutput {
    
    private weak var view:PickerViewInput?
    private weak var output:ColorPickerOutput?
    private var service:HexColorService
    private var viewModels = [PickerViewModel]()
    var router:PickerRouter?
    
    init(initialColor:String?, service:HexColorService, output:ColorPickerOutput?) {
        self.output = output
        self.service = service
        viewModels = getViewModelsWith(initialColor: initialColor)
    }
    
    func attach(view: PickerViewInput) {
        self.view = view
        view.setTitle(Constants.Labels.colorPickerTitle)
        view.hideButton()
        view.setViewModels(viewModels)
    }
    
    func getViewModelsWith(initialColor:String?) -> [PickerViewModel] {
        var viewModels = [PickerViewModel]()
        let colors = service.getMainHexColors()
        for color in colors {
            let isSelected = color == initialColor
            viewModels.append(PickerViewModel(title: nil,
                                              imageName: Constants.ImageNames.colorIcon,
                                              hexColor: color,
                                              isChoosen: isSelected))
        }
        return viewModels
        
    }
    
    func itemTapped(index: Int) {
        output?.setColor(viewModels[index].hexColor)
        router?.closeModule()
    }
    
    
}
