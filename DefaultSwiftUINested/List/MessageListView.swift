//
//  MsgCaptureTableView.swift
//  DefaultSwiftUINested
//
//  Created by SaiDiCaprio on 2022/12/13.
//

import SwiftUI
import Combine

//"message_type": "MESG",
//"target_id": "1718572853_1247575987",
//"target_type": "channel",
//"message_id": "1718572853_1247575987:1"

// MESG/EVENT: 1718572853_1247575987:1
// channel: 1718572853_1247575987 ||
// user: 1718572853
// subType PeerViewCntSeqIdChanged

struct MessageListView: View {
    
    @State var messageList: [Message]
    
    @State var expandingId: String?

    
    init(messageList: [Message], expandingId: String? = nil) {
        self.messageList = messageList
        self.expandingId = expandingId
    }
    
    
    var body: some View {
        VStack {
            Text("IM Message Capture")
            List(messageList) { message in
                NavigationLink {
                    MessageDetailView(message: message)
                } label: {
                    MessageInfoRow(message: message, expanded: false)
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: NotificationNameMessageCapture)) { noti in
                self.didReceiveImMessageNoti(noti)
            }
        }
    }
    
    func didReceiveImMessageNoti(_ notification: Notification) {
        let noti = notification.object
        guard noti is [String: Any] else {
            return
        }
        let jsonDict: [String: Any] = noti as! [String: Any]
        let jsonString = JSONString(jsonDict)
        
        let jsonData: Data = jsonString.data(using:String.Encoding.utf8)!
        let message: Message? = try? JSONDecoder().decode(Message.self,from:jsonData)
    
        message?.json = jsonString
        if let message = message {
            self.messageList.append(message)
        }
    }
}

#if DEBUG
struct MessageCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        
        MessageListView(messageList: dataStoreList)
    }
}
#endif

//Message(id: "1718572853_1247575987:1", type: "MESG", targetType: "channel", targetId: "1718572853_1247575987", subType: nil, json: "{}"),
//Message(id: "1718572853_1247575987:2", type: "EVENT", targetType: "channel", targetId: "1718572853_1247575987", subType: "PeerViewCntSeqIdChanged", json: "{}"),
//Message(id: "1718572853_1247575987:3", type: "MESG", targetType: "user", targetId: "1718572853", subType: "1000003", json: "{\"seq_id\":\"1\",\"persistent\":\"True\",\"message\":\"{\\\"payloads\\\":{\\\"type\\\":1,\\\"content\\\":\\\"ccjccj\\\"}}\",\"readable\":\"True\",\"request_id\":\"2c18ac43844a4072b49aba280d2d5982\",\"countable\":\"True\",\"message_type\":\"MESG\",\"created_at\":\"1658742728142\",\"sender_user_id\":\"1247575987\",\"target_id\":\"1718572853_1247575987\",\"target_type\":\"channel\",\"cnt_seq_id\":\"1\",\"status\":\"1\",\"message_id\":\"1718572853_1247575987:1\"}")
