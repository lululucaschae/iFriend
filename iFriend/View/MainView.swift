//
//  ContentView.swift
//  iFriend
//
//  Created by Lucas Chae on 5/18/22.
//

import SwiftUI

struct MainView: View {
    


    var body: some View {
        NavigationView {
            UserListView()
        }
           
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
