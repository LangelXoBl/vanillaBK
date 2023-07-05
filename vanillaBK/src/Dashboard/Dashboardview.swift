//
//  ContentView.swift
//  VanillaBk
//
//  Created by IMAC 11 on 25/05/23.
//

import SwiftUI

struct Dashboardview: View {
    @State var name = UserDefaults.standard.string(forKey: "user") ?? "Anonimo"
    var body: some View {
        
        VStack {
            
            ZStack {
                HStack{
                    Text("hello")
                }.frame(width: 200.0, height: 200.0).padding(20).background(Color .black).foregroundColor(.white).cornerRadius(20)
                
                HStack{
                    Card(atributo :"data", data:"test")
                    
                }.frame(width: 200.0, height: 100.0).padding(10).background(Color .blue).foregroundColor(.white).cornerRadius(20).offset(x: 0,y:170)
                
               }
            Spacer()
            
            }
            
          
        }
    }
    



struct CardView: View {
    var texto: String
    var dta : String
    
    init(atributo :String, data: String){
        self.texto = atributo
        self.dta = data
    }
    var body: some View {
       
        HStack{
            
            VStack{
                Text(texto).font(.system(size: 14))
                Text(dta).font(.system(size: 14))
            }.padding(5)
            Spacer()
            
        }.padding(20).background(Color .black).foregroundColor(.white).cornerRadius(20)
        
    }
    
    
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Dashboardview()
    }
}
