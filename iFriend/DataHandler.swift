//
//  DataHandler.swift
//  iFriend
//
//  Created by Lucas Chae on 5/18/22.
//

import Foundation


extension Array where Element == User {
    mutating func loadDataFromUrl(url: String) async -> Void {
        guard let friendUrl = URL(string: url) else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: friendUrl)
            
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                self = decodedResponse
            }
        } catch {
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
