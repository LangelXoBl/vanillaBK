//
//  UserProfile.swift
//  Vanilaa
//
//  Created by IMAC_02 on 25/05/23.
//

import SwiftUI

struct UserProfile: View {
    let gradient = Gradient(colors: [.blue, .purple])
    var body: some View {
        NavigationView(){
            
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        VStack {
                            
                            Image("profile-user")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                                .cornerRadius(200)
                                .clipShape(Circle())
                                .clipped()
                                .padding(.top, 44)
                        }.frame(maxWidth: .infinity).background(Color .blue).cornerRadius(40)
                        
                        
                        HStack{
                            Text("User Profile").foregroundColor(.black).italic().bold().padding(.top, 8)
                            Spacer()
                            
                            NavigationLink(destination:EditUserData()){
                                Image(systemName: "pencil").resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: 25, height: 25).colorMultiply(.black)
                            }
                            
                        }.padding(20)
                        
                        HStack{
                            Card(atributo :"data", data:"test")
                            Card(atributo :"data", data:"test")
                        }
                        
                        Bottom(atributo :"phone", data:"AksqQhadydg7TRdfgUIJH", icon: "phone")
                        Bottom(atributo :"email", data:"AksqQhadydg7TRdfgUIJH", icon: "mail")
                        Bottom(atributo :"Key", data:"AksqQhadydg7TRdfgUIJH", icon: "key")
                        
                    }
                    Spacer()
                    
                }
                Spacer()
                
                 
              
               
            }//.background(LinearGradient(gradient : gradient, startPoint: .top,endPoint: .bottom))
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
