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
            Text(brew.name)
                .padding()
                .frame(alignment: .top)
        }
        .padding()
    }
}

struct SavedRow_Previews: PreviewProvider {
    static var previews: some View {
        SavedRow(brew: savedBrews[0])
    }
}
