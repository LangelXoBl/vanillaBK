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
                Button("Logout test"){
                    auth = false
                    let save = UserDefaults.standard.bool(forKey: "save")
                    print(save)
                            if(!save){
                        UserDefaults.standard.set("a", forKey: "user")
                        UserDefaults.standard.set("a", forKey: "pass")}
                }
                NavView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
