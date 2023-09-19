//
//  voteCountView.swift
//  d
//
//  Created by Ishaan on 31/8/23.
//

import SwiftUI

struct voteCountView: View {
    @ObservedObject var candidateManager: CandidateManager
    
    var body: some View {
        List {
            ForEach(candidateManager.candidates) { candidate in
                HStack {
                    Text(candidate.name)
                    Spacer()
                    Text("Votes: \(candidate.votes)")
                }
            }
        }
        .navigationTitle("Vote Count")
    }
}

struct voteCountView_Previews: PreviewProvider {
    static var previews: some View {
        voteCountView()
    }
}
