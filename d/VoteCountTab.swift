//
//  VoteCountTab.swift
//  d
//
//  Created by Ishaan on 31/8/23.
//

import SwiftUI

struct VoteCountTab: View {
    @ObservedObject var candidatesData: CandidatesData
    
    var body: some View {
        List {
            ForEach(candidatesData.candidates) { candidate in
                Text("\(candidate.name): \(candidate.votes) votes")
            }
        }
        .navigationTitle("Vote Count")
    }
}

struct VoteCountTab_Previews: PreviewProvider {
    static var previews: some View {
        VoteCountTab(candidatesData: CandidatesData())
    }
}
