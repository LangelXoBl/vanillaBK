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
                        }.frame(width: 320, height: 150).background(Color .blue .opacity(0.6)).cornerRadius(20)
                      
                        
                        HStack{
                            Text("Edit profile").foregroundColor(.black).italic().bold().padding(15)
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
                                                                                .frame(width: 20, height: 20).colorMultiply(.black)
                                    }
                        }
                        }.frame(width: 320, height: 50).background(Color .white .opacity(0.6)).cornerRadius(14).padding(8)
                            
                            
                        
                        HStack{
                            HStack{
                                Card(atributo :"Last name", data: item?.lastname ?? "test", iconn: "key")
                                Card(atributo :"key", data:  cardDetail?.card_account ?? "card_account", iconn: "key")
                                
                            }.padding(11).frame(width: 320, height: 100)
                        }.background(Color.white.opacity(0.6)).cornerRadius(10)
                        
                        VStack{
                            
                            VStack{
                                Bottom(atributo :"phone", data:item?.phone ?? "na", icon: "phone").frame(width: 320, height: 50)
                                    .background(Color.white.opacity(0.6))
                                    .cornerRadius(14).padding(.top, 15.0)
                                Bottom(atributo :"email", data: item?.email ?? "AksqQhadydg7TRdfgUIJH", icon: "mail").frame(width: 320, height: 50)
                                    .background(Color.white.opacity(0.6))
                                    .cornerRadius(14).padding(.top, 15.0)
                                Bottom(atributo :"Key", data: cardDetail?.card_account ?? "loding" , icon: "key").frame(width: 320, height: 50)
                                    .background(Color.white.opacity(0.6))
                                    .cornerRadius(14).padding(.top, 15.0)
                                
                                
                            }.padding(11)
                        }.cornerRadius(10)
                        
                        BottomSingout(atributo :"Sing out", data:"").onTapGesture{
                                
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
            
        }.padding(20).cornerRadius(10)
        
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
            
        }.padding(25).cornerRadius(20)
        
    }
    
    
}
struct BottomSingout: View {
    var texto: String
    var dta : String
  
    
    init(atributo :String, data: String){
        self.texto = atributo
        self.dta = data
     
    }
    var body: some View {
       
        HStack{
            
            HStack{
                Text(texto)
                Text(dta)
            }.fontWeight(.bold)
                .frame(width: 320, height: 50)
                .foregroundColor(.black)
                .background(
                     Color(red: 0.5098039215686274, green: 0.5803921568627451, blue: 0.7686274509803922 , opacity: 1.0)
                ).cornerRadius(14)
        }
    }
    
    
}
struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack{
            UserProfile()
            
        }
        
    }
}
