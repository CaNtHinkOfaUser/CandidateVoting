//
//  AddCandidateView.swift
//  d
//
//  Created by Ishaan on 1/9/23.
//

import SwiftUI

struct AddCandidateView: View {
    @Binding var candidateData: [Candidate]
    @Binding var sheetShown: Bool
    @State var name = ""
    @State var age = ""
    @State var info = ""
    @State var alertShown = false
    @State var ageAlertShown = false
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
            TextField("Age", text: $age)
            TextField("Info", text: $info)
            
            Button("Add Candidate") {
                if (name != "" && age != "" && info != "") {
                    if (Int(age) ?? -1 >= 0){
                        candidateData.append(
                            Candidate(name: name, age: Int(age) ?? 0, info: info)
                        )
                        sheetShown.toggle()
                    }
                    else{
                        ageAlertShown.toggle()
                    }
                }
                else {
                    alertShown.toggle()
                }
            }
            .alert(Text("Unable to Add Candidate"), isPresented: $alertShown) {
                Button{
                    alertShown.toggle()
                } label: {
                    Text("Ok")
                }
            } message: {
                Text("Please fill in the necessary details.")
            }
            .alert(isPresented: $ageAlertShown) {
                Alert(
                    title: Text("Unable to Add Candidate"),
                    message: Text("Invalid Age"))
            }
        }
    }
}

struct AddCandidateView_Previews: PreviewProvider {
    static var previews: some View {
        AddCandidateView(candidateData: .constant([]), sheetShown: .constant(true))
    }
}
