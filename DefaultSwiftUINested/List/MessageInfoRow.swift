//
//  MessageInfoRow.swift
//  DefaultSwiftUINested
//
//  Created by SaiDiCaprio on 2022/12/14.
//

import SwiftUI

struct MessageInfoRow: View {
    
    let message: Message
    
    let expanded: Bool
    
    var body: some View {
        VStack {
            HStack {
                if #available(iOS 15.0, *) {
                    Image(systemName: "message.badge.filled.fill")
                        .symbolRenderingMode(.multicolor)
                        .aspectRatio(contentMode: .fit)
                } else {
                    Image(systemName: "message.badge.filled.fill")
                        .foregroundColor(.green)
                        .aspectRatio(contentMode: .fit)
                }
                
                VStack(alignment: .leading) {
                    Text("\(message.type) --> \(message.targetType)")
                    Text(message.id)
                    if message.subType != nil {
                        Text(message.subType!)
                    }
                }
                
            }
        }
    }
}

//struct PokemonInfoRow_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            MessageInfoRow(model: .sample(id: 1), expanded: false)
//            MessageInfoRow(model: .sample(id: 21), expanded: true)
//            MessageInfoRow(model: .sample(id: 25), expanded: false)
//        }
//    }
//}
