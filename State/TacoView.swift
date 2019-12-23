//
//  TacoView.swift
//  State
//
//  Created by Christina S on 11/16/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct TacoView: View {
    @State private var taco = Taco()
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TacoProteinPicker(selection: $taco.protein)
                    TacoSaucePicker(selection: $taco.sauce)
                    TacoCheesePicker(selection: $taco.cheese)
                    TacoTortillaPicker(selection: $taco.tortilla)
                    TacoSpicePicker(selection: $taco.spice)
                }
                Divider()
                Section(header: Text("Is this right?").bold()) {
                    Text(taco.orderReview)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                OrderButton(showAlert: $showAlert)
            }.navigationBarTitle("Create Your Taco!", displayMode: .inline)
        }
    }
}

struct TacoProteinPicker: View {
    @Binding var selection: TacoProtein
    var body: some View {
        Section(header: Text("Select your protein:").font(.headline)) {
            
            Picker(selection: $selection, label: Text("Select Your Protein")) {
                ForEach(TacoProtein.allCases, id: \.self) { protein in
                    Text(protein.rawValue.capitalized)
                }
                }.pickerStyle(SegmentedPickerStyle())
        }

    }
}

struct TacoSaucePicker: View {
    @Binding var selection: TacoSauce
    var body: some View {
        Section(header: Text("Select your sauce:").font(.headline)) {
            
            Picker(selection: $selection, label: Text("Select Your Sauce")) {
                ForEach(TacoSauce.allCases, id: \.self) { sauce in
                    Text(sauce.rawValue.capitalized)
                }
                }.pickerStyle(SegmentedPickerStyle())
        }

    }
}

struct TacoCheesePicker: View {
    @Binding var selection: TacoCheese
    var body: some View {
        Section(header: Text("Select your cheese:").font(.headline)) {
            
            Picker(selection: $selection, label: Text("Select Your Cheese")) {
                ForEach(TacoCheese.allCases, id: \.self) { sauce in
                    Text(sauce.rawValue.capitalized)
                }
                }.pickerStyle(SegmentedPickerStyle())
        }

    }
}

struct TacoTortillaPicker: View {
    @Binding var selection: TacoTortilla
    var body: some View {
        Section(header: Text("Select your tortilla:").font(.headline)) {
            List(TacoTortilla.allCases, id: \.self) { tortilla in
                Button(action: {
                    self.selection = tortilla
                }) {
                    TacoTortillaPickerRow(selection: self.$selection,
                                          tortillaSelection: tortilla)
                }
            }
            
        }
    }
}

struct TacoTortillaPickerRow: View {
    @Binding var selection: TacoTortilla
    let tortillaSelection: TacoTortilla
    var body: some View {
        HStack {
            Text(tortillaSelection.rawValue.capitalized)
            Spacer()
            if tortillaSelection == selection {
                Image(systemName: "checkmark")
            }
        }.foregroundColor(.primary)
    }
}

struct TacoSpicePicker: View {
    @Binding var selection: TacoSpice
    var body: some View {
        Section(header: Text("Select your spice:").font(.headline)) {
            List(TacoSpice.allCases, id: \.self) { spice in
                Button(action: {
                    self.selection = spice
                }) {
                    TacoSpicePickerRow(selection: self.$selection,
                                          spiceSelection: spice)
                }
            }
            
        }
    }
}

struct TacoSpicePickerRow: View {
    @Binding var selection: TacoSpice
    let spiceSelection: TacoSpice
    var body: some View {
        HStack {
            Text(spiceSelection.rawValue.capitalized)
            Spacer()
            if spiceSelection == selection {
                Image(systemName: "checkmark")
            }
        }.foregroundColor(.primary)
    }
}

struct OrderButton: View {
    @Binding var showAlert: Bool
    var body: some View {
        Button(action: {
            withAnimation {  self.showAlert.toggle() }
        }) {
            Text("Order")
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Order Submitted"), message: Text("Thanks! Your order is being processed..."), dismissButton: .default(Text("OK")))
        }.frame(width: 200.0)
            .padding()
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 8)
    }
}

struct TacoView_Previews: PreviewProvider {
    static var previews: some View {
        TacoView()
    }
}
