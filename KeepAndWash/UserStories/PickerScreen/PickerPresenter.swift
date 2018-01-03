import Foundation

protocol PickerView: NSObjectProtocol {
    func setViewModels(_ viewModels:[PickerViewModel])
    func setTitle(_ title:String)
    func hideButton()
}

protocol PickerPresenter {
    func attach(view:PickerView)
    func buttonTapped()
    func itemTapped(index:Int)
}
