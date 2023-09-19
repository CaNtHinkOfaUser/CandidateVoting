//
//  CandidateListView.swift
//  d
//
//  Created by Ishaan on 1/9/23.
//

import SwiftUI

struct CandidateListTab: View {
    @ObservedObject var candidateData: CandidateData
    var body: some View {
        NavigationView {
            List {
                ForEach(candidateData.candidates) { candidate in
                    NavigationLink(destination: CandidateDetail(candidate: candidate)) {
                        Text(candidate.name)
                    }
                }
                .onDelete { indices in
                    indices.forEach { index in
                        candidateData.deleteCandidate(at: index)
                    }
                }
            }
            .navigationTitle("Candidates")
            .navigationBarItems(trailing: EditButton())
            .navigationBarItems(trailing: NavigationLink(destination: AddCandidateView(candidateData: candidateData)) {
                Text("Add")
            }
            )
        }
    }
}
struct CandidateListView_Previews: PreviewProvider {
    static var previews: some View {
        CandidateListTab()
    }
}
