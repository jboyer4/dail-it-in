//
//  ContentView.swift
//  dial-it-in-swift-ui
//
//  Created by Justin Boyer on 11/5/22.
//

import SwiftUI

struct Entrypoint: View {

    var body: some View {
        NavigationView{
            VStack {
                Image("shots")
                    .resizable()
                    .scaledToFit()
                    .frame(alignment: .top)
                Spacer()
                NavigationLink(destination: BrewPage()){
                        Text("Let's Brew")
                    }
                    .padding()
                    .background(Color.dialBlue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)

                NavigationLink(destination: SavedList()){
                        Text("Saved Cups")
                    }
                    .padding()
                    .background(Color.dialBlue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                Spacer()
            }

        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Entrypoint()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
