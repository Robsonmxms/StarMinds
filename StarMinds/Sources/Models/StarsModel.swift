//
//  StarModel.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 09/09/22.
//

import UIKit
// swiftlint: disable identifier_name

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
            return getCGSize(0.26)
        case .whiteDwarf:
            return getCGSize(0.38)
        case .variable:
            return getCGSize(0.38)
        case .brownDwarf:
            return getCGSize(0.46)
        case .yellowDwarf:
            return getCGSize(0.51)
        case .redGiant:
            return getCGSize(0.77)
        case .blueSupergiant:
            return getCGSize(0.94)
        }
    }

    private static func getCGSize(_ value: Double) -> CGSize {
        return CGSize(
            width: ScreenSize.width*value,
            height: ScreenSize.width*value
        )
    }

    static func mockStar() -> Star {
        return Star(
            id: 0,
            info: Info(
                id: 0,
                name: Name.neutron,
                description: ""
            ),
            image: Image(
                id: 0,
                path: "",
                voiceDescription: ""
            ),
            voxNode: [
                VoxNode(
                    id: 0,
                    scene: "",
                    color: StarColor(
                        id: 0,
                        red: 0,
                        green: 0,
                        blue: 0
                    )
                ),
                VoxNode(
                    id: 0,
                    scene: "",
                    color: StarColor(
                        id: 0,
                        red: 0,
                        green: 0,
                        blue: 0
                    )
                ),
                VoxNode(
                    id: 0,
                    scene: "",
                    color: StarColor(
                        id: 0,
                        red: 0,
                        green: 0,
                        blue: 0
                    )
                )
            ]
        )
    }
}
// MARK: - Star
struct Star: Codable {
    let id: Int
    let info: Info
    let image: Image
    let voxNode: [VoxNode]

    private enum CodingKeys: String, CodingKey {
        case id, info
        case image
        case voxNode
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

// MARK: - Image
struct Image: Codable {
    let id: Int
    let path: String
    let voiceDescription: String

    private enum CodingKeys: String, CodingKey {
        case id
        case path, voiceDescription
    }
}

// MARK: - VoxNode
struct VoxNode: Codable {
    let id: Int
    let scene: String
    let color: StarColor

    private enum CodingKeys: String, CodingKey {
        case id
        case scene, color
    }
}

// MARK: - StarColor
struct StarColor: Codable {
    let id: Int
    let red, green, blue: CGFloat

    private enum CodingKeys: String, CodingKey {
        case id
        case red, green, blue
    }
}
