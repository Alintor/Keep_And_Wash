import UIKit
protocol ColorPickerDelegate {
    func setColor(_ HexColor:String)
}


class ColorPickerPresenter: PickerPresenter {
    
    private weak var view:PickerView?
    private var selectedColor:String?
    private var delegate:ColorPickerDelegate?
    
    init(delegate:ColorPickerDelegate?, initialColor:String?) {
        self.delegate = delegate
        selectedColor = initialColor
    }
    
    func getColors() -> [String] {
        return [UIColor.black.hex,
                UIColor.white.hex,
                UIColor.red.hex,
                UIColor.blue.hex,
                UIColor.green.hex,
                UIColor.orange.hex,
                UIColor.yellow.hex,
                UIColor.darkGray.hex,
                UIColor.purple.hex]
    }
    
    func attach(view: PickerView) {
        self.view = view
        view.setTitle(Constants.Labels.colorPickerTitle)
        updateViewModels()
    }
    
    func updateViewModels() {
        var viewModels = [PickerViewModel]()
        let colors = getColors()
        for color in colors {
            let isSelected = color == selectedColor
            viewModels.append(PickerViewModel(title: nil,
                                              imageName: Constants.ImageNames.colorIcon,
                                              hexColor: color,
                                              isChoosen: isSelected))
        }
        view?.setViewModels(viewModels)
        
    }
    
    func buttonTapped() {
        
    }
    
    func itemTapped(index: Int) {
        delegate?.setColor(getColors()[index])
    }
    
    
}
