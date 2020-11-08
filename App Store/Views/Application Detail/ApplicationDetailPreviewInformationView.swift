//
//  ApplicationDetailPreviewInformationView.swift
//  App Store
//
//  Created by Erim Kurt on 7/11/2563 BE.
//

import Foundation
import SwiftUI

struct ApplicationDetailPreviewInformationView: View {
    
    var application: Application?
    
    var line: some View {
        Divider()
            .frame(height: 30.0)
            .background(Color.genreGray.opacity(0.5))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                Group {
                    PreviewInfoView(title: "\((application?.userRatingCount ?? 0).formatUsingAbbrevation()) ratings",
                                    detail: String(format: "%.1f", application?.averageUserRating ?? 0.0),
                                    rate: application?.averageUserRating ?? 0.0)
                        .padding(.leading)
                }
                Group {
                    line
                    PreviewInfoView(title: "age",
                                    detail: application?.trackContentRating ?? "",
                                    subtitle: "Years Old")
                }
                Group {
                    line
                    PreviewInfoView(title: "chart",
                                    detail: "ɴᴏ1",
                                    subtitle: application?.genrePreview)
                }
                Group {
                    line
                    PreviewInfoView(title: "developer",
                                    image: Image(systemName: "person.crop.square"),
                                    subtitle: application?.artistName ?? "")
                }
                Group {
                    line
                    PreviewInfoView(title: "language",
                                    detail: application?.languageCodesISO2A?.first ?? "",
                                    subtitle: application?.languageCount)
                }
                Group {
                    line
                    PreviewInfoView(title: "size",
                                    detail: application?.fileSizeBytes?.sizeOfFile,
                                    subtitle: application?.fileSizeBytes?.sizeOfFileUnit)
                }
            }
        }
    }
}

struct PreviewInfoView: View {

    var title: String
    var detail: String?
    var image: Image?
    var subtitle: String?
    var rate: Double?
    
    var stars: some View {
        HStack(spacing: 2.0) {
            ForEach((1..<6)) { i in
                star(i)
                    .resizable()
                    .frame(width: 11.0, height: 11.0)
                    .foregroundColor(Color.gray)
                    .font(Font.title.weight(.semibold))
            }
        }
    }
    
    private func star(_ number: Int) -> Image {
        let index = Double(number)
        let rating = round((rate ?? 0.0) / 0.5) * 0.5
        let name = (rating < index - 0.5) ? "star" : rating < index ? "star.lefthalf.fill" : "star.fill"
        return Image(systemName: name)
    }
    
    var body: some View {
        VStack(spacing: 5.0) {
            Text(title.uppercased())
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray.opacity(0.7))
            if let detail = detail {
                Text(detail)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
            } else if let image = image {
                image
                    .foregroundColor(Color.gray)
                    .imageScale(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
            }
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(Color.genreGray)
            } else if let _ = rate {
                stars
            }
        }
        .frame(width: 120, height: 70)
    }
}
