import SwiftUI

struct Candidate: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
    var info: String
    var votes: Int = 0
}

struct ContentView: View {
    @State var candidateData: [Candidate] = []
    
    var body: some View {
        TabView {
            CandidateListTab(candidateData: $candidateData)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Candidates")
                }
            
            VotingTab(candidateData: $candidateData)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Vote")
                }
            
            VotesTab(candidateData: $candidateData)
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Votes")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
