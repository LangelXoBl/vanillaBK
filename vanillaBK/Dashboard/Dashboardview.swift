//
//  ContentView.swift
//  VanillaBk
//
//  Created by IMAC 11 on 25/05/23.
//

import SwiftUI

struct Dashboardview: View {
    var body: some View {
        VStack {
            
                   
            VStack  {
                Image(systemName: "person.circle")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hola usuario")
                    .font(.largeTitle)
                    .border(Color.black)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .lineLimit(10)
                    .shadow(radius: 10)
                    .padding(.all)
                
                Text("Tu saldo actual es de:")
                Text("$3, 457.23").padding()
                Spacer()
                
            }
            HStack{
                Button(action: {
                    print("Movimientos")
                }) {
                    Text("Movimientos")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 10 )
                }
                Button(action: {
                    print("Mi perfil")
                }) {
                    Text("Mi perfil")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 10 )
                }
            }
        }
        
               }
    
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Dashboardview()
    }
}
