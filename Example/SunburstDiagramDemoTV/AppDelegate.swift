//
//  AppDelegate.swift
//  SunburstDiagramDemoTV
//
//  Created by Ludovic Landry on 6/24/20.
//  Copyright © 2020 Ludovic Landry. All rights reserved.
//

import UIKit
import SunburstDiagram
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let configuration = SunburstConfiguration(nodes: sampleNodes(), calculationMode: .ordinalFromLeaves)
        configuration.expandedArcThickness = 52.0
        configuration.maximumExpandedRingsShownCount = 2
        configuration.maximumRingsShownCount = 4
        
        // Use a UIHostingController as window root view controller.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView: RootView(configuration: configuration))
        self.window = window
        window.makeKeyAndVisible()
        return true
    }

    private func sampleNodes() -> [Node] {
        let nodes = [
            Node(name: "Walking", showName: false, image: Image("walking"), value: 10.0, backgroundColor: .systemBlue),
            Node(name: "Restaurant", showName: false, image: Image("eating"), value: 30.0, backgroundColor: .systemRed, children: [
                Node(name: "Dessert", showName: false, image: Image("croissant"), value: 10.0, backgroundColor: .systemYellow, children: [
                    Node(name: "Creme Brulee", showName: false, value: 3.0, backgroundColor: .systemYellow),
                    Node(name: "Crepes", showName: false, value: 6.0, backgroundColor: .systemYellow, children: [
                        Node(name: "Nutella Crepe", showName: false, value: 4.0, backgroundColor: .systemYellow),
                    ]),
                ]),
                Node(name: "Dinner", showName: false, image: Image("poultry"), value: 5.0, backgroundColor: .systemOrange, children: [
                    Node(name: "Pizza", showName: false, value: 4.0, backgroundColor: .systemOrange),
                ]),
            ]),
            Node(name: "Transport", showName: false, image: Image("sailing"), value: 10.0, backgroundColor: .systemPurple),
            Node(name: "Home", showName: false, image: Image("house"), value: 45.0, backgroundColor: .systemTeal, children: [
                Node(name: "San Francisco", showName: false, image: Image("house"), value: 15.0, backgroundColor: .systemTeal, children: [
                    Node(name: "Twin Peaks", showName: false, value: 3.0, backgroundColor: .systemTeal),
                    Node(name: "Hayes Valley", showName: false, value: 1.5, backgroundColor: .systemTeal),
                    Node(name: "Nob Hill", showName: false, value: 8.0, backgroundColor: .systemTeal),
                ]),
                Node(name: "Lyon", showName: false, image: Image("house"), value: 6.0, backgroundColor: .systemTeal),
            ]),
        ]

        return nodes
    }
}
