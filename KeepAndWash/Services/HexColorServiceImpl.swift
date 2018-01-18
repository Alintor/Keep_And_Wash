import UIKit

class HexColorServiceImpl: HexColorService {
    func getMainHexColors() -> [String] {
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
    
    
}
