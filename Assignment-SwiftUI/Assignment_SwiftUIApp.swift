//
//  Assignment_SwiftUIApp.swift
//  Assignment-SwiftUI
//
//  Created by Unthinkable-mac-0040 on 11/06/21.
//

import SwiftUI

@main
struct Assignment_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(navbar: false, loggedInAs: Constant.currentLogin, showTab: true)
        }
    }
}
