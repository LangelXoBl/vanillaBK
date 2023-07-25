import SwiftUI
import LocalAuthentication

struct LogginButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 320, height: 50)
            .foregroundColor(.black)
            .background(
                configuration.isPressed ? Color(red: 0.5098039215686274, green: 0.5803921568627451, blue: 0.7686274509803922 , opacity: 1.0) : Color(red: 0.5098039215686274, green: 0.5803921568627451, blue: 0.7686274509803922)
            ).cornerRadius(14)
    }
}

struct LoginView: View {
    @State private var message: String?
    @State private var username:
    String = UserDefaults.standard.string(forKey: "user") ?? ""
    @State private var password:
    String = UserDefaults.standard.string(forKey: "pass") ?? ""
    @State private var keep:
    Bool = UserDefaults.standard.bool(forKey: "save")
    @State private var faceId:
    Bool = UserDefaults.standard.bool(forKey: "faceId")
    @Binding var isAuth: Bool
    var context = LAContext() // contexto la usar el feceID
    let ntf = NotificationHandler(title: "Hola", subititle: "Notification", body: "Soy una notificacion")
    
    func authenticate() {
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Acceder con faceID"){
                success, authenticateError in
                if (success){
                    print("User auth Success")
                    isAuth = true
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
        NavigationView{
            ZStack{
                Color.blue .opacity(0.2).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Vanilla BK").font(.system(size: 60)).fontWeight(.bold)
                        .foregroundColor(.black)
                        .lineLimit(14)
                
                    HStack{
                        TextField("username", text: $username)
                            .padding(15)
                                .frame(width: 320, height: 50)
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(14)
                    }.padding(4)
                    HStack{
                        SecureField(text: $password){
                            Text("contraseña")
                        }.padding(15)
                                .frame(width: 320, height: 50)
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(14)
                    }.padding(4)
                    Toggle(isOn: $keep){
                        Text("Mantener session")
                    }.padding(.horizontal)
                    Toggle(isOn: $faceId){
                        Text("Iniciar con id")
                    }.padding(.horizontal)
                    if let result = message{
                        Text(result).foregroundColor(.red)
                    }
                    Button("Login"){
                        
                        print("tab")
                        
                        Task{
                            do {
                                let rs = try await APIBK().login(user: loginReq(phone: username, password: password))
                                if let result = rs?.message {
                                    message = result
                                    print(result)
                                }
                                if let token = rs?.access_token {
                                    print(token)
                                    UserDefaults.standard.set(token, forKey: "token")
                                    isAuth = true
                                }
                            }catch{
                                print("Erro al cread")
                            }
                
                        }
                        
                        UserDefaults.standard.set(keep, forKey: "save")
                        
                        if(keep){
                            UserDefaults.standard.set(faceId, forKey: "faceId")
                            UserDefaults.standard.set(username, forKey: "user")
                            UserDefaults.standard.set(password, forKey: "pass")}
                        if(!faceId){
                            UserDefaults.standard.set(faceId, forKey: "faceId")}
                    }.disabled(false).fontWeight(.bold)
                        .padding(.top, 18.0)
                        .buttonStyle(LogginButton()).onAppear(){
                        //pide permiso
                        
                        isAuth = false
                        if(faceId){
                            authenticate()}
                        }
                    NavigationLink(destination: RegisterView()){
                        Text("Register")
                    }
                    
                }
            }
            
                
        }
    }
}

struct MainView: View {
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isAuth: .constant(true))
        //MainView()
    }
}
