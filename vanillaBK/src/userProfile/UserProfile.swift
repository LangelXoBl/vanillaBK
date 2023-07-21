//
//  UserProfile.swift
//  Vanilaa
//
//  Created by IMAC_02 on 25/05/23.
//

import SwiftUI
import ModalView

struct UserProfile: View {
    let gradient = Gradient(colors: [.blue, .purple])
    
   @State var item: DataRes?
  @State var userName: String = "Anonimous"
    @State var cardDetail : CardUser?
    
    
    var body: some View {
        NavigationView(){
            
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        VStack {
                            
                            Text("Hola \(userName)").font(.system(size: 25))
                            Text(String(cardDetail?.card ?? "123")).font(.system(size: 27))
                        }.frame(width: 350, height: 170).background(Color .blue .opacity(0.6)).cornerRadius(20)
                      
                        
                        HStack{
                            Text("Edit profile").foregroundColor(.black).italic().bold().padding(.top, 8)
                            Spacer()
                            
                            ModalPresenter {
                                ModalLink(destination: EditUserData(username: userName,
                                                                    last_name: item?.lastname ?? "My last name",
                                                                    email: item?.email ?? "My email",
                                                                    phone: item?.phone ?? "My phone",
                                                                    account: cardDetail?.card ?? "123",
                                                                    rfc: item?.rfc ?? "My RFC"
                                                                   )) {
                                           
                                                Image(systemName: "pencil").resizable()
                                                                                .aspectRatio(contentMode: .fill)
                                                                                .frame(width: 25, height: 25).colorMultiply(.black)
                                    }
                        }
                                }
                            
                            
                        
                        HStack{
                            HStack{
                                Card(atributo :"Last name", data: item?.lastname ?? "test", iconn: "key")
                                Card(atributo :"key", data:  cardDetail?.card_account ?? "card_account", iconn: "key")
                                
                            }.padding(11)
                        }.background(Color .blue).cornerRadius(10)
                        
                        VStack{
                            
                            VStack{
                                Bottom(atributo :"phone", data:item?.phone ?? "na", icon: "phone")
                                Bottom(atributo :"email", data: item?.email ?? "AksqQhadydg7TRdfgUIJH", icon: "mail")
                                Bottom(atributo :"Key", data: cardDetail?.card_account ?? "loding" , icon: "key")
                                
                                
                            }.padding(11)
                        }.background(Color .blue .opacity(0.6)).cornerRadius(10)
                        Bottom(atributo :"Sing out", data:"", icon: "square.and.arrow.up").onTapGesture{
                            
                                
                                let save = UserDefaults.standard.bool(forKey: "save")
                                print(save)
                                        if(!save){
                                    UserDefaults.standard.set("a", forKey: "user")
                                    UserDefaults.standard.set("a", forKey: "pass")}
                            
                        }
                        
                        
                        
                    }
                  
                    Spacer()
                
                }
                
                
                Spacer()
                
                 
              
               
            }.background(Color .blue .opacity(0.2))
        }.onAppear(){
            
            if let item = item {
                userName = item.name
                
                print(userName)
            }
        }
       
        
       
    }
}

struct Card: View {
    var texto: String
    var dta : String
    var icon :String
    init(atributo :String, data: String, iconn : String){
        self.texto = atributo
        self.dta = data
        self.icon = iconn
    }
    var body: some View {
       
        HStack{
           Spacer()
            VStack{
                Image(systemName: icon).resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 15, height: 15)
                Text(texto).font(.system(size: 14))

                Text(dta).font(.system(size: 14))
            }.padding(5)
            Spacer()
            
        }.padding(20).background(Color .black .opacity(0.3)).foregroundColor(.white).cornerRadius(10)
        
    }
    
    
}

struct Bottom: View {
    var texto: String
    var dta : String
    var icon :String
    
    init(atributo :String, data: String, icon:String){
        self.texto = atributo
        self.dta = data
        self.icon = icon
    }
    var body: some View {
       
        HStack{
            
            HStack{
                Image(systemName: icon).resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 15, height: 15)
                Text(texto).font(.system(size: 14))
                Spacer()
                Text(dta).font(.system(size: 14))
            }
            Spacer()
            
        }.padding(25).background(Color .black .opacity(0.8)).foregroundColor(.white).cornerRadius(20)
        
    }
    
    
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack{
            UserProfile()
            
        }
        
    }
}
