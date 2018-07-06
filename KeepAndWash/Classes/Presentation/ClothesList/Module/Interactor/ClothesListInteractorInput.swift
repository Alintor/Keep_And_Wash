//
//  ClothesListInteractorInput.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import Foundation

protocol ClothesListInteractorInput: class {

    var allClothes: [ClothesItem] { get }
    func updateClothes(_ item: ClothesItem)
    func deleteClothes(_ item: ClothesItem)
}
