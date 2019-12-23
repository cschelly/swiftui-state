//
//  PropertyView.swift
//  State
//
//  Created by Christina S on 11/24/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct Property: View {
    // Property
    // let greeting = "Hello from SwiftUI!"

    let greeting: String

    var body: some View {
        // Using property directly
        Text(greeting)
            .font(.title)
    }
}

struct PropertyView: View {
    var body: some View {
        Property(greeting: "Hello World!")
    }
}

struct Property_Previews: PreviewProvider {
    static var previews: some View {
        PropertyView()
    }
}
