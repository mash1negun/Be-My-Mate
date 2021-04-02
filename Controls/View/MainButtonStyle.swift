
import SwiftUI

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View { configuration.label
            .font(.callout)
            .frame(width: 293, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding()
            .background(Color("mainColor"))
            .cornerRadius(5)
            .foregroundColor(.black)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color("mainColor"), lineWidth: 5)
                    .frame(width: 325, height: 50)
        )
    }
}
