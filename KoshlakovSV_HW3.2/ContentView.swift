//
//  ContentView.swift
//  KoshlakovSV_HW3.2
//
//  Created by Koshlakov Sergey on 24.07.2020.
//  Copyright © 2020 Koshlakov Sergey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue: Double = 10
    @State private var greenValue: Double = 10
    @State private var blueValue: Double = 10

    var body: some View {
        ZStack {
            Color.yellow
                .opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ColorView(red: $redValue, green: $greenValue, blue: $blueValue)
                ColorSliderView(colorValue: $redValue, textColor: .red, textValue: "\(lround(redValue))")
                ColorSliderView(colorValue: $greenValue, textColor: .green, textValue: "\(lround(greenValue))")
                ColorSliderView(colorValue: $blueValue, textColor: .blue, textValue: "\(lround(blueValue))")
                Spacer()
            }
            .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
