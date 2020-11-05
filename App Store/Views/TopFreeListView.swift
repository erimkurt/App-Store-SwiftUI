//
//  TopFreeListView.swift
//  App Store
//
//  Created by Erim Kurt on 26/10/2563 BE.
//

import SwiftUI

struct TopFreeListView: View {
    @ObservedObject var model = TopFreeViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(model.apps.enumerated()), id: \.1.id) { (index, app) in
                    NavigationLink(destination: ApplicationDetailView(application: app)) {
                        ApplicationView(index: index, application: app)
                    }
                }
            }
            .navigationBarTitle(model.feed?.title ?? "")
        }
    }
}

struct TopFreeListView_Previews: PreviewProvider {
    static var previews: some View {
        TopFreeListView()
    }
}

