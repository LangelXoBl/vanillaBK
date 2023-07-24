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
                    Text("Vanilla BK").font(.system(size: 54)).padding(0.1).offset(x:0,y: -150)
                    ZStack {
                        
                        HStack{
                            CardView(atributo :"Balance: ", data: dataUser?.balance ?? 0,cta: card?.card ?? "XX-XX-XX-XX")
                        }.frame(width: 320.0, height: 180.0).padding(17).background(Color .white).cornerRadius(20)
                        
                        VStack{
                            Text("Realizar trasferencia").fontWeight(.bold)
                            NavigationLink(destination: TransferView()){
                                
                                
                                HStack{
                                 
                                    Image("transfers").resizable() .frame(width: 50, height:50)
                                }
                            }
                            
                        }.frame(width: 320.0, height: 90.0).padding(17).background(Color .white).cornerRadius(20).offset(x: 0,y:190)
                        
                        VStack{
                            MovementsView().frame(width: 355.0, height: 270.0).cornerRadius(30).padding(.top, (0))
                        }.frame(width: 310.0, height: 270.0).padding(20).cornerRadius(20).offset(x: 0,y:420)
                    }
                    

                    }
                HStack{
                        NavigationLink(destination: UserProfile(item: user, cardDetail: card)){
                            Text("Hola,  \(userName) ").font(.system(size: 25)).foregroundColor(Color.black)
                            Image("user").resizable()
                                .frame(width: 35, height:35)
                        }.offset(x:0,y:-240)}
                    
                
                
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
            
                HStack{
                    Text(texto).font(.system(size: 15))
                    Text("$"+String(dta)).font(.system(size: 18).bold())
                }.padding(.bottom, (10))
                
                Text(ctaa).font(.system(size: 18))
            }
            Spacer()
            
        }.padding(25)
        
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
