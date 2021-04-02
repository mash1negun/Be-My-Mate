
import UIKit
import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 200)
                Text("Войти")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 120)
                Group {
                    TextField("Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RegistrationTextFieldStyle())
                    Spacer()
                        .frame(height: 32)
                    TextField("Пароль", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RegistrationTextFieldStyle())
                }
                Spacer()
                    .frame(height: 120)
                Button(action: {
                    print("Войти")
                }, label: {
                    Text("Войти")
                }).buttonStyle(MainButtonStyle())
                Spacer()
                    .frame(height: 272)
            }
        }
    }
}

// MARK: -

class LoginViewController: UIHostingController<LoginView> {

    // MARK: - Initializers

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: LoginView())
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
