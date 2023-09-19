//
//  CandidateListTab.swift
//  d
//
//  Created by Ishaan on 31/8/23.
//

import SwiftUI

struct CandidateListTab: View {
    @ObservedObject var candidatesData: CandidatesData
    @Binding var selectedCandidate: Candidate?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(candidatesData.candidates) { candidate in
                    NavigationLink(destination: CandidateDetail(candidate: candidate)) {
                        Text(candidate.name)
                    }
                }
                .onDelete { indices in
                    candidatesData.candidates.remove(atOffsets: indices)
                }
            }
            .navigationTitle("Candidates")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        candidatesData.candidates.append(Candidate(name: "New Candidate", info: "", votes: 0))
                    }) {
                        Image(systemName: "plu
                    }
                }
            }
        }
    }
}

struct CandidateListTab_Previews: PreviewProvider {
    static var previews: some View {
        CandidateListTab(candidatesData: CandidatesData(), selectedCandidate: .constant(Candidate(name: "Sample Candidate", info: "Sample Info", votes: 0)))
    }
}
