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
                
                Image("VanillaBk").resizable().frame(width: 210, height: 160).background(Color.orange                             )
                Text("Hola UserName")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(10)
                    .shadow(radius: 20)
                    .padding(.all)
                
                Text("Tu saldo actual es de:")
                    .fontWeight(.bold)
                    
                Text("$3, 457.23").padding()
                Spacer()
                
            }
            HStack{
                Text("¿Qué vamos a hacer hoy?")
                    .font(.title)
                    .padding(.all)
            }
            HStack{
                Button(action: {
                    print("Movimientos")
                }) {
                    Text("Consultar")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 10 )
                }
                Button(action: {
                    print("Mi perfil")
                }) {
                    Text("Envíar")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 10 )
                }
                Button(action: {
                    print("Mi perfil")
                }) {
                    Text("Ajustes")
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
