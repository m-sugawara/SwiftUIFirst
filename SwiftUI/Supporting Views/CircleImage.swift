//
//  CircleImage.swift
//  SwiftUIFirst
//
//  Created by M_Sugawara on 2019/09/23.
//  Copyright © 2019 Sugawar. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .frame(width: 260, height: 260)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}

