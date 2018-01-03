
protocol PickerView {
    func setViewModels(_ viewModels:[PickerViewModel])
    func hideButton()
}

protocol PickerPresenter {
    func attach(view:PickerView)
    func buttonTapped()
    func itemTapped(index:Int)
}
