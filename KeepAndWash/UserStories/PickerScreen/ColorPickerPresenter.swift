import UIKit
protocol ColorPickerOutput: class {
    func setColor(_ hexColor:String)
}


class ColorPickerPresenter: PickerViewOutput {
    
    private weak var view:PickerViewInput?
    private weak var output:ColorPickerOutput?
    private var viewModels = [PickerViewModel]()
    var router:PickerRouter?
    
    init(initialColor:String?, output:ColorPickerOutput?) {
        self.output = output
        viewModels = getViewModelsWith(initialColor: initialColor)
    }
    
    func getColors() -> [String] {
        return [UIColor.black.hex,
                UIColor.brown.hex,
                UIColor.red.hex,
                UIColor.blue.hex,
                UIColor.green.hex,
                UIColor.orange.hex,
                UIColor.yellow.hex,
                UIColor.darkGray.hex,
                UIColor.purple.hex]
    }
    
    func attach(view: PickerViewInput) {
        self.view = view
        view.setTitle(Constants.Labels.colorPickerTitle)
        view.hideButton()
        view.setViewModels(viewModels)
    }
    
    func getViewModelsWith(initialColor:String?) -> [PickerViewModel] {
        var viewModels = [PickerViewModel]()
        let colors = getColors()
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
