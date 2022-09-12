//
//  StarModel.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 09/09/22.
//

import UIKit

// MARK: - StarModel
struct StarModel: Codable {
    let stars: [Star]

    static func loadJson() -> [Star]? {
        guard let databaseInstance = Bundle.main.path(
            forResource: "Stars",
            ofType: "json"
        ) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: databaseInstance), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(StarModel.self, from: data)
            return jsonData.stars
        } catch {
            print(error.localizedDescription)
        }

        return nil
    }

    static func getSize(_ name: Name) -> CGSize {
        switch name {
        case .neutron:
            return CGSize(width: 100,height: 100)
        case .whiteDwarf:
            return CGSize(width: 150,height: 150)
        case .variable:
            return CGSize(width: 150,height: 150)
        case .brownDwarf:
            return CGSize(width: 180,height: 180)
        case .yellowDwarf:
            return CGSize(width: 200,height: 200)
        case .redGiant:
            return CGSize(width: 300,height: 300)
        case .blueSupergiant:
            return CGSize(width: 370,height: 370)
        }
    }
}

// MARK: - Star
struct Star: Codable {
    let id: Int
    let info: Info
    let image, voxel: String

    private enum CodingKeys: String, CodingKey {
        case id, info
        case image
        case voxel
    }
}

// MARK: - Info
struct Info: Codable {
    let id: Int
    let name: Name
    let description: String

    private enum CodingKeys: String, CodingKey {
        case id, name
        case description
    }
}

enum Name: String, Codable {
    case yellowDwarf = "Anã Amarela"
    case whiteDwarf = "Anã Branca"
    case brownDwarf = "Anã Marrom"
    case neutron = "Estrela de Nêutrons"
    case variable = "Estrela Variável"
    case redGiant = "Gigante Vermelha"
    case blueSupergiant = "Supergigante Azul"
}
