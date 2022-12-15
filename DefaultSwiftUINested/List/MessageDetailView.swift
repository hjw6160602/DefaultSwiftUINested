//
//  MessageDetailView.swift
//  DefaultSwiftUINested
//
//  Created by SaiDiCaprio on 2022/12/14.
//

import SwiftUI

struct MessageDetailView: View {
    
    var message: Message
    
    @available(iOS 13.0.0, *)
    var body: some View {
        VStack {
            let title = "\(message.type): \(message.id)"
            Text(title)
            Spacer()
            IndentedText(json: message.json)
                .frame(alignment: .center)
            
        }
        
    }
}
struct IndentedText: View {
    @State var json: String

    var body: some View {
        VStack {
            Spacer()
            if #available(iOS 14.0, *) {
                TextEditor(text: $json)
                    .frame(width: 355, height: 500)
                    .padding(.top, 40)
            } else {
                ScrollView {
                    Text(self.json)
                        .lineLimit(nil)
                        .padding(.leading, 20)
                        .frame(width: 355, height: 500,alignment: .center)
                }
            }
        }
//        GeometryReader { geometry in
//        }
    }
}



struct MessageDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        let msg = Message(id: "1718572853_1247575987:1", type: "MESG", targetType: "channel", targetId: "1718572853_1247575987", json:"{\"seq_id\":\"1\",\"persistent\":\"True\",\"message\":\"{\\\"payloads\\\":{\\\"type\\\":1,\\\"content\\\":\\\"ccjccj\\\"}}\",\"readable\":\"True\",\"request_id\":\"2c18ac43844a4072b49aba280d2d5982\",\"countable\":\"True\",\"message_type\":\"MESG\",\"created_at\":\"1658742728142\",\"sender_user_id\":\"1247575987\",\"target_id\":\"1718572853_1247575987\",\"target_type\":\"channel\",\"cnt_seq_id\":\"1\",\"status\":\"1\",\"message_id\":\"1718572853_1247575987:1\"}")
        MessageDetailView(message: msg)
    }
}
