//
//  ApplicationDetailRatingsView.swift
//  App Store
//
//  Created by Erim Kurt on 5/11/2563 BE.
//

import Foundation
import SwiftUI

struct ApplicationDetailRatingsView: View {
    
    var ratingCount: Int = 0
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack(alignment: .bottom) {
                Text("Ratings & Reviews")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
                Button("See All", action: {})
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            HStack(alignment: .bottom) {
                VStack {
                    Text("2.5")
                        .font(.system(size: 55))
                        .fontWeight(.bold)
                        .foregroundColor(.genreGray)
                    Text("out of 5")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                Spacer()
                ApplicationDetailRatingsStarsView(ratingCount: ratingCount)
            }
        }
    }
}

struct ApplicationDetailRatingsStarsView: View {
    
    var ratingCount: Int
    
    var body: some View {
        VStack(alignment: .trailing) {
            VStack(alignment: .trailing, spacing: 2.0) {
                ForEach((1...5).reversed(), id: \.self) {
                    ApplicationDetailRatingsStarsItemView(starIndex: $0, starPercent: .random(in: 0...100))
                }
            }
            Text("\(ratingCount) Ratings")
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.gray)
        }
    }
}

struct ApplicationDetailRatingsStarsItemView: View {
    
    var starIndex: Int
    var starPercent: Double
    
    var body: some View {
        HStack {
            HStack(spacing: 2.0) {
                ForEach(0..<starIndex) { i in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .foregroundColor(Color/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/.opacity(0.2))
                }
            }
            
            ProgressView(value: starPercent, total: 100)
                .frame(width: 150.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .gray))
        }
    }
}

struct ApplicationDetailRatingsView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationDetailRatingsView()
    }
}
