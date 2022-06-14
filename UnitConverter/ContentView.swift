//
//  ContentView.swift
//  UnitConverter
//
//  Created by Jared Bell on 6/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemp = 72.0
    @State private var inputUnits = "Fahrenheit"
    @State private var outputUnits = "Kelvin"
    @FocusState private var tempIsFocused: Bool
    var inputUnitSelection = ["Fahrenheit", "Celsius", "Kelvin"]
    var outputUnitSelection = ["Fahrenheit", "Celsius", "Kelvin"]
    var inputKelvin: Double {
        if inputUnits == "Kelvin" {
            return inputTemp
        } else if inputUnits == "Fahrenheit" {
            return ((inputTemp-32.0)/1.8)+273.15
        } else {
            return inputTemp + 273.15
        }
    }
    var outputTemp: Double {
        if outputUnits == "Kelvin" {
            return inputKelvin
        } else if outputUnits == "Fahrenheit" {
            return ((inputKelvin-273.15)*1.8)+32.0
        } else {
            return inputKelvin - 273.15
        }
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature",value: $inputTemp, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($tempIsFocused)
                    
                    Picker("Units", selection: $inputUnits) {
                        ForEach(inputUnitSelection, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Enter input temperature and units")
                }
                Section {
                    Picker("Units", selection: $outputUnits) {
                        ForEach(outputUnitSelection, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Select Output Units")
                }
                Section{
                    Text(outputTemp,  format: .number)
                } header: {
                    Text("Output Temperature")
                }
                .navigationTitle("Temperature Converter")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            tempIsFocused = false
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
