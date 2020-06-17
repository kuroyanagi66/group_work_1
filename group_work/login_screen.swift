//
//  login_screen.swift
//  group_work
//
//  Created by itolab on 2020/06/16.
//  Copyright © 2020 kute. All rights reserved.
//

import SwiftUI

struct login_screen: View {
    @State var inputID: String = ""
        @State var inputPassword: String = ""

        var body: some View {
            NavigationView {
                VStack(alignment: .center) {
                    Text("SwiftUI App")
                        .font(.system(size: 48,
                                      weight: .heavy))

                    VStack(spacing: 24) {
                        TextField("ID", text: $inputID)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: 280)

                        SecureField("Password", text: $inputPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: 280)

                    }
                    .frame(height: 200)

                    Button(action: {
                       print("Login処理")
                    },
                    label: {
                        Text("Login")
                            .fontWeight(.medium)
                            .frame(minWidth: 160)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    })

                    Spacer()
                }
            }
        }
    }


struct login_screen_Previews: PreviewProvider {
    static var previews: some View {
        login_screen()
    }
}
