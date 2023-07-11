//
//  UserProfile.swift
//  Vanilaa
//
//  Created by IMAC_02 on 25/05/23.
//

import SwiftUI

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
                            Text(String(121233123)).font(.system(size: 27))
                        }.frame(width: 350, height: 170).background(Color .blue .opacity(0.6)).cornerRadius(20)
                        
                        
                        HStack{
                            Text("Edit profile").foregroundColor(.black).italic().bold().padding(.top, 8)
                            Spacer()
                            
                            NavigationLink(destination:EditUserData()){
                                Image(systemName: "pencil").resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: 25, height: 25).colorMultiply(.black)
                            }
                            
                        }.padding(20)
                        
                        HStack{
                            HStack{
                                Card(atributo :"data", data:"test")
                                Card(atributo :"data", data:"test")
                            }.padding(11)
                        }.background(Color .blue).cornerRadius(10)
                        
                        VStack{
                            
                            VStack{
                                Bottom(atributo :"phone", data:item?.phone ?? "na", icon: "phone")
                                Bottom(atributo :"email", data: item?.email ?? "AksqQhadydg7TRdfgUIJH", icon: "mail")
                               // Bottom(atributo :"Key", data: String(cardDetail?.id_account ?? "na") ?? "AksqQhadydg7TRdfgUIJH", icon: "key")
                            }.padding(11)
                        }.background(Color .blue .opacity(0.6)).cornerRadius(10)
                        Bottom(atributo :"Sing out", data:"", icon: "square.and.arrow.up")
                        
                        
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
            
        }.padding(25).background(Color .black).foregroundColor(.white).cornerRadius(20)
        
    }
    
    
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack{
            UserProfile()
            
        }
        
    }
}
