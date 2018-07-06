//
//  ClothesListInteractor.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import Foundation

final class ClothesListInteractor {

    private let service: ClothesServiceType!
    
    // MARK: - Init
    
    init(service: ClothesServiceType?) {
        self.service = service
    }
}

// MARK: - ClothesListInteractorInput

extension ClothesListInteractor: ClothesListInteractorInput {

    var allClothes: [ClothesItem] {
        return service.allClothes
    }
    
    func updateClothes(_ item: ClothesItem) {
        service.update(item)
    }
    
    func deleteClothes(_ item: ClothesItem) {
        service.delete(item)
    }
}
