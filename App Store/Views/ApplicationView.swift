//
//  ApplicationView.swift
//  App Store
//
//  Created by Erim Kurt on 31/10/2563 BE.
//

import Foundation
import SwiftUI

struct ApplicationView: View {
    var index: Int?
    var application: Application?
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            ImageView(withURL: application?.artworkUrl100 ?? "", cornerRadius: 15.0)
                .frame(width: 60, height: 60)
            HStack(alignment: .top) {
                Text("\((index ?? 0) + 1)")
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                VStack(alignment: .leading) {
                    Text(application?.name ?? "Name")
                    Text(application?.genreTitle ?? "Genre")
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(.genreGray)
                }
            }
            Spacer()
            Button("get".uppercased(), action: {
                
            })
            .buttonStyle(GetButtonStyle(type: .gray))
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
    }
}

struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
