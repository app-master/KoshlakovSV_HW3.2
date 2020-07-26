//
//  ColorView.swift
//  KoshlakovSV_HW3.2
//
//  Created by Koshlakov Sergey on 24.07.2020.
//  Copyright © 2020 Koshlakov Sergey. All rights reserved.
//

import SwiftUI

struct ColorView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double

    var body: some View {
        VStack {
            Color(UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1))
                .edgesIgnoringSafeArea(.all)
                .frame(height: 160)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16, style: .circular).stroke(Color.white, lineWidth: 8))
                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
        }
    }
}

//struct ColorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorView(fillColor: UIColor.black)
//    }
//}
