//
//  CatPhrasesModel.swift
//  StarMinds
//
//  Created by Ieda Xavier on 26/09/22.
//

import Foundation

// MARK: - CatPhasesModel
struct CatPhasesModel: Codable {
    let phrases: [Phrase]

    static func loadJson() -> [Phrase]? {
        guard let databaseInstance = Bundle.main.path(
            forResource: "CatPhrases",
            ofType: "json"
        ) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: databaseInstance), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(CatPhasesModel.self, from: data)
            return jsonData.phrases
        } catch {
            print(error.localizedDescription)
        }

        return nil
    }
}

// MARK: - Phrase
struct Phrase: Codable {
    let id: Int
    let text: String

    enum CodingKeys: String, CodingKey {
        case id
        case text = "Text"
    }
}
