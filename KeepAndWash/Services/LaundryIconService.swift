
protocol LaundryIconService {
    func getIconsFor(category:LaundryIconCategory) -> [LaundryIcon]
    func getIconsCategories() -> [LaundryIconCategory]
    func getAllIcons() -> [LaundryIcon]
}
