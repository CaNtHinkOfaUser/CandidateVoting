//
//  candidateDetailView.swift
//  d
//
//  Created by Ishaan on 31/8/23.
//

import SwiftUI

struct candidateDetailView: View {
    let candidate: Candidate
    
    var body: some View {
        VStack {
            Text(candidate.name)
                .font(.title)
            Text("Age: \(candidate.age)")
                .foregroundColor(.gray)
            Text(candidate.info)
                .padding()
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct candidateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        candidateDetailView(candidate: Candidate(name: "", age: 0, info: ""))
    }
}
