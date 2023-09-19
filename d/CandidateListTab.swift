//
//  CandidateListTab.swift
//  d
//
//  Created by Ishaan on 1/9/23.
//

import SwiftUI

struct CandidateListTab: View {
    @Binding var candidateData: [Candidate]
    @State var sheetShown = false
    var body: some View {
        NavigationStack {
            List {
                ForEach($candidateData, id: \.id) { $Candidate in
                    NavigationLink{
                        CandidateDetail(candidate: $Candidate)
                    } label: {
                        VStack{
                            Text("\(Candidate.name)")
                                .contextMenu{
                                    Button(role: .destructive){
                                        removeCandidateAt(id: Candidate.id)
                                    } label: {
                                        Text("Remove")
                                    }
                                }
                        }
                    }
                }
            }
            .navigationTitle("Candidates")
            .toolbar{
                Button{
                    sheetShown.toggle()
                } label: {
                    Text("Add")
                }
            }
            .sheet(isPresented: $sheetShown) {
                AddCandidateView(candidateData: $candidateData, sheetShown: $sheetShown)
            }
        }
    }
    func removeCandidateAt(id: UUID){
        if let index = candidateData.firstIndex(where: {$0.id == id}){
            candidateData.remove(at: index)
        }
    }
}
    
struct CandidateListTab_Previews: PreviewProvider {
    static var previews: some View {
        CandidateListTab(candidateData: .constant([]))
    }
}
