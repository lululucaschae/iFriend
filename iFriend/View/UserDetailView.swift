//
//  UserDetailView.swift
//  iFriend
//
//  Created by Lucas Chae on 5/18/22.
//

import SwiftUI
extension View {
    func inlineForm(title: String, value: String) -> some View {
        HStack {
            Text("\(title):")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .font(title == "Address" ? .caption : .body)
        }
    }
}
struct UserDetailView: View {
    let source = "https://www.hackingwithswift.com/samples/friendface.json"
    @State private var usersFromUrl = [User]()
    
    let user: User
    
    var body: some View {
        Form {
            Section {
                inlineForm(title: "Name", value: user.name)
                inlineForm(title: "Address", value: user.address)
                inlineForm(title: "Company", value: user.company)
                inlineForm(title: "Age", value: String(user.age))
            } header: {
                Text("User Info")
                    .font(.title3)
                    .padding(.bottom, 4)
            }
            Section {
                
                    ForEach(user.friends, id: \.id) {friend in
                        let thisUser = usersFromUrl.first{$0.id == friend.id}
                        NavigationLink {
                            UserDetailView(user: thisUser ?? user)
                        }
                    label: {Text("\(friend.name)")}
                    }
                    .task {
                        if usersFromUrl.isEmpty {
                            await usersFromUrl.loadDataFromUrl(url: source)
                        }
                       
                    }
                

                
            } header: {
                Text("Friends List")
                    .font(.title3)
                    .padding(.bottom, 4)
            }
            //            Text("Your friend is \(user.friends[0])" as String)
        }
        .navigationTitle("\(user.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User())
    }
}
