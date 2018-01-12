import Foundation

protocol PickerViewInput: class {
    func setViewModels(_ viewModels:[PickerViewModel])
    func setTitle(_ title:String)
    func hideButton()
}

protocol PickerViewOutput {
    func attach(view:PickerViewInput)
    func itemTapped(index:Int)
    func buttonTapped()
}

extension PickerViewOutput {
    func buttonTapped() {
        //this is a empty implementation to allow this method to be optional
    }
}
