//
//  BrewModel.swift
//  dial-it-in-swift-ui
//
//  Created by Justin Boyer on 11/25/22.
//

import Foundation
var savedBrews: [BrewStorageModel] = load("savedBrews.json")

class NumberValidator: ObservableObject{
    @Published var value = "" {
        didSet{
            let filtered = value.filter{$0.isNumber}
            if value != filtered{
                value = filtered
            }
        }
    }
}

class BrewModel: ObservableObject{
    @Published var method: String = "Espresso"
    @Published var grindSize: String = ""
    @Published var dose = NumberValidator()
    @Published var yield = NumberValidator()
    @Published var temperature = NumberValidator()
    @Published var time: Double = 0.0
    @Published var notes: String = ""
    
    init(){
        self.method = "Espresso"
        self.grindSize = ""
        self.dose = NumberValidator()
        self.yield = NumberValidator()
        self.temperature = NumberValidator()
        self.time = 0.0
        self.notes = ""
    }
}

struct BrewStorageModel: Identifiable, Codable{
    let id: UUID
    var grindSize: String
    let dose: Double
    let yield: Double
    let temperature: Double
    let time: Double
    let notes: String
    
    init(id:UUID = UUID(), grindSize: String, dose: Double, yield: Double, temperature: Double, time: Double, notes: String){
        self.id = id
        self.grindSize = grindSize
        self.dose = dose
        self.yield = yield
        self.temperature = temperature
        self.time = time
        self.notes = notes
    }
}



func load<T: Decodable>(_ filename: String) -> T {
    //Load function from apple dev pages see reference below
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func writeSave(_ toSave: BrewStorageModel, filename: String){
    savedBrews.append(toSave)
    do {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        let encoder = JSONEncoder()
        try encoder.encode(savedBrews).write(to: file)
    } catch {
        fatalError("Couldn't encode savedBrews array to JSON")
    }
}


//https://developer.apple.com/tutorials/app-dev-training/persisting-data
//https://developer.apple.com/tutorials/swiftui/handling-user-input
