//
//  ColorSliderView.swift
//  KoshlakovSV_HW3.2
//
//  Created by Koshlakov Sergey on 26.07.2020.
//  Copyright © 2020 Koshlakov Sergey. All rights reserved.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var colorValue: Double
    @State var showAlert: Bool = false
    @State var textColor: Color
    @State var textValue: String



    var body: some View {
        HStack {
            Text("\(lround(colorValue))").foregroundColor(textColor)
            
            Slider(value: $colorValue, in: 0...255, step: 1, onEditingChanged: {_ in self.onEditingChangedSlider() })
            .accentColor(textColor)

            TextField("", text: $textValue, onEditingChanged: {_ in }, onCommit: { self.onEditingChangedTextField() } )
            .frame(width: 40)
            .bordered(with: textColor)
            .foregroundColor(textColor)
            .multilineTextAlignment(.center)
            .alert(isPresented: $showAlert) {
                    Alert(title: Text("Wrong value"))
            }

        }
        .padding()
    }

    private func onEditingChangedSlider() {
        textValue = "\(lround(colorValue))"
    }

    private func onEditingChangedTextField() {
        if Int(textValue) == nil || Int(textValue)! > 255 || textValue.count > 3 {
            showAlert = true
            textValue = "\(lround(colorValue))"
        } else {
            colorValue = Double(textValue)!
        }
    }
}

//struct ColorSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorSliderView(colorValue: .constant(10), textColor: .red)
//    }
//}

extension View {
    func bordered(with color: Color) -> some View {
        modifier(Bordered(color: color))
    }

}

struct Bordered : ViewModifier {
    var color: Color

    func body(content: Self.Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: 2).stroke(color, lineWidth: 2)
        )
    }
}
