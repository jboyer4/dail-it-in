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

                SavedRow(brew: brew)

        }
    }
}

struct SavedList_Previews: PreviewProvider {
    static var previews: some View {
        SavedList()
    }
}
