//
//  ApplicationDetailInformationView.swift
//  App Store
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
            ApplicationDetailInformationCellView(title: "Size", detail: application?.size ?? "")
            ApplicationDetailInformationCellView(title: "Category", detail: application?.genreTitle ?? "")
            ApplicationDetailInformationCellView(title: "Languages",
                                                 detail: application?.language ?? "",
                                                 expandedDetail: application?.languages)
            ApplicationDetailInformationCellView(title: "Age Rating",
                                                 detail: application?.trackContentRating ?? "",
                                                 expandedDetail: application?.ageRating)
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
    var expandedDetail: String?
    @State var isExpanded: Bool = false
    
    public mutating func setDetail(_ detail: String) {
        self.detail = detail
    }
    
    var body: some View {
        view
            .transition(AnyTransition.scale)
            .animation(.default)
    }
    
    var view: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.genreGray)
                Spacer()
                Text(detail)
                    .font(.subheadline)
                    .isHidden(isExpanded, remove: true)
                
                if !isExpanded {
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.5)) {
                            isExpanded.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.down")
                            .font(Font.title.weight(.light))
                    }
                    .isHidden(expandedDetail == nil, remove: true)
                    .foregroundColor(.genreGray)
                    .imageScale(/*@START_MENU_TOKEN@*/.small/*@END_MENU_TOKEN@*/)
                }
            }
            if isExpanded {
                Text(expandedDetail ?? "")
                    .font(.subheadline)
            }
        }
    }
}
