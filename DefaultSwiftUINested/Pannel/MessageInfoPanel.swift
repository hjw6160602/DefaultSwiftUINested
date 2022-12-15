//
//  MessageInfoPanel.swift
//  DefaultSwiftUINested
//
//  Created by SaiDiCaprio on 2022/12/14.
//

import SwiftUI

struct MessageInfoPanel: View {
    
    var topIndicator: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(width: 40, height: 6)
            .opacity(0.2)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            topIndicator
            Spacer()
        }
    }
}

//struct MessageInfoPanel: View {
//
//    let model: Message
//    var abilities: [AbilityViewModel] {
//        AbilityViewModel.sample(pokemonID: model.id)
//    }
//
//    var topIndicator: some View {
//        RoundedRectangle(cornerRadius: 3)
//            .frame(width: 40, height: 6)
//            .opacity(0.2)
//    }
//
//    var pokemonDescription: some View {
//        Text(model.descriptionText)
//            .font(.callout)
//            .foregroundColor(Color(hex: 0x666666))
//            .fixedSize(horizontal: false, vertical: true)
//    }
//
//    var body: some View {
//        VStack(spacing: 20) {
//            topIndicator
//            Header(model: model)
//            pokemonDescription
//            Divider()
//            AbilityList(
//                model: model,
//                abilityModels: abilities)
//        }
//        .padding(
//            EdgeInsets(
//                top: 12,
//                leading: 30,
//                bottom: 30,
//                trailing: 30
//            )
//        )
//        .blurBackground(style: .systemMaterial)
//        .cornerRadius(20)
//        .fixedSize(horizontal: false, vertical: true)
//    }
//}
//
//#if DEBUG
//struct PokemonInfoPanel_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageInfoPanel(model: .sample(id: 1))
//    }
//}
//#endif

