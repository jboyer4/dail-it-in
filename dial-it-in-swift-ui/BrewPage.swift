//
//  BrewPage.swift
//  dial-it-in-swift-ui
//
//  Created by Justin Boyer on 11/25/22.
//

import SwiftUI

struct BrewPage: View {
    @ObservedObject var currentBrew: BrewModel = BrewModel()
    private static let formatter: NumberFormatter = {
          let formatter = NumberFormatter()
          formatter.numberStyle = .decimal
          return formatter
      }()
    var body: some View {
            VStack {
                Image("shots")
                    .resizable()
                    .scaledToFit()
                    .frame(alignment: .top)
                VStack {
                    HStack {
                        Text("Method:")
                            .padding()
                        TextField("Method", text: $currentBrew.method)
                            .foregroundColor(Color.dialRed)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .opacity(0.8)
                            .padding()
                    }
                    .background(.brown)
                    
                    HStack {
                        Text("Grind:")
                            .padding()
                        TextField("Grind size", text: $currentBrew.grindSize)
                            .keyboardType(.numberPad)
                            .foregroundColor(Color.dialRed)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .opacity(0.8)
                            .padding()
                    }
                    .background(.brown)
                    
                    HStack {
                        Text("Dose:")
                            .padding()
                        TextField("Ground coffee in grams", text: $currentBrew.dose.value)
                            .foregroundColor(Color.dialRed)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .opacity(0.8)
                            .keyboardType(.numberPad)
                    }
                    .background(.brown)
                    
                    HStack {
                        Text("Temperature:")
                            .padding()
                        TextField("Temperature in Fahrenheit", text: $currentBrew.temperature.value)
                            .foregroundColor(Color.dialRed)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .opacity(0.8)
                            .padding()
                    }
                    .background(.brown)

                    NavigationLink(destination: TimerPageView(currentBrew: currentBrew)){
                            Text("Start Brewing")
                        }
                        .padding()
                        .background(Color.dialRed)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(10)
                        .accessibilityLabel(Text("Continue"))
                }
            }
        }
}

struct BrewPage_Previews: PreviewProvider {
    static var previews: some View {
        BrewPage()
    }
}

//References:
//https://stackoverflow.com/questions/58406224/how-to-detect-when-a-textfield-loses-the-focus-in-swiftui-for-ios
//https://swiftwithmajid.com/2021/03/03/focusedvalue-and-focusedbinding-property-wrappers-in-swiftui/
//https://stackoverflow.com/questions/61073146/swiftui-validate-input-in-textfields
