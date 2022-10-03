//
//  PlaceModel.swift
//  My Places (with comments)
//
//  Created by Артём Тюрморезов on 03.10.2022.
//

import Foundation

struct Place {
    var name: String
    var place: String
    var type: String
    var image: String
    static let restorantName = ["Шпинат", "SoSo coffee", "Rustaveli", "Персонажи", "Чито Гврито", "Colba Coffee"]
    
    static func getPlace() -> [Place] {
        var places = [Place]()
        for place in restorantName {
            places.append(Place(name: place, place: "Волгоград", type: "Ресторан", image: place))
        }
        return places
    }
}



