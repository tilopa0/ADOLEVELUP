//
//  circulartaskView.swift
//  Adolevup
//
//  Created by apprenant86 on 22/06/2026.
//
import SwiftUI

struct CircularSkillView: View {
    var icon: String
    var label: String
    var value: Int
    var maxValue: Int = 100
    var color: Color

    private var progress: Double {
        Double(value) / Double(maxValue)
    }

    var body: some View {
        VStack {
            ZStack {
                
                Circle()
                    .stroke(Color.indigo.opacity(0.2), lineWidth: 8)

                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        color,
                        style: StrokeStyle(
                            lineWidth: 8,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))

                VStack(spacing: 2) {
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundStyle(color)

                    Text("\(value)%")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.indigo)
                }
                .padding(18)
            }

            Text(label)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.indigo)
        }
    }
}

#Preview {
//    CircularSkillView(icon: "star.fill", label: "Organisation", percentage: 80, color: .blue)
//        .padding()
//        .background(Color.gray)
    
    CircularSkillView(icon: "star.fill", label: "Organisation", value: 25, color: .blue)
}
