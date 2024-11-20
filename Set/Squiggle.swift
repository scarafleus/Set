//
//  Squiggle.swift
//  Set
//
//  Created by Hannes Richter on 21.11.24.
//

import SwiftUI

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        let center = rect.midPoint
        let radius = min(rect.width, rect.height) / 2
        let bottomLeft = CGPoint(x: rect.midX - radius, y: rect.midY + radius)
        let bottomRight = CGPoint(x: rect.midX + radius, y: rect.midY + radius)
        
        var path = Path()
        path.addArc(
            center: center,
            radius: radius,
            startAngle: Angle.zero,
            endAngle: Angle.degrees(180),
            clockwise: true
        )
        path.addArc(
            center: bottomLeft,
            radius: radius,
            startAngle: Angle.degrees(270),
            endAngle: Angle.zero,
            clockwise: false
        )
        path.addArc(
            center: bottomRight,
            radius: radius,
            startAngle: Angle.degrees(180),
            endAngle: Angle.degrees(270),
            clockwise: false
        )
        return path
    }
}

#Preview {
    HStack {
        Squiggle()
            .stroke(lineWidth: 4)
            .padding()
        Squiggle()
            .fill(.blue)
            .padding()
    }
}
