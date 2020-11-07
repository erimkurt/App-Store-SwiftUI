//
//  ApplicationDetailReviewsView.swift
//  App Store
//
//  Created by Erim Kurt on 7/11/2563 BE.
//

import Foundation
import SwiftUI
import Pages

struct ApplicationDetailReviewsView: View {
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Tap to Rate:")
                    .font(.callout)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                Spacer()
                ReviewStarsButtonGroupView()
            }
            .padding(.horizontal)
            ReviewCardsView()
            HStack(alignment: .bottom) {
                Button(action: {
                }) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 15.0, height: 15.0)
                        .font(Font.title.weight(.regular))
                    Text("Write a Review")
                        .font(.callout)
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .frame(width: 15.0, height: 15.0)
                        .font(Font.title.weight(.regular))
                    Text("App Support")
                        .font(.callout)
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 10.0)
    }
}

struct ReviewStarsButtonGroupView: View {
    
    @State var selectedStar: Int = 0
    
    var body: some View {
        HStack(spacing: 10.0) {
            ForEach(1..<6) { i in
                Button(action: {
                    self.selectedStar = i
                }) {
                    Image(systemName: (self.selectedStar >= i) ? "star.fill" : "star")
                        .font(Font.title.weight(.light))
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .imageScale(.small)
            }
        }
    }
}

struct ReviewCardsView: View {
    
    @State var index: Int = 0
    
    var body: some View {
        ModelPages(
            (1..<(.random(in: 5...10))),
            currentPage: $index,
            hasControl: false
        ) { pageIndex, car in
            ReviewCardView()
                .padding(.horizontal, 15.0)
        }
        .frame(height: 230.0)
    }
}

struct ReviewCardView: View {
    
    var rate: Int = .random(in: 1...5)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Lorem ipsum dolor sit amet")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .lineLimit(1)
                Spacer()
                Text("1y ago")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            HStack {
                HStack(spacing: 5.0) {
                    ForEach(1..<6) { i in
                        Image(systemName: (self.rate >= i) ? "star.fill" : "star")
                            .foregroundColor(.orange)
                            .imageScale(/*@START_MENU_TOKEN@*/.small/*@END_MENU_TOKEN@*/)
                    }
                }
                Spacer()
                Text("user name")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .font(.subheadline)
                .padding(.top)
            Spacer()
        }
        .padding(.all)
        .frame(height: 230.0)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        .background(Color.reviewGray)
        .cornerRadius(10)
    }
}

struct ApplicationDetailReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationDetailReviewsView()
    }
}
