//
//  ProfileEditor.swift
//  SwiftUIFirst
//
//  Created by M_Sugawara on 2019/10/06.
//  Copyright © 2019 Sugawar. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile

    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }

    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }

            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notification")
            }

            VStack(alignment: .leading, spacing: 20) {
                Text("Sesonal Photo").bold()

                Picker("Seasol Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)

            VStack(alignment: .leading, spacing: 20) {
                Text("Goal Date").bold()
                DatePicker(
                    "Goal Date",
                    selection: $profile.goalDate,
                    in: dateRange,
                    displayedComponents: .date
                )
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
