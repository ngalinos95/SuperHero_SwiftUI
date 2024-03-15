//
//  PowerStatsView.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos,   on 21/7/23.
//
import SwiftUI
import Charts

struct PowerStatsView: View {
    @EnvironmentObject var router: Router
    var powerstats: PowerStatsViewModel
    var body: some View {
        VStack(spacing: 16) { 
            BarView(label: "Intelligence", value: Double(powerstats.intelligence) ?? 0)
            BarView(label: "Strength", value: Double(powerstats.strength) ?? 0)
            BarView(label: "Speed", value: Double(powerstats.speed) ?? 0)
            BarView(label: "Durability", value: Double(powerstats.durability) ?? 0)
            BarView(label: "Power", value: Double(powerstats.power) ?? 0)
            BarView(label: "Combat", value: Double(powerstats.combat) ?? 0)
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(red: 0.8, green: 0.8, blue: 0.8).opacity(0.7))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("List of Heroes"){
                    router.reset()
                }
                .buttonStyle(.bordered)
            }
        }
    }
}
struct BarView: View {
    var label: String
    var value: Double
    var body: some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.headline)
                .foregroundColor(.primary)
            HStack {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.blue.opacity(0.3)) // Customize the bar color here
                        .frame(height: 20)
                    Rectangle()
                        .fill(Color.blue) // Customize the bar color here
                        .frame(width: barWidth(), height: 20)
                }
                .cornerRadius(10)
                Text("\(Int(value))")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
    private func barWidth() -> CGFloat {
        let maxWidth: CGFloat = 325
        let percentage = value / 100 // Assuming the power stats are in the range of 0 to 100
        return maxWidth * CGFloat(percentage)
    }
}
