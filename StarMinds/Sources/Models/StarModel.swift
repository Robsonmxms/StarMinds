//
//  StarModel.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 09/09/22.
//

import UIKit

struct StarModel {
    var name: Name
    var image: String
    var voxel: String
    var description: String

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

enum Name: String {
    case yellowDwarf = "Anã Amarela"
    case whiteDwarf = "Anã Branca"
    case brownDwarf = "Anã Marrom"
    case neutron = "Estrela de Nêutrons"
    case variable = "Estrela Variável"
    case redGiant = "Gigante Vermelha"
    case blueSupergiant = "Supergigante Azul"
}

let stars = [
    StarModel(
        name: .neutron,
        image: "EstrelaNeutrons.png",
        voxel: "voxel",
        description: "As Anãs Brancas são muito comuns, mas não dá para ver direitinho pq elas tem pouca luz. É claro que essas estrelas tem outras curiosidades! Sabia que se chamam de Anãs Brancas pq estrelas com a temperatura muito quente na parte de fora são brancas. É daí que nasceu seu nome. Mas não é só isso. Elas tem um peso parecido com a do Sol e é um pouquinho maior do que o da Terra. Ah! Outra coisa incrível sobre os pesos das Anãs Brancas é que as que pesam mais tem tamanhos menores."
    ),
    StarModel(
        name: .whiteDwarf,
        image: "AnaBranca.png",
        voxel: "voxel",
        description: "As Anãs Brancas são muito comuns, mas não dá para ver direitinho pq elas tem pouca luz. É claro que essas estrelas tem outras curiosidades! Sabia que se chamam de Anãs Brancas pq estrelas com a temperatura muito quente na parte de fora são brancas. É daí que nasceu seu nome. Mas não é só isso. Elas tem um peso parecido com a do Sol e é um pouquinho maior do que o da Terra. Ah! Outra coisa incrível sobre os pesos das Anãs Brancas é que as que pesam mais tem tamanhos menores."
    ),
    StarModel(
        name: .variable,
        image: "EstrelaVariavel.png",
        voxel: "voxel",
        description: "As Anãs Brancas são muito comuns, mas não dá para ver direitinho pq elas tem pouca luz. É claro que essas estrelas tem outras curiosidades! Sabia que se chamam de Anãs Brancas pq estrelas com a temperatura muito quente na parte de fora são brancas. É daí que nasceu seu nome. Mas não é só isso. Elas tem um peso parecido com a do Sol e é um pouquinho maior do que o da Terra. Ah! Outra coisa incrível sobre os pesos das Anãs Brancas é que as que pesam mais tem tamanhos menores."
    ),
    StarModel(
        name: .yellowDwarf,
        image: "AnaAmarela.png",
        voxel: "voxel",
        description: "As Anãs Brancas são muito comuns, mas não dá para ver direitinho pq elas tem pouca luz. É claro que essas estrelas tem outras curiosidades! Sabia que se chamam de Anãs Brancas pq estrelas com a temperatura muito quente na parte de fora são brancas. É daí que nasceu seu nome. Mas não é só isso. Elas tem um peso parecido com a do Sol e é um pouquinho maior do que o da Terra. Ah! Outra coisa incrível sobre os pesos das Anãs Brancas é que as que pesam mais tem tamanhos menores."
    ),
    StarModel(
        name: .brownDwarf,
        image: "AnaMarrom.png",
        voxel: "voxel",
        description: "As Anãs Brancas são muito comuns, mas não dá para ver direitinho pq elas tem pouca luz. É claro que essas estrelas tem outras curiosidades! Sabia que se chamam de Anãs Brancas pq estrelas com a temperatura muito quente na parte de fora são brancas. É daí que nasceu seu nome. Mas não é só isso. Elas tem um peso parecido com a do Sol e é um pouquinho maior do que o da Terra. Ah! Outra coisa incrível sobre os pesos das Anãs Brancas é que as que pesam mais tem tamanhos menores."
    ),
    StarModel(
        name: .redGiant,
        image: "AnaVermelha.png",
        voxel: "voxel",
        description: "As Anãs Brancas são muito comuns, mas não dá para ver direitinho pq elas tem pouca luz. É claro que essas estrelas tem outras curiosidades! Sabia que se chamam de Anãs Brancas pq estrelas com a temperatura muito quente na parte de fora são brancas. É daí que nasceu seu nome. Mas não é só isso. Elas tem um peso parecido com a do Sol e é um pouquinho maior do que o da Terra. Ah! Outra coisa incrível sobre os pesos das Anãs Brancas é que as que pesam mais tem tamanhos menores."
    ),
    StarModel(
        name: .blueSupergiant,
        image: "SupergiganteAzul.png",
        voxel: "voxel",
        description: "As Anãs Brancas são muito comuns, mas não dá para ver direitinho pq elas tem pouca luz. É claro que essas estrelas tem outras curiosidades! Sabia que se chamam de Anãs Brancas pq estrelas com a temperatura muito quente na parte de fora são brancas. É daí que nasceu seu nome. Mas não é só isso. Elas tem um peso parecido com a do Sol e é um pouquinho maior do que o da Terra. Ah! Outra coisa incrível sobre os pesos das Anãs Brancas é que as que pesam mais tem tamanhos menores."
    )
]
