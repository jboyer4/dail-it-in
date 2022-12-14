//
//  SavedList.swift
//  dial-it-in-swift-ui
//
//  Created by Justin Boyer on 11/27/22.
//

import SwiftUI

struct SavedList: View {
    var body: some View {
        List(savedBrews){brew in
            NavigationLink {
                DetailView(brew: brew)
            } label: {
                SavedRow(brew: brew)
                    .accessibilityLabel(Text(brew.name))
            }
        }
    }
}

struct SavedList_Previews: PreviewProvider {
    static var previews: some View {
        SavedList()
    }
}
