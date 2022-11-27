//
//  TimerPage.swift
//  dial-it-in
//
//  Created by Justin Boyer on 11/8/22.
//

import SwiftUI

struct TimerPageView: View {
    @ObservedObject var currentBrew: BrewModel
    var body: some View {
            VStack {
                Image("espresso-photo-range-min")
                    .resizable()
                    .scaledToFit()
                    .frame(alignment: .top)
                    .clipShape(Circle())
                TimerView(savedTime: $currentBrew.time)
                NavigationLink(destination: SavePage(currentBrew: currentBrew)){
                    HStack {
                        Text("next")
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                            .padding([.top, .bottom], 20)
                            .padding(.leading, 10)
                        Image(systemName: "cup.and.saucer.fill")
                            .padding(10)
                            .foregroundColor(Color.white)
                    }
                    .background(Color.dialBlue)
                    .cornerRadius(25)
                    .buttonStyle(PlainButtonStyle())
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
            .padding()
            .offset(y: -25)
        }
    }

struct TimerPage_Previews: PreviewProvider {
    @State static var testBrew = BrewModel()
    static var previews: some View {
        TimerPageView(currentBrew: testBrew)
    }
}

