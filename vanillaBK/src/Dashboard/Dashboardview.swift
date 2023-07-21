//
//  ContentView.swift
//  VanillaBk
//
//  Created by IMAC 11 on 25/05/23.
//

import SwiftUI

struct Dashboardview: View {
    @State var name = UserDefaults.standard.string(forKey: "user") ?? "Anonimo"
    @State var card: CardUser?
    @State var dataUser: DataDetail?
    @State var user: DataRes?
    @State var userName: String = "Anonimous"
    
    var body: some View {
       
        NavigationView()
        {
            VStack {
                
                ZStack{
                    Text("Vanilla BK").foregroundColor(Color .blue).font(.system(size: 54) .italic()).padding(0.1).offset(x:0,y: -150)
                   
                    ZStack {
                        
                        HStack{
                            CardView(atributo :"Balance: ", data: dataUser?.balance ?? 0,cta: card?.card ?? "XXXXXXXX")
                            Image("money-bag").resizable() .frame(width: 90, height:90)
                        }.frame(width: 320.0, height: 180.0).padding(17).background(Color .blue.opacity(0.6)).foregroundColor(.white).cornerRadius(20)
                        
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
                            Text("Trasferencias")
                            MovementsView().frame(width: 320.0, height: 270.0).cornerRadius(30)
                        }.frame(width: 320.0, height: 270.0).padding(17).background(Color .blue.opacity(0.5)).foregroundColor(.white).cornerRadius(20).offset(x: 0,y:420)
                    }
                    
                        
                        
                    HStack{
                        
                        NavigationLink(destination: UserProfile(item: user, cardDetail: card)){
                            Text("! Hola \(userName) ¡").foregroundColor(Color .white ).font(.system(size: 25)).italic()
                            Image("user").resizable()
                                .frame(width: 35, height:35)
                        }.offset(x:0,y:-80)}

                    }
                    
                
                
                Spacer()
                
                
            }.padding(20).background(Color .blue.opacity(0.2))
        }.onAppear{
            Task{
                do {
                    let rs = try await APIBK().getUserData()
                    if let result = rs?.message {
                        print(result)
                    }
                    if let data = rs?.data {
                        print(data)
                        card = data.card[0]
                        dataUser = data
                        user = data.user
                        userName = data.user.name
                        
                        if let account = card?.card{
                            UserDefaults.standard.set(account, forKey: "nCount")
                        }
                    }
                }catch{
                    print("Erro al cread")
                }
                
            }
            
        }
          
    }
    }
    



struct CardView: View {
    var texto: String
    var dta : Int
    var ctaa : String
    
    init(atributo :String, data: Int, cta: String){
        self.texto = atributo
        self.dta = data
        self.ctaa = cta
    }
    var body: some View {
       
        HStack{
           
            VStack{
                Spacer()
                HStack{
                    Text(texto).font(.system(size: 15) .italic())
                    Text("$"+String(dta)).font(.system(size: 15).bold())
                }
                Spacer()
                Text(ctaa).font(.system(size: 14))
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
