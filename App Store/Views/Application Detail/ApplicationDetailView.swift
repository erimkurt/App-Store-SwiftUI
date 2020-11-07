//
//  ApplicationDetailView.swift
//  App Store
//
//  Created by Erim Kurt on 31/10/2563 BE.
//

import SwiftUI

struct ApplicationDetailView: View {
    @ObservedObject var model = ApplicationViewModel()
    
    var application: Application?
    
    var body: some View {
        VStack(alignment: .center) {
            List {
                ApplicationDetailHeaderView(application: application)
                    .buttonStyle(PlainButtonStyle())
                ApplicationDetailDescriptionView(application: model.application)
                ApplicationDetailRatingsView(ratingCount: model.application?.userRatingCount ?? 0)
                    .buttonStyle(PlainButtonStyle())
                ApplicationDetailReviewsView()
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal, -20)
                ApplicationDetailInformationView(application: model.application)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.model.fetchApplication(id: application?.id ?? "")
        }
    }
}

struct ApplicationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationDetailView()
    }
}


