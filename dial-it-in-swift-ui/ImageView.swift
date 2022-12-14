//
//  ImageView.swift
//  dial-it-in-swift-ui
//
//  Created by Justin Boyer on 12/13/22.
//

import SwiftUI

struct ImageView: View {
    @State private var hasPhoto: Bool = false
    @State private var openCameraRoll: Bool = false
    @State private var saveImage = UIImage()
    var body: some View {
        Button(action:{
            hasPhoto = true
            openCameraRoll = true
        }){
            ZStack(alignment: .bottomTrailing) {
                if(hasPhoto){
                    Image(uiImage: saveImage)
                        .resizable()
                       .scaledToFit()
                } else{
                    Image("bag")
                        .resizable()
                       .scaledToFit()
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.dialRed)
                        .scaledToFit()
                        .accessibility(label: Text("Add picture"))
                }
   

                
            }.sheet(isPresented: $openCameraRoll) {
                ImagePicker(selectedImage: $saveImage, sourceType: .photoLibrary) //Wanted to use the camera here but I only have an emulator to test and it isn't supported so I stick with the library instead
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}

//https://www.youtube.com/watch?v=tMprUZDgAxo&t=786s
