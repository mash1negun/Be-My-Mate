//
//  NewProject.swift
//  BeMyMate
//
//  Created by Завур Мамашев on 23.03.2021.
//

import SwiftUI
import UIKit

struct NewProject: View {
    
    @State private var image: Image? = Image("")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Создание проекта")
                    .font(.system(size:(21)))
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 39)
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
                }
                Spacer()
                    .frame(height: 15)
                Text("Аватар проекта")
                    .fontWeight(.bold)
                    .frame(height: 59, alignment: .top)
            }
            VStack {
                Text("Название проекта")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 325, height: 21, alignment: .topLeading)
                TextField("", text: .constant(""))
                    .textFieldStyle(RegistrationTextFieldStyle())
                Spacer()
                    .frame(height: 21)
                Text("Описание проекта")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 325, height: 21, alignment: .topLeading)
                TextField("", text: .constant(""))
                    .textFieldStyle(RegistrationTextFieldStyle())
                Spacer()
                    .frame(height: 21)
                Text("Требуемые компетенции и навыки")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 325, height: 21, alignment: .topLeading)
                TextField("", text: .constant(""))
                    .textFieldStyle(RegistrationTextFieldStyle())
                Spacer()
                Button(action: {
                    print("Создать проект")
                }) {
                    Text("Создать проект")
                }.buttonStyle(MainButtonStyle()).padding(29)
            }
        }
    }
}

struct NewProject_Previews: PreviewProvider {
    static var previews: some View {
        NewProject()
    }
}
