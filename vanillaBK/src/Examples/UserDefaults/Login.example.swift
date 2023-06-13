//
//  Login.example.swift
//  vanillaBK
//
//  Created by imac_01 on 12/06/23.
//

import SwiftUI
import LocalAuthentication

struct Login_example: View {
    @State private var username:
    String = ""
    @State private var password:
    String = ""
    @State private var keep:
    Bool = false
    //@Binding var isAuth: Bool
    var context = LAContext() // contexto la usar el feceID
    func authenticate() {
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Acceder con faceID"){
                success, authenticateError in
                if (success){
                    print("User auth Success")
                    //isAuth = true
                } else if ((authenticateError) != nil){
                    print("Auth failed")
                    print(authenticateError?.localizedDescription ?? "No error")
                } else {
                    print("Biometric unavailable")
                    print(error?.localizedDescription ?? "Error principal")
                }
            }
        }
    }
    
    var body: some View {
            VStack {
                Text("Login")
                TextField("username", text: $username)
                TextField("username", text: $password)
                Toggle(isOn: $keep){
                    Text("Mantener session")
                }
                Button("Login"){
                    authenticate()
                    UserDefaults.standard.set(username, forKey: "user")
                    UserDefaults.standard.set(password, forKey: "pass")
                }
                
            }
        }
    
}

struct MainView_example: View {
    @State var user = UserDefaults.standard.string(forKey: "user") ?? "NA"
    @State var pass = UserDefaults.standard.string(forKey: "pass") ?? "NA"
    var body: some View {
        VStack{
            Text("Data View")
            Text(user)
            Text(pass)
        }.onAppear{
            user = UserDefaults.standard.string(forKey: "user") ?? "NA"
            pass = UserDefaults.standard.string(forKey: "pass") ?? "NA"
        }
    }
}

struct Login_example_Previews: PreviewProvider {
    @State private var isAuth:
    Bool = false
    static var previews: some View {
        Login_example()
        //MainView_example()
    }
}
