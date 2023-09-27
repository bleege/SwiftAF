//
//  ContentView.swift
//  SwiftAF
//
//  Created by Brad Leege on 9/26/23.
//

import AFNetworking
import SwiftUI

struct ContentView: View {

    @ObservedObject
    private var viewModel = ConventViewModel()
    
    var body: some View {
        VStack {
            Button("Press To Get Data", action: {
                viewModel.handleButtonPress()
            })
            .padding(.bottom, 20)
            Text(viewModel.displayText)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


final class ConventViewModel: ObservableObject {
    
    @Published var displayText = "Hello, world!"
    
    func handleButtonPress() {
        displayText = "button pressed"
        
        let url = URL(string: "https://jsonplaceholder.typicode.com")
        
        let afSessionManager = AFHTTPSessionManager(baseURL: url)
        afSessionManager.get("comments/2",
                             parameters: nil,
                             headers: nil,
                             progress: nil,
                             success: { task, responseObject in
            print("success responseObject = \(String(describing: responseObject))")
        }, failure: { task, error in
            print("error: \(error)")

        })
        
    }
    
}
