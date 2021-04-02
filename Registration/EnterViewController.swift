
import UIKit
import SwiftUI

protocol EnterVCDelegate: AnyObject {
    func presentLoginVC()
    func presentSignUpVC()
}

// MARK: -

struct EnterView: View {

    weak var delegate: EnterVCDelegate?

    var body: some View {
        ZStack {
            VStack {
                Text("Be My Mate")
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 22)
                Text("Войдите или зарегистрируйтесь, чтобы найти себе сокомандников")
                    .font(.headline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .frame(width: 280)
                Spacer()
                    .frame(height: 189)
                Button(action: {
                    delegate?.presentLoginVC()
                }, label: {
                    Text("Войти с помощью email")
                }).buttonStyle(MainButtonStyle())
                Spacer()
                    .frame(height: 15)
                Text("ИЛИ")
                    .font(.subheadline)
                    .fontWeight(.regular)
                Spacer()
                    .frame(height: 15)
                Button(action: {
                    delegate?.presentSignUpVC()
                }, label: {
                    Text("Создать новый аккаунт")
                }).buttonStyle(MainButtonStyle())
            }
        }
    }
}

// MARK: -

class EnterViewController: UIHostingController<EnterView> {

    // MARK: - Properties

    private let regStoryboard = UIStoryboard(name: "Registration", bundle: nil)

    // MARK: - Initializers

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: EnterView())
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.delegate = self
    }

}

//MARK: - EnterVCDelegate

extension EnterViewController: EnterVCDelegate {
    func presentLoginVC() {
        guard let vc = regStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        present(vc, animated: true, completion: nil)
    }

    func presentSignUpVC() {
        guard let vc = regStoryboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        present(vc, animated: true, completion: nil)
    }
}
