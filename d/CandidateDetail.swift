//
//  CandidateDetail.swift
//  d
//
//  Created by Ishaan on 1/9/23.
//

import SwiftUI

struct CandidateDetail: View {
    @Binding var candidate: Candidate
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(candidate.name)")
            Text("Age: \(candidate.age)")
            Text("Info: \(candidate.info)")
        }
        .padding()
        .navigationBarTitle(candidate.name)
    }
}

struct CandidateDetail_Previews: PreviewProvider {
    static var previews: some View {
        CandidateDetail(candidate: .constant(Candidate(name: "", age: 0, info: "")))
    }
}
