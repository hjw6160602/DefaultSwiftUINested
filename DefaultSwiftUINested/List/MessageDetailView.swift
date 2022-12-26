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
                
                Button (action: self.share) {
                    if #available(iOS 15.0, *) {
                        Image(systemName: "square.and.arrow.up")
                            .symbolRenderingMode(.multicolor)
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.black)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .frame(width: 40, height: 40)
                .padding(.top, 15)

            }
            
            Spacer(minLength: 20)
            IndentedText(json: message.json.prettyJSON ?? "")
        }
        
    }
    
    private func share() {
        // 准备分享的内容
        let items = [message.json] as [Any]
        
        // 创建 UIActivityViewController 实例
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        // 调起分享界面
        UIApplication.shared.keyWindow?.rootViewController?.present(activityViewController, animated: true)
        
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
        let json = "{\"seq_id\":\"1\",\"persistent\":\"True\",\"message\":\"{\\\"payloads\\\":{\\\"type\\\":1,\\\"content\\\":\\\"ccjccj\\\"}}\",\"readable\":\"True\",\"request_id\":\"2c18ac43844a4072b49aba280d2d5982\",\"countable\":\"True\",\"message_type\":\"MESG\",\"created_at\":\"1658742728142\",\"sender_user_id\":\"1247575987\",\"target_id\":\"1718572853_1247575987\",\"target_type\":\"channel\",\"cnt_seq_id\":\"1\",\"status\":\"1\",\"message_id\":\"1718572853_1247575987:1\"}"
        
        let msg = Message(id: "1718572853_1247575987:1", type: "MESG", targetType: "channel", targetId: "1718572853_1247575987", json:json.prettyJSON ?? "")
        
        MessageDetailView(message: msg)
    }
}
