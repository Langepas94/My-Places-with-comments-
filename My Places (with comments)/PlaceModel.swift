//
//  PlaceModel.swift
//  My Places (with comments)
//
//  Created by Артём Тюрморезов on 03.10.2022.
//


import UIKit
import RealmSwift

class Place: Object {
    @Persisted var name = ""
    @Persisted var location: String?
    @Persisted var type: String?
    @Persisted var imageData: Data?
 
    let restorantName = ["Шпинат", "SoSo coffee", "Rustaveli", "Персонажи", "Чито Гврито", "Colba Coffee"]
    // MARK: - Просто функция чтобы не писать вручную стартовый массив данных
    func savePlaces() {
        
      
        
        for place in restorantName {
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return }
             
            let newPlace = Place()
             
             newPlace.name = place
             newPlace.location = "Волгоград"
             newPlace.type = "Ресторан"
             newPlace.imageData = imageData
            StorageManager.saveObject(newPlace)
        }
        
    }
}



