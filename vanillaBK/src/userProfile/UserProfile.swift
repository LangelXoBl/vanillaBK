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
                    Image("profile-user")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                            .cornerRadius(200)
                        .clipShape(Circle())
                        .clipped()
                        .padding(.top, 44)
                    Text("User Profile").foregroundColor(.white).italic().bold().padding(.top, 8)
                    Bottom(atributo :"Phone", data:"9983191783")
                    Bottom(atributo :"Email", data:"alguien@gmail.com")
                    Bottom(atributo :"Key", data:"AksqQhadydg7TRdfgUIJH")
                   
                    
                }
                Spacer()
                
            }
            Spacer()
            
             
          
           
        }.background(LinearGradient(gradient : gradient, startPoint: .top,endPoint: .bottom))
        
       
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
            
            VStack{
                HStack{
                    Text(texto)
                    Spacer()
                    Text(dta)
                }
            }.padding(10)
            Spacer()
            
        }.padding(20).background(Color .black).foregroundColor(.white)
        
    }
    
    
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack{
            UserProfile()
            
        }
        
    }
}
