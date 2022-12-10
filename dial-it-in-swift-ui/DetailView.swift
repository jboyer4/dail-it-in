//
//  Detail view.swift
//  dial-it-in-swift-ui
//
//  Created by Justin Boyer on 12/10/22.
//

import SwiftUI

struct DetailView: View {
    var brew: BrewStorageModel
    var body: some View {
        VStack{
            HStack{
                Image("bag")
                    .resizable()
                    .scaledToFit()
                    .frame(alignment: .top)
                Text(brew.name)
                    .font(.title)
                    .padding(30)
                Spacer()
            }
            .frame(alignment: .top)
            HStack{
                VStack{
                    Text(String(format: "Dose: %.2f g", brew.dose))
                    Text(String(format:"Yield: %.2f g", brew.yield))
                }
                .padding([.trailing], 30)
                VStack{
                    Text("Grind size: " + brew.grindSize)
                    Text(String(format: "Temp: %.2f F", brew.temperature))
                }
                Spacer()
            }
            .padding(30)
            HStack {
                Spacer()
                Text(String(format: "Time: %.2f sec", brew.time))
            }
            HStack{
            Text("Notes: " + brew.notes)
                .padding(30)
            Spacer()
            }

        }
        Spacer()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(brew: savedBrews[0])
    }
}
