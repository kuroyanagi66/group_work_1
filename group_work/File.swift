import Foundation
import Combine
import SwiftUI

class FollowingUserStore: ObservableObject {
    @Published var users: [User] = []
    @EnvironmentObject var login_text: Login_text
    

    init(moji2:String) {
        load(moji: moji2)
    }

    func load(moji : String) {
       // let url_text = self.login_text.lonin_text1
        //let url = URL(string: moji)!
        let url = URL(string: "http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api.php?name=kuroyanagi&pass=55itolab!!")!
        //http://ec2-3-115-14-119.ap-northeast-1.compute.amazonaws.com/api.php?name=kuroyanagi&pass=55itolab!!
        //https://api.github.com/users/maoyama/following
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.users = try! JSONDecoder().decode([User].self, from: data!)
            }
        }.resume()
        
       // let request = URLRequest(url: url)  // inspect with Show Result button
        //let taskWithRequest = URLSession.shared.dataTask(with: request)
    }
}
/*
struct User: Decodable, Identifiable {
    var id: Int
    var login: String
}
*/
struct User: Decodable, Identifiable {
    var id: String
    var user_name: String
    var message: String
    
   // var login: String
    //var user_name: String
}

struct File_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
