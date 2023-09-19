//
//  VotesTab.swift
//  d
//
//  Created by Ishaan on 1/9/23.
//

import SwiftUI

struct VotesTab: View {
    @Binding var candidateData: [Candidate]
    
    var body: some View {
        List{
            ForEach(candidateData, id: \.id){ Candidate in
                HStack {
                    Text(Candidate.name)
                    Spacer()
                    Text("Votes: \(Candidate.votes)")
                }
            }
        }
        .navigationTitle("Votes")
    }
}

struct VotesTab_Previews: PreviewProvider {
    static var previews: some View {
        VotesTab(candidateData: .constant([]))
    }
}
