//
//  ContentView.swift
//  vanillaBK
//
//  Created by IMAC 03 on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var auth:
    Bool = false
    
    init() {
        
    }
    var body: some View {
        VStack {
            
            if(!auth){
                LoginView(isAuth: $auth)
            }else{
                Button("Logout"){
                    auth = false
                    var save = UserDefaults.standard.bool(forKey: "save")
                    print(save)
                                                          if(!save){
                        UserDefaults.standard.set("", forKey: "user")
                        UserDefaults.standard.set("", forKey: "pass")}
                }
                NavView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
