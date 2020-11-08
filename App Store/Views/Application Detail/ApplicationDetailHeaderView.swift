//
//  ApplicationDetailHeaderView.swift
//  App Store
//
//  Created by Erim Kurt on 1/11/2563 BE.
//

import Foundation
import SwiftUI

struct ApplicationDetailHeaderView: View {
    
    var application: Application?
    
    var body: some View {
        HStack(alignment: .top, spacing: 20.0) {
            ImageView(withURL: application?.artworkUrl100 ?? "", cornerRadius: 30.0)
                .frame(width: 120.0, height: 120.0)
            VStack(alignment: .leading) {
                Text(application?.name ?? "Name")
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                Text(application?.artistName ?? "Artist Name")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.genreGray)
                Spacer()
                HStack(alignment: .center) {
                    Button("get".uppercased(), action: {
                        
                    })
                    .buttonStyle(GetButtonStyle(type: .blue))
                    Spacer()
                    Button(action: {
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .font(Font.title.weight(.medium))
                    }
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .imageScale(/*@START_MENU_TOKEN@*/.small/*@END_MENU_TOKEN@*/)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding(.bottom, 10.0)
    }
}

struct ApplicationDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ApplicationDetailHeaderView()
                .preferredColorScheme(.dark)
            ApplicationDetailHeaderView()
        }
    }
}
