//
//  UserData.swift
//  SwiftUIFirst
//
//  Created by M_Sugawara on 2019/10/05.
//  Copyright © 2019 Sugawar. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
