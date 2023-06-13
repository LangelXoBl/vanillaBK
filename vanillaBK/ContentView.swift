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
    var body: some View {
        VStack {
            
            if(!auth){
                LoginView(isAuth: $auth)
            }else{
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
