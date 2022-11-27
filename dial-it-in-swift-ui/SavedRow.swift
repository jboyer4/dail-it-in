//
//  SavedRow.swift
//  dial-it-in-swift-ui
//
//  Created by Justin Boyer on 11/27/22.
//

import SwiftUI

struct SavedRow: View {
    var brew: BrewStorageModel
    var body: some View {
        HStack{
            Image("bag")
                .resizable()
                .scaledToFit()
                .frame(alignment: .top)
                .frame(maxWidth: 100, maxHeight: 100)
            Spacer()
            VStack{
                Text(String(format: "Dose: %.2f g", brew.dose))
                Text(String(format:"Yield: %.2f g", brew.yield))
            }
            VStack{
                Text(String(format: "Temp: %.2f F", brew.temperature))
                Text(String(brew.notes))
            }
        }
        .padding()
    }
}

struct SavedRow_Previews: PreviewProvider {
    static var previews: some View {
        SavedRow(brew: savedBrews[0])
    }
}
