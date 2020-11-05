//
//  ApplicationDetailInformationView.swift
//  iTunes
//
//  Created by Erim Kurt on 1/11/2563 BE.
//

import Foundation
import SwiftUI

struct ApplicationDetailInformationView: View {
    
    var application: Application?
    
    var body: some View {
        Section(header:
                    HStack {
                        Text("Information")
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 10.0)
                            .textCase(nil)
                        Spacer()
                    }
                    .background(Color(UIColor.systemBackground))
                    .listRowInsets(EdgeInsets(
                                    top: 0,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0))
        ) {
            ApplicationDetailInformationCellView(title: "Provider", detail: application?.artistName ?? "")
            ApplicationDetailInformationCellView()
            ApplicationDetailInformationCellView()
            ApplicationDetailInformationCellView()
        }
    }
}

struct ApplicationDetailInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationDetailInformationView()
            .preferredColorScheme(.dark)
    }
}

struct ApplicationDetailInformationCellView: View {
    
    var title: String = ""
    var detail: String = ""
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.genreGray)
            Spacer()
            Text(detail)
                .font(.subheadline)
        }
    }
}
