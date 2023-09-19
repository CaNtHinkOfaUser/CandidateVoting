import SwiftUI

struct Candidate: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
    var info: String
    var votes: Int
}

class CandidateManager: ObservableObject {
    @Published var candidates: [Candidate] = []
    
    func voteForCandidate(at index: Int) {
        candidates[index].votes += 1
    }
}

struct VoteView: View {
    @ObservedObject var candidateManager: CandidateManager
    @State private var selectedCandidateIndex = 0
    
    var body: some View {
        VStack {
            Picker("Select Candidate", selection: $selectedCandidateIndex) {
                ForEach(candidateManager.candidates.indices) { index in
                    Text(candidateManager.candidates[index].name)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            Button("Vote") {
                candidateManager.voteForCandidate(at: selectedCandidateIndex)
            }
            .padding()
        }
        .navigationTitle("Vote")
    }
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        let candidateManager = CandidateManager() // Create an instance of CandidateManager
        candidateManager.candidates = [ // Populate with sample data
            Candidate(name: "Candidate 1", age: 0, info: "Info about Candidate 1", votes: 0),
            Candidate(name: "Candidate 2", age: 0, info: "Info about Candidate 2", votes: 0)
        ]
        return VoteView(candidateManager: candidateManager) // Pass the instance to the view
    }
}
