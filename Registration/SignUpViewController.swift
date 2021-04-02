
import UIKit
import SwiftUI

struct SignUpView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 200)
                Text("Регистрация")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 120)
                Group {
                    TextField("Имя и фамилия", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RegistrationTextFieldStyle())
                    Spacer()
                        .frame(height: 32)
                    TextField("Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RegistrationTextFieldStyle())
                    Spacer()
                        .frame(height: 32)
                    TextField("Пароль", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RegistrationTextFieldStyle())
                }
                Spacer()
                    .frame(height: 83)
                Button(action: {
                    print("Создать аккаунт")
                }) {
                    Text("Зарегистрироваться")
                }.buttonStyle(MainButtonStyle())
                Spacer()
                    .frame(height: 223)
            }
        }
    }
}

// MARK: -

class SignUpViewController: UIHostingController<SignUpView> {

    // MARK: - Initializers

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SignUpView())
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
