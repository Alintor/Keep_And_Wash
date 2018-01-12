
import UIKit
struct Constants {
    struct Storage {
        static let storageVersion = "0.1"
        static let storageVersionKey = "StorageVersion"
        
        static let recourcesType = "json"
        
        static let clothesTypeFileName = "ClothesType"
        static let laundryIconsFileName = "LaundryIcons"
        static let laundryIconsCategoryFileName = "LaundryIconsCategory"
    }
    
    struct Placeholders {
        static let enterTitle = "Ввести название"
        static let enterNote = "Ввести замечание"
    }
    
    struct ButtonTitles {
        static let addTitle = "Добавить название"
        static let chooseType = "Выбрать тип"
        static let chooseIcons = "Выбрать иконки"
        static let chooseColor = "Выбрать цвет"
        static let addPhoto = "Добавить фото (необ.)"
        static let addNote = "Добавить примечание (необ.)"
    }
    
    struct Labels {
        static let colorTitle = "Цвет"
        static let iconsTitle = "Иконки"
        static let colorPickerTitle = "Выберите цвет"
        static let iconsPickerTitle = "Выберите иконки"
        static let typePickerTitle = "Выберите тип вещи"
        static let photoPickerTitle = "Добавить фотографию"
        static let cameraPickerCellTitle = "Сделать фото"
        static let photoLibraryPickerCellTitle = "Галерея"
        static let deletePickerCellTitle = "Удалить фото"
    }
    
    struct ImageNames {
        static let colorIcon = "icn_color"
        static let emptyColorIcon = "icn_empty_color"
        static let cameraIcon = "icn_camera"
        static let photoLibraryIcon = "icm_photo_library"
        static let deleteIcon = "icn_delete"
    }
    
    struct Colors {
        static let mainColor = UIColor.black
    }
}
