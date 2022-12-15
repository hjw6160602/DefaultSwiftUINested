//
//  Message.swift
//  DefaultSwiftUINested
//
//  Created by SaiDiCaprio on 2022/12/14.
//

import UIKit

//struct Message: Codable {
//    var type = ""
//
//    var id = ""
//
//    var targetType = ""
//
//    var targetId = ""
//
//    var subType: String?
//
//    var color = Color.white
//
//    var json = ""
//}
//
//extension Message: Identifiable { }

class Message: Identifiable, Codable {
    var type = ""

    var id = ""

    var targetType = ""

    var targetId = ""

    var subType: String?

    var json = ""

    init(id: String = "", type: String = "", targetType: String = "", targetId: String = "", subType: String? = nil, json: String = "") {
        self.type = type
        self.id = id
        self.targetType = targetType
        self.targetId = targetId
        self.subType = subType
        self.json = json
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "message_id"
        case type = "message_type"
        case targetType = "target_type"
        case targetId = "target_id"
        case subType = "sub_type"
    }
}

let NotificationNameMessageCapture = Notification.Name("kNotificationNameMessageCapture")

func JSONString(_ jsonDict: [String: Any])  -> String {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
        // here "jsonData" is the dictionary encoded in JSON data

        let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
        // here "decoded" is of type `Any`, decoded from JSON data
        return jsonString
        // you can now cast it with the right type

    } catch {
        print(error.localizedDescription)
    }
    return ""
}

let dataStoreList = [
    Message(id: "1718572853_1247575987:1", type: "MESG", targetType: "channel", targetId: "1718572853_1247575987", subType: nil, json: "{}"),
    Message(id: "1718572853_1247575987:2", type: "EVENT", targetType: "channel", targetId: "1718572853_1247575987", subType: "PeerViewCntSeqIdChanged", json: "{}"),
    Message(id: "1718572853_1247575987:3", type: "MESG", targetType: "user", targetId: "1718572853", subType: "1000003", json: "{\"seq_id\":\"1\",\"persistent\":\"True\",\"message\":\"{\\\"payloads\\\":{\\\"type\\\":1,\\\"content\\\":\\\"ccjccj\\\"}}\",\"readable\":\"True\",\"request_id\":\"2c18ac43844a4072b49aba280d2d5982\",\"countable\":\"True\",\"message_type\":\"MESG\",\"created_at\":\"1658742728142\",\"sender_user_id\":\"1247575987\",\"target_id\":\"1718572853_1247575987\",\"target_type\":\"channel\",\"cnt_seq_id\":\"1\",\"status\":\"1\",\"message_id\":\"1718572853_1247575987:1\"}")]


//{
//    "seq_id": "1",
//    "persistent": "True",
//    "message": "{\"payloads\":{\"type\":1,\"content\":\"ccjccj\"}}",
//    "readable": "True",
//    "request_id": "2c18ac43844a4072b49aba280d2d5982",
//    "countable": "True",
//    "message_type": "MESG",
//    "created_at": "1658742728142",
//    "channel_info": {
//        "is_1on1": "True"
//    },
//    "sender_user_id": "1247575987",
//    "target_id": "1718572853_1247575987",
//    "target_type": "channel",
//    "cnt_seq_id": "1",
//    "sender": {
//        "profile_url": "http:\/\/u8.iqiyipic.com\/xiuchang\/20161012\/23\/cd\/xiuchang_57fdb8b474d57972d17723cd_1x1.jpg?user_id=1247575987",
//        "nickname": "愿逐月华流照君_",
//        "user_id": "1247575987",
//        "updated_at": "1565940663000"
//    },
//    "status": "1",
//    "message_id": "1718572853_1247575987:1"
//}
