//
//  CoverSheet_SwiftUI_ExampleApp.swift
//  CoverSheet-SwiftUI-Example
//
//  Created by Colin Walsh on 3/6/23.
//

import SwiftUI
import CoverSheet

@main
struct CoverSheet_SwiftUI_ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DefaultSheetManager())
        }
    }
}
