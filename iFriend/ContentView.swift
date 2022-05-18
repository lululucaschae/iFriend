//
//  ContentView.swift
//  iFriend
//
//  Created by Lucas Chae on 5/18/22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var friendsFromUrl = [User]()

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(friendsFromUrl) { friend in
                    Text("friend: \(friend.name)")
                }
                .task {
                    await loadData()
                }
            }
        }
    }
    
    func loadData() async {
        guard let friendUrl = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: friendUrl)
            
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                friendsFromUrl = decodedResponse.self
            }
        } catch {
            print("Invalid data")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
