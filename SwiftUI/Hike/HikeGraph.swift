//
//  HikeGraph.swift
//  SwiftUIFirst
//
//  Created by M_Sugawara on 2019/10/06.
//  Copyright © 2019 Sugawar. All rights reserved.
//

import SwiftUI

func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

func magnitude(of range: Range<Double>) -> Double {
    return range.upperBound - range.lowerBound
}

struct HikeGraph: View {
    var data: [Hike.Observation]
    var path: KeyPath<Hike.Observation, Range<Double>>

    var color: Color {
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }

    var body: some View {
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: self.path] })
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))

        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                ForEach(self.data.indices) { index in
                    GraphCapsule(
                        index: index,
                        height: proxy.size.height,
                        range: self.data[index][keyPath: self.path],
                        overallRange: overallRange)
                    .colorMultiply(self.color)
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

struct HikeGraph_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HikeGraph(data: hikeData[0].observations, path: \.elevation)
                .frame(height: 200)
            HikeGraph(data: hikeData[0].observations, path: \.heartRate)
                .frame(height: 200)
            HikeGraph(data: hikeData[0].observations, path: \.pace)
                .frame(height: 200)
        }
    }
}

