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
       
        NavigationView()
        {
            VStack {
                
                ZStack{
                    Text("Vanilla BK").foregroundColor(Color .blue).font(.system(size: 54) .italic()).padding(0.1).offset(x:0,y: -150)
                   
                    ZStack {
                        
                        HStack{
                            CardView(atributo :"Balance: ", data:"$1500",cta: 1291)
                            Image("money-bag").resizable() .frame(width: 100, height:100)
                        }.frame(width: 320.0, height: 200.0).padding(17).background(Color .blue.opacity(0.6)).foregroundColor(.white).cornerRadius(20)
                        
                        VStack{
                            Text("Realizar trasferencia")
                            NavigationLink(destination: TransferView()){
                                
                                
                                HStack{
                                    Image("money").resizable() .frame(width: 70, height:70)
                                    Image("transfers").resizable() .frame(width: 70, height:70)
                                    Image("money").resizable() .frame(width: 70, height:70)
                                    Image("transfers").resizable() .frame(width: 70, height:70)
                                }
                            }
                            
                        }.frame(width: 320.0, height: 100.0).padding(17).background(Color .blue.opacity(0.6)).foregroundColor(.white).cornerRadius(20).offset(x: 0,y:190)
                        
                        VStack{
                            Text("Realizar trasferencia")
                            MovementsView().frame(width: 320.0, height: 270.0).cornerRadius(30)
                        }.frame(width: 320.0, height: 270.0).padding(17).background(Color .blue.opacity(0.5)).foregroundColor(.white).cornerRadius(20).offset(x: 0,y:420)
                    }
                    
                        
                        
                    HStack{
                        
                        NavigationLink(destination: UserProfile()){
                            Text("! Hola soy un nombre de usuario ¡").foregroundColor(Color .white ).font(.system(size: 15)).italic()
                            Image("user").resizable()
                                .frame(width: 35, height:35)
                        }.offset(x:0,y:-100)}

                    }
                    
                
                
                Spacer()
                
                
            }.padding(20).background(Color .blue.opacity(0.2))
        }
          
    }
    }
    



struct CardView: View {
    var texto: String
    var dta : String
    var ctaa : Int
    
    init(atributo :String, data: String, cta: Int){
        self.texto = atributo
        self.dta = data
        self.ctaa = cta
    }
    var body: some View {
       
        HStack{
           
            VStack{
                Text(texto).font(.system(size: 14) .italic())
                Spacer()
                Text(dta).font(.system(size: 19))
                Spacer()
                Text(String(ctaa)).font(.system(size: 14))
            }.padding(5)
            Spacer()
            
        }.padding(25).foregroundColor(.white)
        
    }
    
    
}


struct CardViewTrasfers: View {
    var texto: String
    var dta : String
    
    init(atributo :String, data: String){
        self.texto = atributo
        self.dta = data
    }
    var body: some View {
       
        HStack{
            
          
            
        }
        
    }
    
    
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Dashboardview()
    }
}
