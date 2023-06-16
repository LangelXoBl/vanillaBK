import SwiftUI
import LocalAuthentication


struct LoginView: View {
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
            VStack {
                Text("Vanilla BK")
                Text("Login")
                TextField("username", text: $username)
                TextField("password", text: $password)
                Toggle(isOn: $keep){
                    Text("Mantener session")
                }
                Toggle(isOn: $faceId){
                    Text("Iniciar con id")
                }
                Button("Login"){
                    
                    print("tab")
                    isAuth = true
                    UserDefaults.standard.set(keep, forKey: "save")
                    
                    if(keep){
                       UserDefaults.standard.set(faceId, forKey: "faceId")
                       UserDefaults.standard.set(username, forKey: "user")
                       UserDefaults.standard.set(password, forKey: "pass")}
                    if(!faceId){
                    UserDefaults.standard.set(faceId, forKey: "faceId")}
                }.onAppear(){
                     //pide permiso
                    
                    isAuth = false
                    if(faceId){
                        authenticate()}
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
        //LoginView()
        MainView()
    }
}
