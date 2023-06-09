//
//  UsersView.swift
//  vanillaBK
//
//  Created by imac_01 on 01/06/23.
//

import SwiftUI

struct UsersView: View {
    @StateObject var uVM : UserViewModel =
    UserViewModel()
    @State var update: Bool = false
    @State var toUpdate: UserEntity?
    var body: some View {
        VStack{
            Text("Users")
            HStack{
                TextField("UserName", text: $uVM.c_username)
                TextField("Password ", text: $uVM.c_password)
                if (update){
                    Button("SaveEdit"){
                    uVM.updateUser(user: toUpdate!)
                    uVM.clear()
                    update = false
                    }
                }else{
                    Button("save"){
                        uVM.createUser()
                    }
                    }}
            List(uVM.users){ user in
                HStack{
                    Text(user.username ?? "NA")
                    Text(user.password ?? "NA")
                    Spacer()
                    Button("Delete"){
                        uVM.deleteUser(user: user)
                    }
                    Button("edit"){
                        update = true
                        toUpdate = user
                        uVM.c_username = user.username ?? ""
                        uVM.c_password = user.password ?? ""
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

