//
//  FriendsListView.swift
//  iFriend
//
//  Created by Lucas Chae on 5/18/22.
//

import Foundation
import SwiftUI

struct FriendsListView: View {
    
    let source = "https://www.hackingwithswift.com/samples/friendface.json"
    @State private var friendsFromUrl = [User]()
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(friendsFromUrl, id: \.id) { friend in
                    HStack {
                        Text("\(friend.name)")
                        Spacer()
                        Text(friend.isActive ? "Active" : "Inactive")
                    }
                    .foregroundColor(friend.isActive ? Color.blue : Color.secondary)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 8)
                    .frame(maxWidth:.infinity)
                }
                .padding(.top)
                .task {
                    await friendsFromUrl.loadDataFromUrl(url: source)
                    
                }
            }
            .navigationTitle("Friendsies")
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
