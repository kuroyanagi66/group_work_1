//
//  display1.swift
//  group_work
//
//  Created by itolab on 2020/06/16.
//  Copyright © 2020 kute. All rights reserved.
//


import SwiftUI

struct display1: View {

    
    @EnvironmentObject var login_text: Login_text
    @ObservedObject var store = FollowingUserStore(moji2:Login_text().lonin_text1) //Login_text().lonin_text1)
    
    var body: some View {
        
        VStack{
       
           // Text(self.login_text.lonin_text1)
            List(store.users) { (user) in
              UserRow(user: user)
            }
        }
    }
}


struct UserRow: View {
    var user: User
    var body: some View {
        //Text(user.login)
        Text(user.id + "\n" + user.user_name + "\n" + user.message)
            //+ "\n" + user.user_name )
    }
}
struct display1_Previews: PreviewProvider {
    static let login_text = Login_text()
    static var previews: some View {
        display1().environmentObject(login_text)
    }
}
