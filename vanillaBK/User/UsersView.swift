//
//  UsersView.swift
//  vanillaBK
//
//  Created by imac_01 on 29/05/23.
//

import SwiftUI

struct UsersView: View {
    @StateObject var uVM : UserViewModel =
    UserViewModel()
    var body: some View {
        VStack{
            Text("Users")
            HStack{
                TextField("UserName", text: $uVM.c_username)
                TextField("Password ", text: $uVM.c_password)
                Button("save"){
                    uVM.createUser()
                }
            }
            List(uVM.users){ user in
                HStack{
                    Text(user.username ?? "NA")
                    Text(user.password ?? "NA")
                    Spacer()
                    Button("Delete"){
                        uVM.deleteUser(user: user)
                    }
                }
            }
            //UserListView()
            
        }
    }
}

struct UserListView: View {
    var body: some View {
        List( ){
            HStack{
                Text("name")
                Text("pass")
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
