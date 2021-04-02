//
//  ProfileViewController.swift
//  BeMyMate
//
//  Created by Valeria Muldt on 20.03.2021.
//

import UIKit
import SwiftUI

struct ProfileView: View {
    
    @State private var image: Image? = Image("")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
    var body: some View {
        ScrollView (.vertical) {
            VStack {
                VStack {
                    image!
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .shadow(radius: 2)
                        .onTapGesture { self.shouldPresentActionScheet = true }
                        .sheet(isPresented: $shouldPresentImagePicker) {
                            SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
                    }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                        ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = true
                        }), ActionSheet.Button.default(Text("Photo Library"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = false
                        }), ActionSheet.Button.cancel()])
                    }.padding()
                }
                VStack {
                    VStack {
                        Text("Имя")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 325, height: 21, alignment: .topLeading)
                        TextField("", text: .constant(""))
                            .textFieldStyle(RegistrationTextFieldStyle())
                        Spacer()
                            .frame(height: 25)
                        Text("Фамилия")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 325, height: 21, alignment: .topLeading)
                        TextField("", text: .constant(""))
                            .textFieldStyle(RegistrationTextFieldStyle())
                        Spacer()
                            .frame(height: 25)
                        Text("Специальность")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 325, height: 21, alignment: .topLeading)
                        TextField("", text: .constant(""))
                            .textFieldStyle(RegistrationTextFieldStyle())
                    }
                    Spacer()
                        .frame(height: 21)
                    VStack {
                        Text("Мои навыки")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 325, height: 21, alignment: .topLeading)
                        TextField("", text: .constant(""))
                            .textFieldStyle(RegistrationTextFieldStyle())
                        Spacer()
                            .frame(height: 25)
                        Text("Мои контакты")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 325, height: 21, alignment: .topLeading)
                        TextField("", text: .constant(""))
                            .textFieldStyle(RegistrationTextFieldStyle())
                    }
                }
                Spacer()
            }
        }
    }
}

// MARK: -

class ProfileViewController: UIHostingController<ProfileView> {

    // MARK: - Initializers

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ProfileView())
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

struct ProfileView_Preview: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
