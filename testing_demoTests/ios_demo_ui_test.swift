//
//  ios_demo_ui_test.swift
//  ios_demoTests
//
//  Created by jowkame on 10/2/17.
//  Copyright © 2017 jowkame. All rights reserved.
//

import KIF
import Nimble

class UITestSpec: KIFTestCase {
    func testMainScreen() {
        let colorView = tester().waitForView(withAccessibilityLabel: "color_view") as UIView
        var colorComponents: [CGFloat]?

        tester().tapView(withAccessibilityLabel: "red_button")
        
        colorComponents = colorView.backgroundColor!.cgColor.components!
        expect(colorComponents![0]).to(equal(1.0))
        expect(colorComponents![1]).to(equal(0.0))
        expect(colorComponents![2]).to(equal(0.0))
        
        tester().tapView(withAccessibilityLabel: "green_button")
        
        colorComponents = colorView.backgroundColor!.cgColor.components!
        expect(colorComponents![0]).to(equal(0.0))
        expect(colorComponents![1]).to(equal(1.0))
        expect(colorComponents![2]).to(equal(0.0))
        
        tester().tapView(withAccessibilityLabel: "blue_button")
        
        colorComponents = colorView.backgroundColor!.cgColor.components!
        expect(colorComponents![0]).to(equal(0.0))
        expect(colorComponents![1]).to(equal(0.0))
        expect(colorComponents![2]).to(equal(1.0))
        
        
        tester().tapView(withAccessibilityLabel: "green_button")
        tester().tapView(withAccessibilityLabel: "blue_button")
        tester().tapView(withAccessibilityLabel: "red_button")
    }
}
