//
//  SavePage.swift
//  dial-it-in-swift-ui
//
//  Created by Justin Boyer on 11/25/22.
//

import SwiftUI

struct SavePage: View {
    @ObservedObject var currentBrew: BrewModel
    @State private var showPopup: Bool = false
    @State private var alertText: String = ""
    
    func getRatio() -> Text{
        if let yieldNum = Double(currentBrew.yield.value) {
            if let doseNum = Double(currentBrew.dose.value){
                if(yieldNum > 0.0 && doseNum > 0.0 ){
                    let ratio = doseNum/yieldNum
                    if(0.4 < ratio && ratio < 0.6 ){
                        return Text(String(format: "%.2f", ratio))
                            .foregroundColor(.white)
                    }
                    return Text(String(format: "%.2f", ratio))
                        .foregroundColor(.red)
                }
            }
        }
            return Text("Enter your yield")
            .foregroundColor(.orange)
    }
    
    var body: some View {

        VStack{
            Image("shots")
                .resizable()
                .scaledToFit()
                .frame(alignment: .top)
                .padding([.bottom], 20)

            VStack{
                HStack{
                    Text("Name:")
                        .foregroundColor(.white)
                    TextField("Enter a name", text: $currentBrew.name)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                HStack{
                    Text("Grind Size:")
                        .foregroundColor(.white)
                    Text(currentBrew.grindSize)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                HStack{
                    Text("Dose:")
                        .foregroundColor(.white)
                    Text(currentBrew.dose.value)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                HStack{
                    Text("Yield:")
                        .foregroundColor(.white)
                    TextField("Extracted shot in grams", text: $currentBrew.yield.value)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                HStack{
                    Text("Ratio:")
                        .foregroundColor(.white)
                    getRatio()
                    Spacer()
                }
                .padding()
                HStack{
                    Text("Temperature:")
                        .foregroundColor(.white)
                    Text(currentBrew.temperature.value)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                HStack{
                    Text("Time:")
                        .foregroundColor(.white)
                    Text(String(format: "%.2f", currentBrew.time))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                HStack{
                    Text("Notes:")
                        .foregroundColor(.white)
                    TextField("Additional notes", text: $currentBrew.notes)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
            }
            .background(Color.dialBlue)
        
        Button("Save") {
            if let yieldNum = Double(currentBrew.yield.value) {
                if let doseNum = Double(currentBrew.dose.value){
                    if let tempNum = Double(currentBrew.dose.value){
                        let toSave = BrewStorageModel(id: UUID(), name: currentBrew.name, grindSize: currentBrew.grindSize, dose: doseNum, yield: yieldNum, temperature: tempNum, time: currentBrew.time, notes: currentBrew.notes)
                        writeSave(toSave, filename: "savedBrews.json")
                        alertText = "Saved"
                        showPopup = true
                        currentBrew.clear()
                    } else{
                        alertText = "Temperature must be a number"
                        showPopup = true
                    }
                } else{
                    alertText = "Dose must be a number"
                    showPopup = true
                }
            } else{
                alertText = "Yield must be a number"
                showPopup = true
            }
        }
        .padding()
        .padding([.leading, .trailing], 30)
        .background(Color.dialRed)
        .foregroundColor(.white)
        .font(.headline)
        .cornerRadius(10)
        .alert(isPresented: $showPopup){
            Alert(
                title: Text(alertText)
            )
        }
    }
    }
}




struct SavePage_Previews: PreviewProvider {
    @State static var testBrew = BrewModel()
    static var previews: some View {
        SavePage(currentBrew: testBrew)
    }
}
