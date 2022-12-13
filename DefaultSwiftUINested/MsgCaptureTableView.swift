//
//  MsgCaptureTableView.swift
//  DefaultSwiftUINested
//
//  Created by SaiDiCaprio on 2022/12/13.
//

import SwiftUI

class modle:Identifiable{
    var name:String?
    var content:String?
    init(nameS:String,contentS:String){
        name = nameS
        content = contentS
    }
}

struct MsgCaptureTableView: View {
    @State var modles = [modle.init(nameS: "行1", contentS: "行1内容"),
                         modle.init(nameS: "行2", contentS: "行2内容")]
    
    @available(iOS 13.0.0, *)
    var body: some View {
        NavigationView{
            List(modles){ modlel in
                NavigationLink.init(modlel.name!, destination: Text(modlel.content!))
            }
        }
    }
}

#if DEBUG
struct MessageCaptureView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        MsgCaptureTableView()
    }
}
#endif
