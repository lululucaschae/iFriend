//
//  ContentView.swift
//  iFriend
//
//  Created by Lucas Chae on 5/18/22.
//

import SwiftUI


struct ContentView: View {
    let source = "https://www.hackingwithswift.com/samples/friendface.json"
    @State private var friendsFromUrl = [User]()

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(friendsFromUrl) { friend in
                    Text("friend: \(friend.name)")
                }
                .task {
                    await friendsFromUrl.loadDataFromUrl(url: source)
                }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
