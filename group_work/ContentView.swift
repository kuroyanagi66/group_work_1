//
//  ContentView.swift
//  group_work
//
//  Created by itolab on 2020/06/16.
//  Copyright © 2020 kute. All rights reserved.
//http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api.php?name=kuroyanagi&pass=55itolab!!

import SwiftUI


import SwiftUI

struct ContentView: View {
    @State var inputID: String = ""
    @State var inputPassword: String = ""
    @State var id_text: String = "http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api.php?name="
    @State var pass_text: String = "&pass="
    @State var login_info: String = ""
    @EnvironmentObject var login_text: Login_text
    @State var isActiveSubView = false
    @ObservedObject var store = FollowingUserStore(moji2:Login_text().lonin_text1)
    @State private var showingAlert = false
    @State var login_kyoka = 0
    @State var url_1 = "tem"
    @State var encodeUrlString = "s"

        var body: some View {
            NavigationView {
                VStack(alignment: .center) {
                    
                    Text("クラッチ")
                        .font(.system(size: 30
                                      ))
                    Image(systemName: "person.crop.circle").resizable()
                    .frame(width: 100.0, height: 100.0, alignment: .leading)
                    
                    VStack(spacing: 24) {
                        
                        TextField("ID", text: $inputID)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: 280)

                        SecureField("Password", text: $inputPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: 280)

                    }
                    .frame(height: 200)

                    NavigationLink(destination: display1().environmentObject(login_text),
                                   isActive: $isActiveSubView) {
                                    EmptyView()
                    }
                    
                    Button(action: {
                        self.showingAlert = false
                        self.login_kyoka = 0
                       print("Login処理")
                        self.login_info = self.id_text + self.inputID + self.pass_text + self.inputPassword
                        self.login_text.lonin_text1 = self.login_info
                        
                     
                        self.url_1 = self.login_info
                    
                        self.encodeUrlString = self.url_1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                        
                        let url_: URL = URL(string: self.encodeUrlString)!
                      //  let url_: URL = URL(string: self.login_info)!
                        let task: URLSessionTask = URLSession.shared.dataTask(with: url_, completionHandler: {(data, response, error) in
                            // コンソールに出力
                            //print("data: \(String(describing: data))")
                            //print("response: \(String(describing: response))")
                           // print("error: \(String(describing: error))")
                            if response?.expectedContentLength == 0{
                                print("ログイン失敗")
                                 self.showingAlert = true
                               
                                
                            }else{
                                self.isActiveSubView.toggle()
                            }
                        })
                        task.resume()
                        
                        if self.login_kyoka == 0{
                        //self.isActiveSubView.toggle()
                        }
                       // self.isActiveSubView.toggle()
                        /*
                        for i in self.store.users{
                            //print(i.user_name)
                            if i.user_name == self.inputID{
                                self.isActiveSubView.toggle()
                                self.login_kyoka = 1
                            }
                            
                        }
                        if self.login_kyoka == 0{
                        self.showingAlert = true
                        }*/
                    },
                    label: {
                        Text("Login")
                            .fontWeight(.medium)
                            .frame(minWidth: 160)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    }).alert(isPresented: $showingAlert) {
                        Alert(title: Text("ログイン失敗"))}

                    Spacer()
                    Text(self.login_text.lonin_text1)
                }
            }
        }
    }




struct ContentView_Previews: PreviewProvider {
    static let login_text = Login_text()
    static var previews: some View {
        ContentView().environmentObject(login_text)
    }
}
