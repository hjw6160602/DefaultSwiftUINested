//
//  MessageDetailView.swift
//  DefaultSwiftUINested
//
//  Created by SaiDiCaprio on 2022/12/14.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct MessageDetailView: View {
    
    var message: Message
    
    var body: some View {
        VStack {
            HStack {
                let title = "\(message.type): \(message.id)"
                Text(title)
                    .padding(.top, 20)
            }
            
            Spacer(minLength: 20)
            IndentedText(json: message.json.prettyJSON ?? "")
        }
        
    }
}

@available(iOS 13.0.0, *)
struct IndentedText: View {
    var json: String

    var body: some View {
        VStack {
            if #available(iOS 14.0, *) {
                TextEditor(text: .constant(json))
                    .frame(width: 355, height: 700)
            } else {
                ScrollView {
                    Text(self.json)
                        .lineLimit(nil)
                        .frame(width: 355, height: 700)
                }
            }
        }
    }
}

@available(iOS 13.0, *)
struct MessageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let json = "{\"request_id\":\"91A74794-E152-4066-99C2-5615512BC66F\",\"status\":1,\"readable\":true,\"target_id\":\"1718572853_1444862998\",\"created_at\":1671099854774,\"device_id\":\"66d4239d2df35c3a0bdf9ba6a83cfe671116\",\"target_type\":\"channel\",\"channel_info\":{\"is_1on1\":true},\"cnt_seq_id\":203,\"sender_user_id\":\"1444862998\",\"message_id\":\"1718572853_1444862998:254\",\"seq_id\":254,\"persistent\":true,\"sender\":{\"user_id\":\"1444862998\",\"updated_at\":1671099846317},\"countable\":true,\"message_type\":\"MESG\",\"message\":\"{\\\"payloads\\\":{\\\"type\\\":1,\\\"content\\\":\\\"weak\\\"}}\",\"sub_type\":\"1\"}"
        
        let msg = Message(id: "1718572853_1247575987:1", type: "MESG", targetType: "channel", targetId: "1718572853_1247575987", json:json.prettyJSON ?? "")
        
        MessageDetailView(message: msg)
    }
}
