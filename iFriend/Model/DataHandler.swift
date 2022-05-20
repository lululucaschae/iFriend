//
//  DataHandler.swift
//  iFriend
//
//  Created by Lucas Chae on 5/18/22.
//

import Foundation



// https://stackoverflow.com/questions/43470859/generic-extension-for-array-in-swift
// Extension on [User] where you replace the original array with new data from URL
extension Array where Element == User {
    mutating func loadDataFromUrl(url: String) async -> Void {
        guard self.isEmpty else {
            return
        }
        guard let friendUrl = URL(string: url) else {
            print("Invalid URL")
            return
        }
        do {
            // fetching data, trashing metadata
            let (data, _) = try await URLSession.shared.data(from: friendUrl)
            
            // checking if data decods in a form of "User"
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                self = decodedResponse
            }
        } catch {
//            fatalError("Failed to decode from bundle. Error: \(error)")
            print("Invalid data")
        }
    }
}

// Previous function I wrote as part of ContentView.
//func loadData() async {
//    guard let friendUrl = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
//        print("Invalid URL")
//        return
//    }
//    do {
//        let (data, _) = try await URLSession.shared.data(from: friendUrl)
//
//        if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
//            friendsFromUrl = decodedResponse.self
//        }
//    } catch {
//        print("Invalid data")
//    }
//
//}
