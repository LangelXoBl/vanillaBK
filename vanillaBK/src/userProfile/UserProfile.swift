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
                    
                    
                    Text("User Profile").foregroundColor(.black).italic().bold().padding(.top, 8)
                    HStack{
                        Card(atributo :"Phone", data:"9983191783")
                        Card(atributo :"Email", data:"alguien@gmail.com")
                    }
                    
                    Bottom(atributo :"Key", data:"AksqQhadydg7TRdfgUIJH")
                    Bottom(atributo :"Key", data:"AksqQhadydg7TRdfgUIJH")
                    Bottom(atributo :"Key", data:"AksqQhadydg7TRdfgUIJH")
                   
                    
                }
                Spacer()
                
            }
            Spacer()
            
             
          
           
        }//.background(LinearGradient(gradient : gradient, startPoint: .top,endPoint: .bottom))
        
       
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
    
    init(atributo :String, data: String){
        self.texto = atributo
        self.dta = data
    }
    var body: some View {
       
        HStack{
            
            HStack{
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
