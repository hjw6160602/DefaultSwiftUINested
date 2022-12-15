//
//  PokemonViewModel.swift
//  PokeMaster
//
//  Created by 王 巍 on 2019/08/06.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

//struct MessageViewModel: Identifiable, Codable {
//        var id: Int { message.id }
//
//        let pokemon: Message
//
//}
//
//extension MessageViewModel {
//    static var all: [MessageViewModel] = {
//        (1...30).map { id in
//            let pokemon = Message.sample(id: id)
//            return MessageViewModel(pokemon: pokemon, species: species)
//        }
//    }()
//
//    static let samples: [MessageViewModel] = [
//        sample(id: 1),
//        sample(id: 2),
//        sample(id: 3),
//    ]
//
//    static func sample(id: Int) -> MessageViewModel {
//        let message = Message.sample(id: id)
//
//        return MessageViewModel(pokemon: message, species: species)
//    }
//}

//struct PokemonViewModel: Identifiable, Codable {
//
//    var id: Int { pokemon.id }
//
//    let pokemon: Pokemon
//    let species: PokemonSpecies
//
//    init(pokemon: Pokemon, species: PokemonSpecies) {
//        self.pokemon = pokemon
//        self.species = species
//    }
//
//    var color: Color { species.color.name.color }
//    var height: String { "\(Double(pokemon.height) / 10)m" }
//    var weight: String { "\(Double(pokemon.weight) / 10)kg" }
//    var name: String { species.names.CN }
//    var nameEN: String { species.names.EN }
//    var genus: String { species.genera.CN }
//    var genusEN: String { species.genera.EN }
//
//    var types: [Type] {
//        self.pokemon.types
//            .sorted { $0.slot < $1.slot }
//            .map { Type(pokemonType: $0) }
//    }
//
//    var iconImageURL: URL {
//        URL(string: "https://raw.githubusercontent.com/onevcat/pokemaster-images/master/images/Pokemon-\(id).png")!
//    }
//
//    var detailPageURL: URL {
//        URL(string: "https://cn.portal-pokemon.com/play/pokedex/\(String(format: "%03d", id))")!
//    }
//
//    var descriptionText: String { species.flavorTextEntries.CN.newlineRemoved }
//    var descriptionTextEN: String { species.flavorTextEntries.EN.newlineRemoved }
//}
//
//extension PokemonViewModel: CustomStringConvertible {
//    var description: String {
//        "PokemonViewModel - \(id) - \(self.name)"
//    }
//}
//
//extension PokemonViewModel {
//    struct `Type`: Identifiable {
//
//        var id: String { return name }
//
//        let name: String
//        let color: Color
//
//        init(name: String, color: Color) {
//            self.name = name
//            self.color = color
//        }
//
//        init(pokemonType: Pokemon.`Type`) {
//            if let v = TypeInternal(rawValue: pokemonType.type.name)?.value {
//                self = v
//            } else {
//                self.name = "???"
//                self.color = .gray
//            }
//        }
//
//        enum TypeInternal: String {
//            case readble
//            case persistence
//
//            var value: Type {
//                switch self {
//                case .readble:
//                    return Type(name: "可读", color: Color(hex: 0x9F5A96))
//                case .persistence:
//                    return Type(name: "可入库", color: Color(hex: 0x8BC965))
//                }
//            }
//        }
//    }
//}
