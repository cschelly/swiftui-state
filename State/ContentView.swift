//
//  ContentView.swift
//  State
//
//  Created by Christina S on 11/16/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var likesCats = true
    var body: some View {
        VStack {
            Toggle(isOn: $likesCats) {
                Text("Like Cats")
            }.padding(100)
            if likesCats {
                Image("kitty")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
