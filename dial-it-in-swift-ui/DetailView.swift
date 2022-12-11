//
//  Detail view.swift
//  dial-it-in-swift-ui
//
//  Created by Justin Boyer on 12/10/22.
//

import SwiftUI

struct DetailView: View {
    var brew: BrewStorageModel
    func openShare() -> Void {
        let recipie = String(
            "Name: " + brew.name + "\n" +
            "Grind: " + brew.grindSize + "\n" +
            String(format: "Dose: %.2f g\n", brew.dose) +
            String(format: "Yield: %.2f g\n", brew.yield) +
            String(format: "Temperature: %.2f F\n", brew.temperature) +
            String(format: "Time: %.2f sec\n", brew.time) +
            "Notes: " + brew.notes
        )
        let view = UIActivityViewController(activityItems: [recipie], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(view, animated: true, completion: nil)
        //This is deprecated but my computer is too old to run the new iOS version
    }
    
    var body: some View {
        VStack{
            HStack{
                Image("bag")
                    .resizable()
                    .scaledToFit()

                HStack {
                    Text(brew.name)
                        .font(.title)

                    Button(action: openShare){
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                .padding([.leading], 10)
            }
            .padding([.trailing], 30)
            
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
            .foregroundColor(.white)
            .background(Color.dialBlue)
            
            HStack {
                Spacer()
                Text(String(format: "Time: %.2f sec", brew.time))
            }
            .padding(20)
            .foregroundColor(.white)
            .background(Color.dialRed)
            
            HStack{
            Text("Notes: " + brew.notes)
                .padding([.trailing], 30)
            Spacer()
            }
            .foregroundColor(.white)
            .background(Color.dialBlue)

        }
        Spacer()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(brew: savedBrews[0])
    }
}
