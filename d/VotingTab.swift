//
//  VotingTab.swift
//  d
//
//  Created by Kui Jun on 3/9/23.
//

import SwiftUI

struct VotingTab: View {
    @Binding var candidateData: [Candidate]
    @State var selectedCandidateIndex: UUID = UUID()
    
    var body: some View {
        VStack {
            Picker("Select a Candidate", selection: $selectedCandidateIndex) {
                ForEach(candidateData, id: \.id) { Candidate in
                    Text(Candidate.name).tag(Candidate.id)
                }
            }
            .pickerStyle(.wheel)
            
            Button("Vote") {
                if let index = candidateData.firstIndex(where: { $0.id == selectedCandidateIndex}) {
                    candidateData[index].votes += 1
                }
            }
        }
        .padding()
    }
}

struct VotingTab_Previews: PreviewProvider {
    static var previews: some View {
        VotingTab(candidateData: .constant([]))
    }
}
